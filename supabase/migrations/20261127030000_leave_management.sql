-- Leave management.
--   Annual Leave:  6 working days per calendar year, resets every 1 January.
--   Monthly Leave: 2 working days per month, resets on the 1st of each month.
--   Partial Leave: unpaid, no limit, only when the employee has no Annual
--                  Leave and no Monthly Leave left. Its days reduce salary.
-- Days are counted automatically from the start date to the end date,
-- Monday to Friday. Approving a request deducts the balance in the same
-- step, so tapping Approve twice can never deduct twice.
-- Run once in the SQL Editor after the attendance migrations.

-- ---------------------------------------------------------------------------
-- Leave types
-- ---------------------------------------------------------------------------

create table public.leave_types (
  code text primary key,
  name text not null unique,
  allowance_days numeric(5, 1) check (allowance_days >= 0),
  resets text check (resets in ('year', 'month')),
  paid boolean not null default true,
  -- Only available when every type with an allowance is used up.
  needs_other_leave_used boolean not null default false,
  sort_order integer not null default 0,
  active boolean not null default true,
  check ((allowance_days is null) = (resets is null))
);

insert into public.leave_types
  (code, name, allowance_days, resets, paid, needs_other_leave_used, sort_order)
values
  ('annual', 'Annual Leave', 6, 'year', true, false, 1),
  ('monthly', 'Monthly Leave', 2, 'month', true, false, 2),
  ('partial', 'Partial Leave', null, null, false, true, 3);

alter table public.leave_types enable row level security;
create policy "Signed-in users see leave types" on public.leave_types
  for select to authenticated using (true);
grant select on public.leave_types to authenticated;
grant all on public.leave_types to service_role;

-- ---------------------------------------------------------------------------
-- Leave requests use work_requests with a leave type and a day count
-- ---------------------------------------------------------------------------

alter table public.work_requests
  add column leave_type text references public.leave_types (code),
  add column days numeric(5, 1) check (days > 0),
  add column unpaid boolean not null default false;

-- The old rule only allowed the old leave names, so remove it first.
alter table public.work_requests drop constraint work_requests_check;

-- Existing test requests move to the new types.
update public.work_requests
   set leave_type = case when type = 'Annual leave' then 'annual' else 'monthly' end,
       type = case when type = 'Annual leave' then 'Annual Leave' else 'Monthly Leave' end
 where kind = 'Leave';

alter table public.work_requests add constraint work_requests_check check (
  (kind = 'Leave' and leave_type is not null and end_at >= start_at)
  or (kind = 'Overtime' and type = 'Overtime' and leave_type is null
      and end_at > start_at)
);

-- ---------------------------------------------------------------------------
-- Balances: one row per employee, leave type and period (year or month).
-- A new year or month starts a new row with the full allowance.
-- ---------------------------------------------------------------------------

create table public.leave_balances (
  employee_id text not null references public.employees (id),
  leave_type text not null references public.leave_types (code),
  period_start date not null,
  allowance_days numeric(5, 1) not null,
  used_days numeric(5, 1) not null default 0,
  updated_at timestamptz not null default now(),
  primary key (employee_id, leave_type, period_start),
  check (used_days >= 0 and used_days <= allowance_days)
);

alter table public.leave_balances enable row level security;
create policy "HR sees all balances; employees see their own" on public.leave_balances
  for select to authenticated
  using ((select public.is_hr()) or employee_id = (select public.current_employee_id()));
grant select on public.leave_balances to authenticated;
grant all on public.leave_balances to service_role;

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------

-- Monday-to-Friday days from start to end, inclusive.
create function public.working_days(start_date date, end_date date)
returns integer language sql immutable set search_path = '' as $$
  select count(*)::integer
    from generate_series(start_date::timestamp, end_date::timestamp,
                         interval '1 day') as d
   where extract(isodow from d) < 6;
$$;

create function public.leave_period_start(resets text, on_date date)
returns date language sql immutable set search_path = '' as $$
  select case resets
    when 'year' then date_trunc('year', on_date)::date
    when 'month' then date_trunc('month', on_date)::date
  end;
$$;

-- Days left for one employee, type and date: allowance minus approved days,
-- and minus pending days when include_pending is true.
create function public.leave_left(
  employee text, type_code text, on_date date, include_pending boolean)
returns numeric language sql stable set search_path = '' as $$
  select t.allowance_days
         - coalesce((select b.used_days from public.leave_balances b
                     where b.employee_id = employee and b.leave_type = t.code
                       and b.period_start = public.leave_period_start(t.resets, on_date)), 0)
         - case when include_pending then coalesce((
             select sum(r.days) from public.work_requests r
              where r.employee_id = employee and r.kind = 'Leave'
                and r.leave_type = t.code and r.status = 'Pending'
                and public.leave_period_start(t.resets,
                      (r.start_at at time zone 'Asia/Bangkok')::date)
                    = public.leave_period_start(t.resets, on_date)), 0)
           else 0 end
    from public.leave_types t
   where t.code = type_code and t.allowance_days is not null;
$$;

-- Count the days on existing leave requests.
update public.work_requests
   set days = public.working_days(
         (start_at at time zone 'Asia/Bangkok')::date,
         (end_at at time zone 'Asia/Bangkok')::date)
 where kind = 'Leave' and days is null;

-- ---------------------------------------------------------------------------
-- What the app calls
-- ---------------------------------------------------------------------------

-- Balances for the signed-in employee, or for any employee when HR asks.
create function public.leave_balances_for(
  employee text default null, on_date date default null)
returns table (
  leave_type text, name text, allowance_days numeric, used_days numeric,
  pending_days numeric, left_days numeric, resets text, paid boolean)
language plpgsql stable security definer set search_path = '' as $$
declare
  who text := coalesce(employee, public.current_employee_id());
  as_of date := coalesce(on_date, (now() at time zone 'Asia/Bangkok')::date);
begin
  if who is null
     or (who is distinct from public.current_employee_id() and not public.is_hr()) then
    raise exception 'You can only see your own leave balance.';
  end if;
  return query
  select t.code, t.name, t.allowance_days,
         t.allowance_days - public.leave_left(who, t.code, as_of, false),
         public.leave_left(who, t.code, as_of, false)
           - public.leave_left(who, t.code, as_of, true),
         public.leave_left(who, t.code, as_of, false),
         t.resets, t.paid
    from public.leave_types t
   where t.active and t.allowance_days is not null
   order by t.sort_order;
end;
$$;

-- An employee asks for leave. The days are counted here.
create function public.request_leave(
  type_code text, start_date date, end_date date, reason text)
returns public.work_requests
language plpgsql security definer set search_path = '' as $$
declare
  me text := public.current_employee_id();
  t public.leave_types;
  day_count integer;
  other record;
  saved public.work_requests;
begin
  if me is null then
    raise exception 'Only active employees can request leave.';
  end if;
  select * into t from public.leave_types where code = type_code and active;
  if not found then
    raise exception 'Choose a leave type.';
  end if;
  if start_date is null or end_date is null or end_date < start_date then
    raise exception 'Choose a start date and an end date on or after it.';
  end if;
  if length(trim(coalesce(reason, ''))) = 0 then
    raise exception 'Enter a reason for your leave.';
  end if;
  if t.resets = 'year' and date_trunc('year', start_date) <> date_trunc('year', end_date) then
    raise exception '% must start and end in the same year.', t.name;
  end if;
  if t.resets = 'month' and date_trunc('month', start_date) <> date_trunc('month', end_date) then
    raise exception '% must start and end in the same month.', t.name;
  end if;

  day_count := public.working_days(start_date, end_date);
  if day_count = 0 then
    raise exception 'Choose at least one working day (Monday to Friday).';
  end if;

  if exists (select 1 from public.work_requests r
              where r.employee_id = me and r.kind = 'Leave'
                and r.status in ('Pending', 'Approved')
                and (r.start_at at time zone 'Asia/Bangkok')::date <= end_date
                and (r.end_at at time zone 'Asia/Bangkok')::date >= start_date) then
    raise exception 'You already have leave on some of these dates.';
  end if;

  if t.allowance_days is not null then
    if public.leave_left(me, t.code, start_date, true) < day_count then
      raise exception 'You have % days of % left for this period.',
        trim_scale(public.leave_left(me, t.code, start_date, true)), t.name;
    end if;
  end if;

  if t.needs_other_leave_used then
    for other in
      select o.name, public.leave_left(me, o.code, start_date, true) as left_days
        from public.leave_types o
       where o.active and o.allowance_days is not null
    loop
      if other.left_days > 0 then
        raise exception 'Use your % first. You have % days left.',
          other.name, trim_scale(other.left_days);
      end if;
    end loop;
  end if;

  insert into public.work_requests
    (employee_id, kind, type, leave_type, start_at, end_at, reason, days, unpaid)
  values
    (me, 'Leave', t.name, t.code,
     start_date::timestamp at time zone 'Asia/Bangkok',
     end_date::timestamp at time zone 'Asia/Bangkok',
     trim(reason), day_count, not t.paid)
  returning * into saved;
  return saved;
end;
$$;

-- HR approves or rejects. The request row is locked and the balance is
-- deducted in the same transaction, so a second tap finds it already decided.
create function public.decide_leave(request_id uuid, decision text)
returns public.work_requests
language plpgsql security definer set search_path = '' as $$
declare
  r public.work_requests;
  t public.leave_types;
  period date;
  other record;
  saved public.work_requests;
begin
  if not public.is_hr() then
    raise exception 'HR access required.';
  end if;
  if decision not in ('Approved', 'Rejected') then
    raise exception 'Invalid decision.';
  end if;
  select * into r from public.work_requests
   where id = request_id and kind = 'Leave'
   for update;
  if not found then
    raise exception 'Leave request not found.';
  end if;
  if r.status <> 'Pending' then
    raise exception 'This request has already been resolved.';
  end if;
  if r.employee_id = public.current_employee_id() then
    raise exception 'Another HR administrator must decide this request.';
  end if;

  if decision = 'Approved' then
    select * into t from public.leave_types where code = r.leave_type;
    if t.allowance_days is not null then
      period := public.leave_period_start(t.resets,
                  (r.start_at at time zone 'Asia/Bangkok')::date);
      insert into public.leave_balances
        (employee_id, leave_type, period_start, allowance_days)
      values (r.employee_id, t.code, period, t.allowance_days)
      on conflict do nothing;
      update public.leave_balances b
         set used_days = b.used_days + r.days, updated_at = now()
       where b.employee_id = r.employee_id and b.leave_type = t.code
         and b.period_start = period
         and b.used_days + r.days <= b.allowance_days;
      if not found then
        raise exception 'Not enough % left to approve this request.', t.name;
      end if;
    end if;
    if t.needs_other_leave_used then
      for other in
        select o.name,
               public.leave_left(r.employee_id, o.code,
                 (r.start_at at time zone 'Asia/Bangkok')::date, false) as left_days
          from public.leave_types o
         where o.active and o.allowance_days is not null
      loop
        if other.left_days > 0 then
          raise exception 'The employee still has % days of %. Partial Leave needs it used first.',
            trim_scale(other.left_days), other.name;
        end if;
      end loop;
    end if;
  end if;

  update public.work_requests
     set status = decision, decided_by = auth.uid(), decided_at = now()
   where id = r.id
  returning * into saved;
  return saved;
end;
$$;

-- The employee cancels their own pending request. Nothing was deducted yet.
create function public.cancel_leave(request_id uuid)
returns public.work_requests
language plpgsql security definer set search_path = '' as $$
declare
  saved public.work_requests;
begin
  update public.work_requests r
     set status = 'Cancelled', decided_at = now()
   where r.id = request_id and r.kind = 'Leave'
     and r.employee_id = public.current_employee_id()
     and r.status = 'Pending'
  returning * into saved;
  if not found then
    raise exception 'Only your own pending requests can be cancelled.';
  end if;
  return saved;
end;
$$;

-- ---------------------------------------------------------------------------
-- Leave can only change through the functions above
-- ---------------------------------------------------------------------------

create or replace function public.guard_work_request()
returns trigger language plpgsql set search_path = '' as $$
begin
  if public.is_trusted_role() then
    return new;
  end if;
  if new.kind = 'Leave' or (tg_op = 'UPDATE' and old.kind = 'Leave') then
    raise exception 'Use the leave request screens to change leave.';
  end if;
  if tg_op = 'INSERT' then
    if new.status <> 'Pending' or new.decided_by is not null or new.decided_at is not null then
      raise exception 'New requests must be Pending.';
    end if;
    return new;
  end if;
  if (to_jsonb(new) - array['status', 'decided_by', 'decided_at'])
     is distinct from (to_jsonb(old) - array['status', 'decided_by', 'decided_at']) then
    raise exception 'Only the request status can change.';
  end if;
  if old.status <> 'Pending' then
    raise exception 'This request has already been resolved.';
  end if;
  if new.status = 'Cancelled' then
    if old.employee_id is distinct from public.current_employee_id() then
      raise exception 'Only the owner can cancel.';
    end if;
  elsif new.status in ('Approved', 'Rejected') then
    if not public.is_hr() then
      raise exception 'HR access required.';
    end if;
    if old.employee_id = public.current_employee_id() then
      raise exception 'Another HR administrator must decide this request.';
    end if;
  else
    raise exception 'Invalid decision.';
  end if;
  new.decided_by := auth.uid();
  new.decided_at := now();
  return new;
end;
$$;

-- ---------------------------------------------------------------------------
-- Permissions
-- ---------------------------------------------------------------------------

revoke execute on function public.working_days(date, date),
  public.leave_period_start(text, date),
  public.leave_left(text, text, date, boolean)
  from public, anon, authenticated;
revoke execute on function public.leave_balances_for(text, date),
  public.request_leave(text, date, date, text),
  public.decide_leave(uuid, text),
  public.cancel_leave(uuid)
  from public, anon;
grant execute on function public.leave_balances_for(text, date),
  public.request_leave(text, date, date, text),
  public.decide_leave(uuid, text),
  public.cancel_leave(uuid)
  to authenticated;

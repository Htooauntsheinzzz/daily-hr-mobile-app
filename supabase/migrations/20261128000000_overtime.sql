-- Overtime.
-- Employees save the work date, start time, end time and reason. Supabase
-- calculates the hours. HR approves or rejects; on approval the pay is fixed:
--   Overtime Pay = Hourly Rate × Overtime Multiplier × Overtime Hours
-- Hourly Rate is the employee's overtime_rate (Pay settings in the app).
-- The multiplier is in overtime_settings (1.5 to start), editable in the
-- Table Editor. Approved entries appear in the payroll_overtime view.
-- Run once in the SQL Editor after the leave migration.

-- ---------------------------------------------------------------------------
-- Settings and request columns
-- ---------------------------------------------------------------------------

create table public.overtime_settings (
  id boolean primary key default true check (id),
  multiplier numeric(4, 2) not null default 1.5 check (multiplier >= 1),
  max_hours numeric(4, 2) not null default 12 check (max_hours > 0),
  updated_at timestamptz not null default now()
);
insert into public.overtime_settings default values;

alter table public.overtime_settings enable row level security;
create policy "Signed-in users see overtime settings" on public.overtime_settings
  for select to authenticated using (true);
grant select on public.overtime_settings to authenticated;
grant all on public.overtime_settings to service_role;

alter table public.work_requests
  add column hours numeric(5, 2) check (hours > 0),
  add column hourly_rate numeric(12, 2) check (hourly_rate >= 0),
  add column multiplier numeric(4, 2) check (multiplier >= 1),
  add column overtime_pay numeric(12, 2) check (overtime_pay >= 0);

-- ---------------------------------------------------------------------------
-- What the app calls
-- ---------------------------------------------------------------------------

create function public.request_overtime(
  work_date date, start_time time, end_time time, reason text)
returns public.work_requests
language plpgsql security definer set search_path = '' as $$
declare
  me text := public.current_employee_id();
  starts timestamptz;
  ends timestamptz;
  worked numeric;
  limit_hours numeric;
  saved public.work_requests;
begin
  if me is null then
    raise exception 'Only active employees can request overtime.';
  end if;
  if work_date is null or start_time is null or end_time is null then
    raise exception 'Choose the work date, start time and end time.';
  end if;
  if length(trim(coalesce(reason, ''))) = 0 then
    raise exception 'Enter a reason for the overtime.';
  end if;
  if end_time <= start_time then
    raise exception 'End time must be after start time on the same day.';
  end if;

  starts := (work_date + start_time) at time zone 'Asia/Bangkok';
  ends := (work_date + end_time) at time zone 'Asia/Bangkok';
  worked := round((extract(epoch from (ends - starts)) / 3600)::numeric, 2);
  select max_hours into limit_hours from public.overtime_settings;
  if worked > coalesce(limit_hours, 12) then
    raise exception 'Overtime can be at most % hours in one request.',
      trim_scale(coalesce(limit_hours, 12));
  end if;

  if exists (select 1 from public.work_requests r
              where r.employee_id = me and r.kind = 'Overtime'
                and r.status in ('Pending', 'Approved')
                and r.start_at < ends and r.end_at > starts) then
    raise exception 'You already have overtime at this time.';
  end if;

  insert into public.work_requests
    (employee_id, kind, type, start_at, end_at, reason, hours)
  values
    (me, 'Overtime', 'Overtime', starts, ends, trim(reason), worked)
  returning * into saved;
  return saved;
end;
$$;

-- HR approves or rejects. The row is locked, so a second tap finds it
-- already decided. Approval fixes the rate, multiplier and pay.
create function public.decide_overtime(request_id uuid, decision text)
returns public.work_requests
language plpgsql security definer set search_path = '' as $$
declare
  r public.work_requests;
  rate numeric;
  factor numeric;
  saved public.work_requests;
begin
  if not public.is_hr() then
    raise exception 'HR access required.';
  end if;
  if decision not in ('Approved', 'Rejected') then
    raise exception 'Invalid decision.';
  end if;
  select * into r from public.work_requests
   where id = request_id and kind = 'Overtime'
   for update;
  if not found then
    raise exception 'Overtime request not found.';
  end if;
  if r.status <> 'Pending' then
    raise exception 'This request has already been resolved.';
  end if;
  if r.employee_id = public.current_employee_id() then
    raise exception 'Another HR administrator must decide this request.';
  end if;

  if decision = 'Approved' then
    select e.overtime_rate into rate from public.employees e where e.id = r.employee_id;
    select s.multiplier into factor from public.overtime_settings s;
    factor := coalesce(factor, 1.5);
    update public.work_requests
       set status = 'Approved', decided_by = auth.uid(), decided_at = now(),
           hourly_rate = rate, multiplier = factor,
           overtime_pay = round(rate * factor * r.hours, 2)
     where id = r.id
    returning * into saved;
  else
    update public.work_requests
       set status = 'Rejected', decided_by = auth.uid(), decided_at = now()
     where id = r.id
    returning * into saved;
  end if;
  return saved;
end;
$$;

create function public.cancel_overtime(request_id uuid)
returns public.work_requests
language plpgsql security definer set search_path = '' as $$
declare
  saved public.work_requests;
begin
  update public.work_requests r
     set status = 'Cancelled', decided_at = now()
   where r.id = request_id and r.kind = 'Overtime'
     and r.employee_id = public.current_employee_id()
     and r.status = 'Pending'
  returning * into saved;
  if not found then
    raise exception 'Only your own pending requests can be cancelled.';
  end if;
  return saved;
end;
$$;

-- Approved overtime for payroll, one row per entry. Row-level security on
-- work_requests still applies (HR sees all, employees their own).
create view public.payroll_overtime with (security_invoker = true) as
select r.id, r.employee_id,
       to_char(r.start_at at time zone 'Asia/Bangkok', 'YYYY-MM') as month,
       (r.start_at at time zone 'Asia/Bangkok')::date as work_date,
       r.hours, r.hourly_rate, r.multiplier, r.overtime_pay
  from public.work_requests r
 where r.kind = 'Overtime' and r.status = 'Approved';
grant select on public.payroll_overtime to authenticated, service_role;

-- ---------------------------------------------------------------------------
-- Requests now only change through the functions
-- ---------------------------------------------------------------------------

drop policy "Employees submit their own requests" on public.work_requests;
drop policy "HR decides; employees cancel their own" on public.work_requests;
revoke insert, update, delete on public.work_requests from authenticated;

create or replace function public.guard_work_request()
returns trigger language plpgsql set search_path = '' as $$
begin
  if public.is_trusted_role() then
    return new;
  end if;
  raise exception 'Use the leave and overtime screens to change requests.';
end;
$$;

revoke execute on function public.request_overtime(date, time, time, text),
  public.decide_overtime(uuid, text),
  public.cancel_overtime(uuid)
  from public, anon;
grant execute on function public.request_overtime(date, time, time, text),
  public.decide_overtime(uuid, text),
  public.cancel_overtime(uuid)
  to authenticated;

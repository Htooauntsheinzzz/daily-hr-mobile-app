-- Daily HR schema for Supabase.
-- Paste into the Supabase SQL Editor and run once. It creates the tables,
-- the row-level security policies, and the triggers that enforce employee
-- ownership, HR-only decisions, and published-payslip immutability.
--
-- Roles:
--   * HR administrators are auth users listed in public.hr_admins.
--   * Employees are auth users linked to public.employees.user_id. A new
--     auth user whose email matches an employee row is linked automatically.
--
-- Requests from the app run as the `authenticated` role. The SQL Editor and
-- Edge Functions using the secret key are trusted and skip the guard checks.

-- ---------------------------------------------------------------------------
-- Tables
-- ---------------------------------------------------------------------------

create table public.hr_admins (
  user_id uuid primary key references auth.users (id) on delete cascade,
  created_at timestamptz not null default now()
);

create table public.employees (
  id text primary key check (id ~ '^DH-[0-9]{3,}$'),
  user_id uuid unique references auth.users (id) on delete set null,
  name text not null check (length(trim(name)) > 0),
  email text not null unique check (email = lower(email)),
  mobile text not null default '',
  position text not null,
  department text not null,
  personal_email text not null default '',
  active boolean not null default true,
  base_salary numeric(12, 2) not null default 30000 check (base_salary >= 0),
  overtime_rate numeric(12, 2) not null default 250 check (overtime_rate >= 0),
  insurance numeric(12, 2) not null default 750 check (insurance >= 0),
  advance numeric(12, 2) not null default 0 check (advance >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Leave and overtime requests share one table, as in the app.
create table public.work_requests (
  id uuid primary key default gen_random_uuid(),
  employee_id text not null references public.employees (id),
  kind text not null check (kind in ('Leave', 'Overtime')),
  type text not null,
  start_at timestamptz not null,
  end_at timestamptz not null,
  reason text not null default '',
  status text not null default 'Pending'
    check (status in ('Pending', 'Approved', 'Rejected', 'Cancelled')),
  decided_by uuid references auth.users (id),
  decided_at timestamptz,
  created_at timestamptz not null default now(),
  check (
    (kind = 'Leave' and type in ('Annual leave', 'Sick leave', 'Personal leave')
      and end_at >= start_at)
    or (kind = 'Overtime' and type = 'Overtime' and end_at > start_at)
  )
);
create index work_requests_employee_idx on public.work_requests (employee_id, kind, status);

-- Attendance: one shift per employee per Bangkok calendar day.
create table public.shifts (
  id uuid primary key default gen_random_uuid(),
  employee_id text not null references public.employees (id),
  start_at timestamptz not null default now(),
  end_at timestamptz,
  created_at timestamptz not null default now(),
  check (end_at is null or end_at > start_at)
);
create unique index shifts_one_per_day_idx
  on public.shifts (employee_id, ((start_at at time zone 'Asia/Bangkok')::date));

create table public.payslips (
  employee_id text not null references public.employees (id),
  month text not null check (month ~ '^[0-9]{4}-(0[1-9]|1[0-2])$'),
  base_salary numeric(12, 2) not null check (base_salary >= 0),
  overtime_rate numeric(12, 2) not null check (overtime_rate >= 0),
  overtime_hours numeric(8, 2) not null default 0 check (overtime_hours >= 0),
  insurance numeric(12, 2) not null default 0 check (insurance >= 0),
  advance numeric(12, 2) not null default 0 check (advance >= 0),
  overtime_request_ids uuid[] not null default '{}',
  overtime_pay numeric(12, 2)
    generated always as (round(overtime_hours * overtime_rate, 2)) stored,
  net_pay numeric(12, 2) generated always as (
    base_salary + round(overtime_hours * overtime_rate, 2) - insurance - advance
  ) stored,
  published boolean not null default false,
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (employee_id, month),
  check (
    not published
    or base_salary + round(overtime_hours * overtime_rate, 2) - insurance - advance >= 0
  )
);

create table public.notices (
  id uuid primary key default gen_random_uuid(),
  employee_id text not null references public.employees (id),
  title text not null,
  kind text not null check (kind in ('request', 'payslip')),
  target text not null,
  created_at timestamptz not null default now()
);
create index notices_employee_idx on public.notices (employee_id, created_at desc);

-- ---------------------------------------------------------------------------
-- Helper functions
-- ---------------------------------------------------------------------------

-- True for the SQL Editor, migrations and the secret key; false for app users.
create function public.is_trusted_role()
returns boolean language sql stable set search_path = '' as $$
  select current_user not in ('authenticated', 'anon');
$$;

create function public.is_hr()
returns boolean language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.hr_admins where user_id = (select auth.uid()));
$$;

-- The signed-in user's active employee id, or null.
create function public.current_employee_id()
returns text language sql stable security definer set search_path = '' as $$
  select id from public.employees where user_id = (select auth.uid()) and active;
$$;

-- ---------------------------------------------------------------------------
-- Guard triggers
-- ---------------------------------------------------------------------------

create function public.touch_updated_at()
returns trigger language plpgsql set search_path = '' as $$
begin
  new.updated_at := now();
  return new;
end;
$$;

-- Employees may only edit their own mobile number and personal email.
create function public.guard_employee_update()
returns trigger language plpgsql set search_path = '' as $$
begin
  if public.is_trusted_role() or public.is_hr() then
    return new;
  end if;
  if (to_jsonb(new) - array['mobile', 'personal_email', 'updated_at'])
     is distinct from (to_jsonb(old) - array['mobile', 'personal_email', 'updated_at']) then
    raise exception 'Only HR can change this employee information.';
  end if;
  return new;
end;
$$;

-- New requests start as Pending. Afterwards only the status may change:
-- the owner can cancel, HR can approve or reject, and only while Pending.
create function public.guard_work_request()
returns trigger language plpgsql set search_path = '' as $$
begin
  if public.is_trusted_role() then
    return new;
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
  else
    raise exception 'Invalid decision.';
  end if;
  new.decided_by := auth.uid();
  new.decided_at := now();
  return new;
end;
$$;

-- Check-in and check-out times come from the server clock, not the phone.
create function public.guard_shift()
returns trigger language plpgsql set search_path = '' as $$
begin
  if public.is_trusted_role() then
    return new;
  end if;
  if tg_op = 'INSERT' then
    new.start_at := now();
    new.end_at := null;
    return new;
  end if;
  if old.end_at is not null then
    raise exception 'This shift is already checked out.';
  end if;
  if new.employee_id is distinct from old.employee_id
     or new.start_at is distinct from old.start_at
     or new.end_at is null then
    raise exception 'Only check-out is allowed.';
  end if;
  new.end_at := now();
  return new;
end;
$$;

-- Published payslips are immutable snapshots, for everyone.
create function public.guard_payslip()
returns trigger language plpgsql set search_path = '' as $$
begin
  if tg_op in ('UPDATE', 'DELETE') and old.published then
    raise exception 'This payslip is already published.';
  end if;
  if tg_op = 'DELETE' then
    return old;
  end if;
  if new.published then
    new.published_at := now();
  end if;
  new.updated_at := now();
  return new;
end;
$$;

-- Notices are written by the database, so the app never inserts them.
create function public.notify_request_decision()
returns trigger language plpgsql security definer set search_path = '' as $$
begin
  if new.status in ('Approved', 'Rejected') and old.status = 'Pending' then
    insert into public.notices (employee_id, title, kind, target)
    values (
      new.employee_id,
      new.kind || ' ' || lower(new.status) || ' · '
        || to_char(new.start_at at time zone 'Asia/Bangkok', 'FMDD FMMonth YYYY'),
      'request',
      new.id::text
    );
  end if;
  return new;
end;
$$;

create function public.notify_payslip_published()
returns trigger language plpgsql security definer set search_path = '' as $$
begin
  if new.published and (tg_op = 'INSERT' or not old.published) then
    insert into public.notices (employee_id, title, kind, target)
    values (
      new.employee_id,
      'Payslip published · ' || to_char((new.month || '-01')::date, 'FMMonth YYYY'),
      'payslip',
      new.employee_id || '/' || new.month
    );
  end if;
  return new;
end;
$$;

-- Link a new auth user to the employee row with the same email.
create function public.link_employee_account()
returns trigger language plpgsql security definer set search_path = '' as $$
begin
  update public.employees
     set user_id = new.id
   where email = lower(new.email) and user_id is null;
  return new;
end;
$$;

-- And link a new employee row to an existing auth user with the same email.
create function public.link_existing_account()
returns trigger language plpgsql security definer set search_path = '' as $$
begin
  if new.user_id is null then
    select id into new.user_id from auth.users where lower(email) = new.email;
  end if;
  return new;
end;
$$;

create trigger employees_link before insert on public.employees
  for each row execute function public.link_existing_account();
create trigger employees_touch before update on public.employees
  for each row execute function public.touch_updated_at();
create trigger employees_guard before update on public.employees
  for each row execute function public.guard_employee_update();
create trigger work_requests_guard before insert or update on public.work_requests
  for each row execute function public.guard_work_request();
create trigger work_requests_notify after update on public.work_requests
  for each row execute function public.notify_request_decision();
create trigger shifts_guard before insert or update on public.shifts
  for each row execute function public.guard_shift();
create trigger payslips_guard before insert or update or delete on public.payslips
  for each row execute function public.guard_payslip();
create trigger payslips_notify after insert or update on public.payslips
  for each row execute function public.notify_payslip_published();
create trigger on_auth_user_created after insert on auth.users
  for each row execute function public.link_employee_account();

-- ---------------------------------------------------------------------------
-- Row-level security
-- ---------------------------------------------------------------------------

alter table public.hr_admins enable row level security;
alter table public.employees enable row level security;
alter table public.work_requests enable row level security;
alter table public.shifts enable row level security;
alter table public.payslips enable row level security;
alter table public.notices enable row level security;

-- Nothing is readable without signing in.
revoke all on public.hr_admins, public.employees, public.work_requests,
  public.shifts, public.payslips, public.notices from anon;

create policy "Users see their own HR membership" on public.hr_admins
  for select to authenticated using (user_id = (select auth.uid()));

create policy "HR sees all employees; employees see themselves" on public.employees
  for select to authenticated
  using ((select public.is_hr()) or id = (select public.current_employee_id()));
create policy "HR adds employees" on public.employees
  for insert to authenticated with check ((select public.is_hr()));
create policy "HR or the employee updates the record" on public.employees
  for update to authenticated
  using ((select public.is_hr()) or id = (select public.current_employee_id()))
  with check ((select public.is_hr()) or id = (select public.current_employee_id()));

create policy "HR sees all requests; employees see their own" on public.work_requests
  for select to authenticated
  using ((select public.is_hr()) or employee_id = (select public.current_employee_id()));
create policy "Employees submit their own requests" on public.work_requests
  for insert to authenticated
  with check (employee_id = (select public.current_employee_id()));
create policy "HR decides; employees cancel their own" on public.work_requests
  for update to authenticated
  using ((select public.is_hr()) or employee_id = (select public.current_employee_id()));

create policy "HR sees all shifts; employees see their own" on public.shifts
  for select to authenticated
  using ((select public.is_hr()) or employee_id = (select public.current_employee_id()));
create policy "Employees check in" on public.shifts
  for insert to authenticated
  with check (employee_id = (select public.current_employee_id()));
create policy "Employees check out" on public.shifts
  for update to authenticated
  using (employee_id = (select public.current_employee_id()));

create policy "HR sees all payslips; employees see their published ones" on public.payslips
  for select to authenticated
  using (
    (select public.is_hr())
    or (published and employee_id = (select public.current_employee_id()))
  );
create policy "HR prepares payslips" on public.payslips
  for insert to authenticated with check ((select public.is_hr()));
create policy "HR edits and publishes drafts" on public.payslips
  for update to authenticated using ((select public.is_hr()));
create policy "HR deletes drafts" on public.payslips
  for delete to authenticated using ((select public.is_hr()));

create policy "Employees see their own notices" on public.notices
  for select to authenticated
  using ((select public.is_hr()) or employee_id = (select public.current_employee_id()));

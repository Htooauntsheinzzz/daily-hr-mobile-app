-- Payroll.
-- A payslip covers one calendar month (Bangkok time) for one employee:
--
--   Working days      = Monday to Friday in the month
--   Daily rate        = Base salary ÷ working days
--   Overtime pay      = sum of approved overtime in the month
--                       (each entry: Hourly Rate × Multiplier × Hours,
--                        fixed when HR approved it)
--   Unpaid leave      = approved Partial Leave working days in the month
--                       × daily rate
--   Absences          = working days with no check-in and no approved leave
--                       × daily rate (see payroll_settings)
--   Gross pay         = Base salary + Overtime pay
--   Total deductions  = Insurance + Salary advance + Unpaid leave + Absences
--   Net pay           = Gross pay − Total deductions (must not be negative
--                       to publish)
--
-- Annual Leave and Monthly Leave are paid, so they are never deducted.
-- HR prepares a draft, checks it, then publishes. Publishing recalculates
-- and refuses if anything changed since the draft. Published payslips and
-- their line items keep the amounts used at publication forever.
-- Run once in the SQL Editor after the overtime migration.

-- ---------------------------------------------------------------------------
-- Settings
-- ---------------------------------------------------------------------------

create table public.payroll_settings (
  id boolean primary key default true check (id),
  -- Deduct working days with no check-in and no approved leave.
  deduct_absences boolean not null default true,
  -- Days before this date never count as absences (attendance wasn't
  -- tracked in the app yet).
  absences_from date not null default (now() at time zone 'Asia/Bangkok')::date,
  updated_at timestamptz not null default now()
);
insert into public.payroll_settings default values;

alter table public.payroll_settings enable row level security;
create policy "Signed-in users see payroll settings" on public.payroll_settings
  for select to authenticated using (true);
grant select on public.payroll_settings to authenticated;
grant all on public.payroll_settings to service_role;

-- ---------------------------------------------------------------------------
-- Payslips: stored amounts instead of formulas, so they never change later
-- ---------------------------------------------------------------------------

alter table public.payslips drop constraint payslips_check;
alter table public.payslips drop column overtime_pay;
alter table public.payslips drop column net_pay;

alter table public.payslips
  add column multiplier numeric(4, 2) not null default 1,
  add column overtime_pay numeric(12, 2) not null default 0,
  add column working_days integer not null default 0,
  add column daily_rate numeric(12, 2) not null default 0,
  add column unpaid_leave_days numeric(5, 1) not null default 0,
  add column unpaid_leave_deduction numeric(12, 2) not null default 0,
  add column absent_days integer not null default 0,
  add column absence_deduction numeric(12, 2) not null default 0,
  add column gross_pay numeric(12, 2) not null default 0,
  add column total_deductions numeric(12, 2) not null default 0,
  add column net_pay numeric(12, 2) not null default 0,
  add column prepared_by uuid references auth.users (id),
  add column prepared_at timestamptz,
  add column published_by uuid references auth.users (id),
  add constraint payslips_net_check check (not published or net_pay >= 0);

create table public.payslip_lines (
  employee_id text not null,
  month text not null,
  position integer not null,
  kind text not null check (kind in ('earning', 'deduction')),
  label text not null,
  detail text not null default '',
  amount numeric(12, 2) not null check (amount >= 0),
  primary key (employee_id, month, position),
  foreign key (employee_id, month)
    references public.payslips (employee_id, month) on delete cascade
);

alter table public.payslip_lines enable row level security;
create policy "HR sees all lines; employees see their published ones" on public.payslip_lines
  for select to authenticated
  using (
    (select public.is_hr())
    or exists (select 1 from public.payslips p
               where p.employee_id = payslip_lines.employee_id
                 and p.month = payslip_lines.month
                 and p.published
                 and p.employee_id = (select public.current_employee_id()))
  );
grant select on public.payslip_lines to authenticated;
grant all on public.payslip_lines to service_role;

-- Fill in the stored amounts for the payslips that already exist.
alter table public.payslips disable trigger payslips_guard;
update public.payslips
   set overtime_pay = round(overtime_hours * overtime_rate * multiplier, 2),
       working_days = public.working_days(
         (month || '-01')::date,
         ((month || '-01')::date + interval '1 month - 1 day')::date),
       gross_pay = base_salary + round(overtime_hours * overtime_rate * multiplier, 2),
       total_deductions = insurance + advance,
       net_pay = base_salary + round(overtime_hours * overtime_rate * multiplier, 2)
                 - insurance - advance;
update public.payslips set daily_rate = round(base_salary / nullif(working_days, 0), 2);
alter table public.payslips enable trigger payslips_guard;

-- Payslips now only change through prepare_payslip and publish_payslip.
drop policy "HR prepares payslips" on public.payslips;
drop policy "HR edits and publishes drafts" on public.payslips;
drop policy "HR deletes drafts" on public.payslips;
revoke insert, update, delete on public.payslips from authenticated;

-- ---------------------------------------------------------------------------
-- The calculation
-- ---------------------------------------------------------------------------

create function public.payroll_calculation(employee text, pay_month text)
returns jsonb
language plpgsql stable set search_path = '' as $$
declare
  e public.employees;
  settings public.payroll_settings;
  month_start date;
  month_end date;
  today date := (now() at time zone 'Asia/Bangkok')::date;
  absence_start date;
  absence_end date;
  work_days integer;
  daily numeric;
  ot_hours numeric;
  ot_pay numeric;
  ot_ids uuid[];
  factor numeric;
  unpaid_days numeric;
  absent integer := 0;
  unpaid_amount numeric;
  absent_amount numeric;
  gross numeric;
  deductions numeric;
begin
  if pay_month !~ '^[0-9]{4}-(0[1-9]|1[0-2])$' then
    raise exception 'Choose a pay period.';
  end if;
  select * into e from public.employees where id = employee;
  if not found then
    raise exception 'Employee not found.';
  end if;
  select * into settings from public.payroll_settings;
  month_start := (pay_month || '-01')::date;
  month_end := (month_start + interval '1 month - 1 day')::date;
  work_days := public.working_days(month_start, month_end);
  daily := round(e.base_salary / work_days, 2);

  -- Approved overtime whose work date is in this month.
  select coalesce(sum(r.hours), 0), coalesce(sum(r.overtime_pay), 0),
         coalesce(array_agg(r.id order by r.start_at), '{}')
    into ot_hours, ot_pay, ot_ids
    from public.work_requests r
   where r.employee_id = employee and r.kind = 'Overtime'
     and r.status = 'Approved'
     and to_char(r.start_at at time zone 'Asia/Bangkok', 'YYYY-MM') = pay_month;
  select multiplier into factor from public.overtime_settings;

  -- Approved unpaid (Partial) leave, counting only its days in this month.
  select coalesce(sum(public.working_days(
           greatest((r.start_at at time zone 'Asia/Bangkok')::date, month_start),
           least((r.end_at at time zone 'Asia/Bangkok')::date, month_end))), 0)
    into unpaid_days
    from public.work_requests r
   where r.employee_id = employee and r.kind = 'Leave'
     and r.status = 'Approved' and r.unpaid
     and (r.start_at at time zone 'Asia/Bangkok')::date <= month_end
     and (r.end_at at time zone 'Asia/Bangkok')::date >= month_start;

  -- Absences: past working days with no check-in and no approved leave.
  if coalesce(settings.deduct_absences, false) then
    absence_start := greatest(month_start, settings.absences_from,
                              (e.created_at at time zone 'Asia/Bangkok')::date);
    absence_end := least(month_end, today - 1);
    if absence_start <= absence_end then
      select count(*)::integer into absent
        from generate_series(absence_start::timestamp, absence_end::timestamp,
                             interval '1 day') as d
       where extract(isodow from d) < 6
         and not exists (select 1 from public.shifts s
                          where s.employee_id = employee and s.work_date = d::date)
         and not exists (select 1 from public.work_requests r
                          where r.employee_id = employee and r.kind = 'Leave'
                            and r.status = 'Approved'
                            and d::date between (r.start_at at time zone 'Asia/Bangkok')::date
                                            and (r.end_at at time zone 'Asia/Bangkok')::date);
    end if;
  end if;

  unpaid_amount := round(e.base_salary * unpaid_days / work_days, 2);
  absent_amount := round(e.base_salary * absent / work_days, 2);
  gross := e.base_salary + ot_pay;
  deductions := e.insurance + e.advance + unpaid_amount + absent_amount;

  return jsonb_build_object(
    'employee_id', e.id,
    'month', pay_month,
    'base_salary', e.base_salary,
    'overtime_rate', e.overtime_rate,
    'multiplier', coalesce(factor, 1.5),
    'overtime_hours', ot_hours,
    'overtime_pay', ot_pay,
    'overtime_request_ids', to_jsonb(ot_ids),
    'insurance', e.insurance,
    'advance', e.advance,
    'working_days', work_days,
    'daily_rate', daily,
    'unpaid_leave_days', unpaid_days,
    'unpaid_leave_deduction', unpaid_amount,
    'absent_days', absent,
    'absence_deduction', absent_amount,
    'gross_pay', gross,
    'total_deductions', deductions,
    'net_pay', gross - deductions
  );
end;
$$;

-- ---------------------------------------------------------------------------
-- What the app calls
-- ---------------------------------------------------------------------------

-- HR prepares (or recalculates) a draft and its line items.
create function public.prepare_payslip(employee text, pay_month text)
returns public.payslips
language plpgsql security definer set search_path = '' as $$
declare
  c jsonb;
  saved public.payslips;
begin
  if not public.is_hr() then
    raise exception 'HR access required.';
  end if;
  if employee = public.current_employee_id() then
    raise exception 'Another HR administrator must prepare your payslip.';
  end if;
  if not exists (select 1 from public.employees where id = employee and active) then
    raise exception 'This employee is inactive.';
  end if;
  if exists (select 1 from public.payslips
              where employee_id = employee and month = pay_month and published) then
    raise exception 'This payslip is already published.';
  end if;

  c := public.payroll_calculation(employee, pay_month);

  insert into public.payslips as p (
    employee_id, month, base_salary, overtime_rate, multiplier,
    overtime_hours, overtime_pay, overtime_request_ids, insurance, advance,
    working_days, daily_rate, unpaid_leave_days, unpaid_leave_deduction,
    absent_days, absence_deduction, gross_pay, total_deductions, net_pay,
    published, prepared_by, prepared_at)
  values (
    employee, pay_month, (c->>'base_salary')::numeric,
    (c->>'overtime_rate')::numeric, (c->>'multiplier')::numeric,
    (c->>'overtime_hours')::numeric, (c->>'overtime_pay')::numeric,
    array(select jsonb_array_elements_text(c->'overtime_request_ids'))::uuid[],
    (c->>'insurance')::numeric, (c->>'advance')::numeric,
    (c->>'working_days')::integer, (c->>'daily_rate')::numeric,
    (c->>'unpaid_leave_days')::numeric, (c->>'unpaid_leave_deduction')::numeric,
    (c->>'absent_days')::integer, (c->>'absence_deduction')::numeric,
    (c->>'gross_pay')::numeric, (c->>'total_deductions')::numeric,
    (c->>'net_pay')::numeric, false, auth.uid(), now())
  on conflict (employee_id, month) do update set
    base_salary = excluded.base_salary,
    overtime_rate = excluded.overtime_rate,
    multiplier = excluded.multiplier,
    overtime_hours = excluded.overtime_hours,
    overtime_pay = excluded.overtime_pay,
    overtime_request_ids = excluded.overtime_request_ids,
    insurance = excluded.insurance,
    advance = excluded.advance,
    working_days = excluded.working_days,
    daily_rate = excluded.daily_rate,
    unpaid_leave_days = excluded.unpaid_leave_days,
    unpaid_leave_deduction = excluded.unpaid_leave_deduction,
    absent_days = excluded.absent_days,
    absence_deduction = excluded.absence_deduction,
    gross_pay = excluded.gross_pay,
    total_deductions = excluded.total_deductions,
    net_pay = excluded.net_pay,
    prepared_by = excluded.prepared_by,
    prepared_at = excluded.prepared_at
  where not p.published
  returning * into saved;

  delete from public.payslip_lines where employee_id = employee and month = pay_month;
  insert into public.payslip_lines (employee_id, month, position, kind, label, detail, amount)
  values
    (employee, pay_month, 1, 'earning', 'Base salary',
     saved.working_days || ' working days', saved.base_salary),
    (employee, pay_month, 2, 'earning', 'Overtime',
     trim_scale(saved.overtime_hours) || ' hours (approved entries)', saved.overtime_pay),
    (employee, pay_month, 3, 'deduction', 'Employee insurance', '', saved.insurance),
    (employee, pay_month, 4, 'deduction', 'Salary advance', '', saved.advance),
    (employee, pay_month, 5, 'deduction', 'Unpaid leave',
     trim_scale(saved.unpaid_leave_days) || ' days Partial Leave × ' || saved.daily_rate,
     saved.unpaid_leave_deduction),
    (employee, pay_month, 6, 'deduction', 'Absences',
     saved.absent_days || ' days × ' || saved.daily_rate, saved.absence_deduction);
  return saved;
end;
$$;

-- HR publishes a checked draft. It is recalculated first; if overtime,
-- leave, attendance or pay settings changed since the draft, it refuses.
create function public.publish_payslip(employee text, pay_month text)
returns public.payslips
language plpgsql security definer set search_path = '' as $$
declare
  draft public.payslips;
  c jsonb;
  saved public.payslips;
begin
  if not public.is_hr() then
    raise exception 'HR access required.';
  end if;
  if employee = public.current_employee_id() then
    raise exception 'Another HR administrator must publish your payslip.';
  end if;
  select * into draft from public.payslips
   where employee_id = employee and month = pay_month
   for update;
  if not found then
    raise exception 'Prepare the draft first.';
  end if;
  if draft.published then
    raise exception 'This payslip is already published.';
  end if;

  c := public.payroll_calculation(employee, pay_month);
  if (c->>'net_pay')::numeric <> draft.net_pay
     or (c->>'gross_pay')::numeric <> draft.gross_pay
     or (c->>'total_deductions')::numeric <> draft.total_deductions
     or (c->>'overtime_hours')::numeric <> draft.overtime_hours
     or (c->>'unpaid_leave_days')::numeric <> draft.unpaid_leave_days
     or (c->>'absent_days')::integer <> draft.absent_days then
    raise exception 'Pay data changed since this draft was prepared. Calculate and review again.';
  end if;
  if draft.net_pay < 0 then
    raise exception 'Deductions cannot be more than total earnings.';
  end if;

  update public.payslips
     set published = true, published_by = auth.uid()
   where employee_id = employee and month = pay_month
  returning * into saved;
  return saved;
end;
$$;

revoke execute on function public.payroll_calculation(text, text)
  from public, anon, authenticated;
revoke execute on function public.prepare_payslip(text, text),
  public.publish_payslip(text, text) from public, anon;
grant execute on function public.prepare_payslip(text, text),
  public.publish_payslip(text, text) to authenticated;

-- Dashboards: one call each for the Employee home and the HR overview,
-- built from the attendance, leave and overtime records. Times use
-- Asia/Bangkok. Run once in the SQL Editor after the payroll migration.

-- The signed-in employee's home screen.
create function public.employee_dashboard()
returns jsonb
language plpgsql stable security definer set search_path = '' as $$
declare
  me text := public.current_employee_id();
  today date := (now() at time zone 'Asia/Bangkok')::date;
  month_start date := date_trunc('month', today)::date;
  today_shift public.shifts;
  state text;
  hours_today numeric := 0;
  latest_leave jsonb;
  latest_overtime jsonb;
begin
  if me is null then
    raise exception 'Only active employees have an employee dashboard.';
  end if;

  select * into today_shift from public.shifts s
   where s.employee_id = me and s.work_date = today;
  if not found then
    state := 'Ready to check in';
  elsif today_shift.end_at is null then
    state := 'Working';
    hours_today := round((extract(epoch from (now() - today_shift.start_at)) / 3600)::numeric, 2);
  else
    state := 'Shift complete';
    hours_today := today_shift.hours;
  end if;

  select jsonb_build_object('type', r.type, 'status', r.status,
           'start_date', (r.start_at at time zone 'Asia/Bangkok')::date, 'days', r.days)
    into latest_leave
    from public.work_requests r
   where r.employee_id = me and r.kind = 'Leave'
   order by r.created_at desc limit 1;

  select jsonb_build_object('status', r.status, 'hours', r.hours,
           'work_date', (r.start_at at time zone 'Asia/Bangkok')::date)
    into latest_overtime
    from public.work_requests r
   where r.employee_id = me and r.kind = 'Overtime'
   order by r.created_at desc limit 1;

  return jsonb_build_object(
    'date', today,
    'state', state,
    'check_in', today_shift.start_at,
    'check_out', today_shift.end_at,
    'hours_today', hours_today,
    'hours_this_month', (select coalesce(sum(s.hours), 0) from public.shifts s
                          where s.employee_id = me and s.work_date >= month_start),
    'days_worked_this_month', (select count(*) from public.shifts s
                                where s.employee_id = me and s.work_date >= month_start),
    'pending_requests', (select count(*) from public.work_requests r
                          where r.employee_id = me and r.status = 'Pending'),
    'latest_leave', latest_leave,
    'latest_overtime', latest_overtime
  );
end;
$$;

-- HR overview for one day (today by default).
create function public.hr_dashboard(on_date date default null)
returns jsonb
language plpgsql stable security definer set search_path = '' as $$
declare
  as_of date := coalesce(on_date, (now() at time zone 'Asia/Bangkok')::date);
  active_count integer;
  checked_in integer;
  working_now integer;
  on_leave integer;
  missed integer;
begin
  if not public.is_hr() then
    raise exception 'HR access required.';
  end if;

  select count(*) into active_count from public.employees e where e.active;

  select count(distinct s.employee_id),
         count(*) filter (where s.end_at is null and not s.missed_check_out),
         count(*) filter (where s.missed_check_out)
    into checked_in, working_now, missed
    from public.shifts s
    join public.employees e on e.id = s.employee_id and e.active
   where s.work_date = as_of;

  select count(distinct r.employee_id) into on_leave
    from public.work_requests r
    join public.employees e on e.id = r.employee_id and e.active
   where r.kind = 'Leave' and r.status = 'Approved'
     and as_of between (r.start_at at time zone 'Asia/Bangkok')::date
                 and (r.end_at at time zone 'Asia/Bangkok')::date
     and not exists (select 1 from public.shifts s
                      where s.employee_id = r.employee_id and s.work_date = as_of);

  return jsonb_build_object(
    'date', as_of,
    'working_day', extract(isodow from as_of) < 6,
    'active_employees', active_count,
    'checked_in', checked_in,
    'working_now', working_now,
    'on_leave', on_leave,
    'not_checked_in', case when extract(isodow from as_of) < 6
                           then greatest(active_count - checked_in - on_leave, 0)
                           else 0 end,
    'missed_check_outs', missed,
    'hours_worked', (select coalesce(sum(s.hours), 0) from public.shifts s
                      where s.work_date = as_of),
    'pending_leave', (select count(*) from public.work_requests r
                       where r.kind = 'Leave' and r.status = 'Pending'),
    'pending_overtime', (select count(*) from public.work_requests r
                          where r.kind = 'Overtime' and r.status = 'Pending'),
    'draft_payslips', (select count(*) from public.payslips p where not p.published)
  );
end;
$$;

revoke execute on function public.employee_dashboard(),
  public.hr_dashboard(date) from public, anon;
grant execute on function public.employee_dashboard(),
  public.hr_dashboard(date) to authenticated;

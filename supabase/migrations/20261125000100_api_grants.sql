-- Newer Supabase projects don't give the API roles access to new tables
-- automatically. Without these grants the app gets "permission denied"
-- even when a row-level security policy allows the row.
-- Row-level security still decides which rows each person can see.

grant usage on schema public to authenticated, service_role;

grant select on public.hr_admins to authenticated;
grant select, insert, update on public.employees to authenticated;
grant select, insert, update on public.work_requests to authenticated;
grant select, insert, update on public.shifts to authenticated;
grant select, insert, update, delete on public.payslips to authenticated;
grant select on public.notices to authenticated;

grant all on public.hr_admins, public.employees, public.work_requests,
  public.shifts, public.payslips, public.notices to service_role;

grant execute on function public.is_hr(), public.current_employee_id(),
  public.is_trusted_role() to authenticated, service_role;

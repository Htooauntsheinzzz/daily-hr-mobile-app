-- Fictional demo data matching the app's local seed. Run after the schema.

insert into public.employees
  (id, name, email, mobile, position, department, personal_email, base_salary)
values
  ('DH-001', 'Maya Chen', 'maya@dailyhr.example', '081 555 0124',
   'People Coordinator', 'People Operations', 'maya@example.com', 30000),
  ('DH-002', 'Nina Park', 'nina@dailyhr.example', '082 555 0138',
   'Design Associate', 'Product Design', 'nina@example.com', 32000);

insert into public.work_requests (employee_id, kind, type, start_at, end_at, reason)
values ('DH-001', 'Leave', 'Annual leave',
        '2026-11-23 00:00+07', '2026-11-23 00:00+07', 'Family visit');

-- October payslips, already published. Maya has 1.5 approved overtime hours.
insert into public.payslips
  (employee_id, month, base_salary, overtime_rate, overtime_hours, insurance, published)
values
  ('DH-001', '2026-10', 30000, 250, 1.5, 750, true),
  ('DH-002', '2026-10', 32000, 250, 0, 750, true);

-- Seeding publishes notices for October; clear them so the demo starts clean.
delete from public.notices;

-- HR administrator: first create the user in Authentication > Users in the
-- dashboard, then run this line.
-- insert into public.hr_admins (user_id)
--   select id from auth.users where email = 'arun@gmail.com';

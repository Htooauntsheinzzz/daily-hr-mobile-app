# Daily HR coding-agent guide

Daily HR is a Flutter and Dart employee-management app for iOS and Android. Employees use it to manage their own work records. HR administrators maintain employee information, review requests, and publish payroll. The entry point in `lib/main.dart` loads the local fictional demo store and launches the employee or HR workspace. The table describes the product workflows.

| Module | Employee workflow | HR administrator workflow |
| --- | --- | --- |
| Authentication | Sign in and out of the employee workspace | Sign in and out of the HR workspace |
| Employee information | View profile, department, and position. Update contact details. | Add, edit, deactivate, and assign employees to departments and positions. |
| Attendance | Check in and out. Review hours and calendar history. | Review daily attendance by employee. |
| Leave | View balances, submit requests, track decisions, and cancel pending requests. | Review pending leave and approve or reject it. |
| Overtime | Enter date, start time, end time, and reason. View calculated hours and status. | Review hours and approve or reject requests. |
| Payroll | Open published monthly payslips and view past payslips. | Prepare and publish payslips with base salary, approved overtime pay, deductions, and net pay. |
| Dashboard | See today's attendance, hours, and recent request statuses. | See attendance totals and requests awaiting a decision. |

## Working in this project

- Start with the relevant code and the [decision log](spec-md/00-changes-and-decision.md). Supabase is the preferred backend candidate. Provider selection and integration are open.
- Keep shared screens and business logic in Dart. Use the Android and iOS runners for platform configuration. Check forms with the keyboard open and navigation within each platform's safe areas.
- Follow the [Daily HR Figma design](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=0-1). Use forest green `#35594C` for primary actions, sage `#A8C3B0` for selection, light sage `#DEE9DF` for icon backgrounds, warm cream `#F4F3EB` for backgrounds, white `#FFFFFF` for surfaces, and charcoal `#26352E` for text.
- When connecting real data, enforce employee ownership, HR permissions, and payslip publication status in the backend. Use fictional employee and payroll data in fixtures.
- Follow the checks in the [README](README.md). When a change affects both platforms, record which targets you verified and any outstanding device checks.
- Append an entry to the decision log when work changes a workflow, business rule, dependency, backend contract, or platform setup. Include the reason and how the result was checked.

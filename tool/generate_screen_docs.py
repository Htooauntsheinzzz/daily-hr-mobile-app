"""Generate one implementation note per indexed Figma frame from the local audit cache."""
from pathlib import Path
import html
import json
import re

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'spec-md/screens'
OUT.mkdir(parents=True, exist_ok=True)
frames = json.loads((ROOT / 'tool/figma_frames.json').read_text(encoding='utf-8-sig'))

def mapping(name):
    n = name.lower()
    if 'splash' in n:
        return ('app.dart', 'SplashScreen / DailyHrApp', 'Launch the app with or without a saved employee/HR session.', 'Logo and landscape artwork animate before routing to sign-in or the restored workspace.', 'Animation phases share one widget; exact Figma transition timing remains to be compared.')
    if 'sign in' in n:
        return ('app.dart', 'SignInScreen', 'Sign out, then choose Employee or HR Admin demo.', 'Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.', 'Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.')
    if 'sign out' in n:
        return ('app.dart', 'Workspace.signOut / confirm', 'Open Profile, then Sign out.', 'White confirmation sheet supports Sign out and Stay signed in. Confirmation clears the persisted session.', 'A shared bottom-sheet component supplies both employee and HR variants.')
    if 'profile' in n and 'deactivate' not in n:
        return ('people.dart', 'ProfileBody', 'Choose the Profile bottom-navigation tab.', 'Show role identity, work email and employee employment/contact details. Employees can edit contact details; both roles can sign out.', 'Saved-contact variants read the same Employee object after a successful save; cancelled edits retain saved data.')
    if 'edit contact' in n or 'edit saved contact' in n:
        return ('people.dart', 'EmployeeForm(contactOnly: true)', 'Employee Profile → Edit contact details.', 'Edit mobile and personal email; Save changes validates and persists only the signed-in employee; Cancel returns without mutation.', 'Entered and preserved-input states use controllers owned by the form.')
    if 'people /' in n:
        if 'directory' in n:
            return ('people.dart', 'DirectoryBody', 'HR workspace → Employees.', 'List employees, department and inactive status; open the selected record or Add employee.', 'Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.')
        if 'deactivate' in n or 'confirmation' in n:
            return ('people.dart', 'EmployeeDetail → DecisionPage', 'Active employee record → Deactivate profile.', 'Show the selected employee name and retention explanation. Confirm marks that employee inactive; Keep active returns without changes.', 'Deactivation retains attendance, requests and payroll history; inactive detail hides edit/pay/deactivation actions.')
        if 'choose position' in n or 'choose department' in n:
            return ('people.dart', 'EmployeeForm.picker → ChoicePage<String>', 'Add/Edit employee → Position or Department.', 'Open a full-screen option list, highlight the current value and return the chosen value to the same form.', 'Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.')
        if '/ add /' in n or '/ edit /' in n or 'edit mobile' in n:
            return ('people.dart', 'EmployeeForm', 'HR Employees → Add employee, or employee record → Edit employee.', 'Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.', '00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.')
        return ('people.dart', 'EmployeeDetail', 'HR Employees → selected employee.', 'Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.', 'Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.')
    if 'attendance /' in n:
        if 'calendar' in n:
            return ('attendance.dart', 'CalendarBody / MonthGrid', 'Employee Attendance → Attendance calendar, or Calendar tab.', 'Navigate a Monday-first month grid, select a date and display that day’s check-in, checkout and hours.', 'Ready/working/complete variants are derived from the selected employee’s Shift records. Historical prototype dates are fixture values, not fabricated live records.')
        if 'daily review' in n or 'review maya' in n or 'review nina' in n:
            return ('attendance.dart', 'AttendanceReviewBody / HrPage', 'HR Attendance → select workday → employee row.', 'Switch workdays and open the selected employee’s attendance record; display times in Bangkok local time.', 'The review derives Present/Late/Absent/On leave/Checked in from shifts and approved leave. Per-frame attendance history is not seeded automatically.')
        if 'location' in n:
            return ('attendance.dart', 'LocationPage', 'Employee Attendance → Check in.', 'Show location confirmation; skipping presents the unavailable state; retry returns to location confirmation; check-in creates the shared shift.', 'Location is explicitly simulated in this local demo; device GPS permission/capture is not implemented.')
        if 'confirm checkout' in n:
            return ('attendance.dart', 'AttendanceBody → DecisionPage', 'Working shift → Check out.', 'Show shift start/current time and elapsed hours; Confirm check-out closes the shift; Keep working leaves it open.', 'The displayed time comes from the injected Bangkok clock; test fixtures control the source-frame date/time.')
        return ('attendance.dart', 'AttendanceBody / ShiftSummary', 'Employee Attendance tab.', 'Ready displays current time; checked-in displays the check-in time; complete displays total duration. Actions change with shift state.', 'Ready/working/complete share the same store as the dashboard and calendar.')
    if 'overview' in n or 'employee home' in n:
        return ('app.dart', 'Workspace.dashboard', 'Sign in to the corresponding employee/HR workspace.', 'Show current attendance and request/payroll navigation; the HR menu opens employee, attendance, review and payroll workflows.', 'Counts and summaries are derived from the shared demo records; the overview menu uses Flutter popup-menu behavior.')
    if 'notifications' in n:
        return ('app.dart', 'NotificationsPage', 'Dashboard → notification control.', 'Show current employee notices and navigate by the referenced request or payslip ID.', 'Exact source layout was unavailable in this audit; routing isolation is covered by widget tests.')
    if n.startswith('leave /') or 'overtime' in n or '/ ot ' in n or '/ pick ' in n or 'second ' in n or 'approved entry' in n:
        is_leave=n.startswith('leave /')
        if 'confirm ' in n:
            return ('requests.dart', 'RequestDetail.decision → DecisionPage', 'Pending request → Cancel, Approve or Reject.', 'Confirm a decision for the selected request, or go back without changing it; update its list/detail and notification.', 'Employee cancellation is restricted to their own pending leave; HR approval/rejection is role checked.')
        if 'leave type' in n or '/ type for' in n or '/ pick ' in n:
            return ('requests.dart', 'RequestForm → ChoicePage / ReasonEditor', 'Request form → relevant selection tile.', 'Choose leave type, overtime date/time or a demo overtime reason without losing other entered fields.', 'Leave dates use the native date-range picker and leave reason uses a text editor. Overtime choices use dedicated Figma-style pages.')
        if any(x in n for x in ['new request','ready to submit','missing details','dates entered','reason entered','overtime form','overtime validation','second request','second ready']):
            return ('requests.dart', 'RequestForm', 'Employee My leave/My overtime → Request.', 'Retain selected fields, validate completeness and positive overtime duration, calculate hours and submit a pending request.', 'Each entered/validation state shares one stateful form; successful submission opens that exact request detail.')
        if any(x in n for x in ['my leave','leave review','my overtime','ot review']):
            return ('requests.dart', 'RequestsPage', 'Dashboard → My leave/My overtime or HR review.', 'Show balances/approved hours and request statuses; open a selected request or create a new one; bottom navigation returns to workspace tabs.', 'Demo annual/sick balances are 10/6 days before approved usage; pending/cancelled requests do not consume balance.')
        return ('requests.dart', 'RequestDetail', 'Request list, notification, or payroll approved-entry drilldown → selected request.', 'Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.', 'First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.')
    if any(x in n for x in ['payroll','payslip','paydesk','calculation','salary','deduction','review draft']):
        if 'pay settings' in n:
            return ('payroll.dart', 'PaySettingsPage', 'Active employee record → Pay settings.', 'Show monthly base salary and hourly overtime rate; each opens its own amount selector.', 'Settings are scoped to the selected employee and never rewrite published snapshots.')
        if any(n.endswith(x) for x in [' base',' rate',' insurance',' advance']) or '/ set ' in n or 'calculation salary' in n or 'calculation ded' in n:
            return ('payroll.dart', 'editPayAmount → ChoicePage<double>', 'Pay settings or Prepare payslip → selected amount.', 'Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.', 'Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.')
        if 'entries' in n or 'calculation ot' in n:
            return ('payroll.dart', 'EntriesPage', 'Prepare/review payslip → approved hours/entries.', 'List only approved overtime for the employee and pay month, or immutable snapshot entry IDs; open the selected request.', 'Empty and populated states share this page; unrelated employees/months and unapproved requests are excluded.')
        if 'prepare' in n:
            return ('payroll.dart', 'PreparePage', 'HR Payroll → unpublished employee/month.', 'Edit salary/rate and itemized deductions, review approved entries, then calculate a draft.', 'Net pay uses base + approved hours × rate − insurance − advance. Stale drafts must be recalculated before publication.')
        if 'months' in n:
            return ('payroll.dart', 'PayrollPage → ChoicePage<DateTime>', 'HR Payroll → Pay period.', 'Choose a month and return to the monthly register.', 'The source shows October/November; the app offers the last twelve months based on the clock.')
        if n.endswith('/ payroll') or 'register' in n or 'my payslips' in n:
            return ('payroll.dart', 'PayrollPage', 'Dashboard → Payroll/My payslips.', 'HR can prepare or open each employee’s month. Employees see only their published monthly history.', 'Published and unpublished register rows navigate to different screens; inactive records cannot create new payroll.')
        return ('payroll.dart', 'PayslipPage', 'Payroll calculation/register or employee payslip history → selected month.', 'Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.', 'Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.')
    raise ValueError('Unmapped frame: '+name)

def clean(value):
    value=html.unescape(re.sub('<[^>]+>', '',value)).strip()
    value=re.sub(r'^\{`(.*)`\}$',r'\1',value,flags=re.S)
    return re.sub(r'\s+',' ',value).replace('|','\\|')

rows=[]
missing=[]
for number,frame in enumerate(frames,1):
    name=frame['name'];node=frame['id']
    file,widget,entry,behavior,limits=mapping(name)
    cache=ROOT/'.dart_tool/figma-context'/f"{node.replace(':','-')}.txt"
    source=cache.read_text(encoding='utf-8') if cache.exists() else ''
    slug=re.sub(r'[^a-z0-9]+','-',name.lower()).strip('-')[:85]
    filename=f"{number:03d}-{node.replace(':','-')}-{slug}.md"
    url=f"https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id={node.replace(':','-')}"
    state=name.split(' / ')[-1]
    status='Reference retrieved; shared implementation present; individual visual sign-off pending.' if source else 'Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.'
    text=f'''# {name}

- Figma frame: [`{node}`]({url})
- Screen/state: **{state}**
- Implementation: [`{widget}`](../../lib/src/{file})
- Shared UI: [ui.dart](../../lib/src/ui.dart)
- Shared records and rules: [store.dart](../../lib/src/store.dart)
- Audit status: {status}

## Open this screen

{entry}

## Implemented behavior

{behavior}

## State and implementation notes

{limits}

## Reference content and layout

'''
    if source:
        text+='The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.\n\n| Reference text | Left | Top | Font size |\n| --- | --- | --- | --- |\n'
        found=0
        for attrs,content in re.findall(r'<p\b([^>]*)>([\s\S]*?)</p>',source):
            label=clean(content)
            if not label or len(label)>400: continue
            def val(key):
                m=re.search(key+r'-\[(-?[\d.]+)px\]',attrs)
                return m.group(1)+' px' if m else '—'
            text+=f'| {label} | {val("left")} | {val("top")} | {val("text")} |\n'
            found+=1
        if found==0: text+='| Source artwork / non-text layout | — | — | — |\n'
    else:
        missing.append((name,node,filename))
        text+='The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.\n'
    text+='''
## Verification and remaining work

- Shared functional regression checks: [widget tests](../../test/widget_test.dart), [Figma flow tests](../../test/figma_flows_test.dart), [store tests](../../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](../03-screen-coverage.md).
'''
    (OUT/filename).write_text(text,encoding='utf-8')
    rows.append(f'| {number} | [{name}]({filename}) | `{node}` | `{widget}` | {"Retrieved" if source else "Blocked"} |')
index='''# Screen implementation documents

One Markdown file per Figma frame, including each entered, validation, selection, pending, resolved and inactive variant. Frame count is not implementation-completion count. Shared Flutter widgets implement families of states; per-frame visual sign-off remains open.

243 frames indexed. 230 reference contexts retrieved; 13 blocked by the Figma plan limit.

[Overall audit and limitations](../03-screen-coverage.md)

| # | Screen implementation | Node | Flutter implementation | Reference |
| --- | --- | --- | --- | --- |
'''+ '\n'.join(rows)+'\n'
(OUT/'README.md').write_text(index,encoding='utf-8')
audit='''# Figma screen implementation audit

Date: 24 November 2026. Source: Daily HR Mobile Programming, Figma file `8JAJChwmBDUM2dkdvdXHgU`.

## Inventory and evidence

- 243 frames are indexed in [the frame inventory](../tool/figma_frames.json).
- [243 individual implementation Markdown files](screens/README.md) map each frame to its Flutter widget, entry path, behavior, source labels and open checks.
- 230 design contexts were retrieved. Thirteen requests returned the Figma plan tool-call limit. The context cache is local under `.dart_tool/figma-context`; extracted reference text/coordinates are retained in the individual documents.
- Neither a mapping nor a retrieved reference means the frame is visually complete. Individual 243-frame screenshot comparison has not been completed.

## Implemented in this pass

Dedicated full-screen position/department, leave-type, overtime date/time/reason, pay-period and pay-amount selectors; independent form-state retention; full-page employee deactivation, request decision and checkout confirmation; inactive-record action visibility; HR Arun Patel identity and source demo credentials; profile navigation and source icons; attendance shift displays and HR workday/record screens; leave balance cards; list bottom navigation; itemized payroll, editable drafts and published snapshots.

## Verification

26 automated store/widget tests pass. Additional source-sized render checks cover representative screen families, and snapshots are saved in `build/qa`. Static analysis and Android APK results are recorded in the decision log after final validation. No Android emulator was connected during the final device check. iOS build and simulator testing require macOS/Xcode and remain unverified.

## Known remaining differences

- Exact per-frame spacing, transitions, selection variants and screenshots still require visual sign-off; do not label all screens 100% complete.
- Leave date selection uses Flutter’s native range picker; the overview menu uses Flutter’s popup menu.
- Legacy generic calculation frames map to the newer itemized payroll flow; there is no separate total-deductions-only page.
- Some selection pages offer a union of demo options or a wider month range rather than fixed prototype choices.
- Historical Figma example shifts are not automatically inserted into live demo records.
- Authentication, persistence and location are local demo behavior; backend authorization, synchronization and real GPS remain outside the implemented demo.

## References blocked by the Figma plan limit

| Frame | Node | Implementation document |
| --- | --- | --- |
'''
for name,node,filename in missing:
    audit+=f'| {name} | `{node}` | [Implementation](screens/{filename}) |\n'
(ROOT/'spec-md/03-screen-coverage.md').write_text(audit,encoding='utf-8')
assert len(rows)==243 and len(missing)==13
print(f'Wrote {len(rows)} screen implementation files, index, and audit; {len(missing)} blocked source references.')


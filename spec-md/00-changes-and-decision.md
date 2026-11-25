# Daily HR changes and decisions

Append dated entries in chronological order. When a later decision replaces an earlier one, refer to its date and topic so the history stays readable.

## 2026-11-22 — Mobile project setup

- **Decision** — Use the existing Flutter application and its Android and iOS runners for Daily HR.
- **Reason** — Both mobile platforms share the employee and HR workflows described in the [agent guide](../Agent.md).
- **Change** — Added agent instructions and this log, replaced the starter README with mobile setup steps, and extended Git ignore rules for local configuration and signing material.
- **Verification** — Inspected the Dart entry point, widget test, Android manifest, and iOS workspace. The app currently contains the starter counter.
- **Open** — Backend provider selection and the first Daily HR feature implementation.

## Template for future entries

Copy this block under a new dated heading.

```markdown
## YYYY-MM-DD — Short title

- **Change** — What changed and which workflows or platforms it affects.
- **Decision and reason** — What was chosen and why.
- **Verification** — Commands, device checks, and results.
- **Open** — Any remaining work or unresolved question.
```

## 2026-11-22 — Shared asset folders

Registered `assets/`, `assets/images/`, `assets/icons/`, and `assets/logos/` for both mobile targets so new files placed directly in those folders are picked up on the next build. Parsed the manifest and verified that every declared folder exists.

## 2026-11-24 — Employee and HR design implementation

- **Change** — Replaced the starter counter with role-specific sign-in, animated splash, dashboards and navigation; employee contact editing; HR directory/add/edit/deactivate; Bangkok attendance and calendar; leave and overtime forms, decisions and detail states; monthly payroll preparation, pay settings, approved-entry drilldowns, publication and employee history; and notifications linked by record ID. Added the source Figma artwork, Inter font/license, Android/iOS launcher icons, display names and launch colors.
- **Decision and reason** — Follow the 2026-11-24 design plan using one shared fictional data store. Use `flutter_svg` for source SVG assets and `shared_preferences` for local records/session restoration. Backend/provider selection remains open; local password/role checks and simulated location are explicit demo behavior. No real employee data or GPS is used. Keep published payroll snapshots immutable, reject stale drafts and duplicate publication, and filter overtime by employee, month and approved status.
- **Business rules** — Leave counts Monday–Friday, uses 12 annual / 30 sick / 6 personal days per calendar year, and consumes balance on approval. Overtime is positive, same-day elapsed time. Attendance supports one shift per workday and an open shift spanning midnight. Insurance and advances are non-negative itemized amounts; negative net-pay publication is rejected. These provisional demo rules need confirmation before connecting production data.
- **Design translation** — Inspected Figma screen families and source assets using MCP. Shared controls use the forest/sage/cream palette and Inter. Layouts scroll and respect safe areas, keyboard insets and text scaling. Date/time selection uses Flutter's accessible pickers; a custom Monday-first calendar follows the attendance grid. Reference-size screenshots are generated under `build/qa/`.
- **Verification** — Flutter static analysis passed with no issues; all 18 store/widget tests passed; source-icon export and Android debug APK build succeeded on Windows. Tests cover authentication errors, session restoration/sign-out, attendance consistency and cancelled checkout, leave calculations, per-request decisions, notification routing, payroll isolation/snapshots/stale drafts, employee edits, picker state retention and narrow keyboard layouts. See README for repeatable commands.
- **Open** — macOS/Xcode iOS build and simulator checks, interactive Android/iOS device testing, and exhaustive comparison of all 243 indexed Figma variants. Real authentication, backend authorization, cross-device synchronization and GPS integration remain future work as provider selection is still open. Native Flutter picker appearance and responsive layouts differ from fixed prototype overlays.
## 2026-11-24 — Figma state expansion and per-screen implementation documents

- **Change** — Added full-screen employee position/department, leave-type, overtime date/time/reason, pay-period and monetary selectors. Added full-page deactivation, request-decision and checkout confirmations, inactive employee action rules, workspace return navigation, HR identity, source icons, revised attendance summaries and review states, leave balance cards, and editable payroll drafts with immutable published records.
- **Decision and reason** — Implement repeated Figma variants with shared stateful widgets and record IDs instead of disconnected mock screens. Keep the itemized payroll workflow as the primary payroll path. Keep legacy demo credentials as aliases while adding the Figma `DemoPass42` password and `arun@dailyhr.example` HR account. Preserve existing saved employee data. Display demo annual/sick allowances of 10/6 days to match the reference balances; this supersedes the earlier provisional 12/30 allowances. Personal leave retains its existing compatibility rule but is not offered by the new source-design selector.
- **Documentation** — Created 243 individual Markdown implementation files under `spec-md/screens`, one for every indexed Figma frame, plus a linked index and `03-screen-coverage.md`. Each file records the Flutter mapping, entry path, behavior, extracted source content/offsets where available, and verification limitations. The generator is `tool/generate_screen_docs.py`; it uses the frame inventory and locally cached Figma contexts. Validated 243 unique frame IDs and all local document links.
- **Verification** — All 26 functional store/widget tests pass. The representative render suite passes and exports ten additional screen images to `build/qa`; inspected employee record, leave list/detail, overtime form and payroll draft renders and corrected row wrapping and spacing. Static analysis and Android debug APK build passed during this pass; the final rerun is recorded below. No emulator was connected when checked with ADB. iOS remains unbuilt on this Windows host.
- **Open** — Figma returned its plan tool-call limit for 13 of 243 design-context requests. Their exact frames are listed in the screen audit, rather than marked visually complete. All-frame pixel/transition certification is still open. The native leave date-range picker, popup overview menu and legacy generic payroll layouts retain documented differences. Backend authentication/authorization, cross-device data and actual GPS remain outside this fictional local demo.

- **Final rerun** — 26 tests passed; static analysis reported no issues; Android debug APK rebuilt successfully at build/app/outputs/flutter-apk/app-debug.apk. All 243 screen-document IDs and local links validated.

## 2026-11-24 — Figma copy and state pass with design completeness report

- **Change** — Aligned screens with their Figma frames: HR “Monthly payroll” register with a month selector and Not prepared / Draft / Published rows; employee “My payslips” with “Published payslips” and “฿… net pay” rows; “Calculating net pay…” before the review draft; approved overtime totals and empty copy; “Leave requests” grouped by employee and “Overtime requests” with a review queue; “My overtime” summary and request history; overtime detail with shift, hours, status and “Approve N hours”; leave and overtime confirmations with the Figma messages and “Confirm approval / rejection / cancellation”; request form values (“26 Nov 2026 · 1 working day”, 24-hour times, “2 hours”) and per-form validation copy; Add employee placeholders and the required-fields summary; calendar status chip (“No check-in”, “Late”, “Present”); HR overview “Leave queue” and “No pending overtime”; balance-card icons including the Figma heart icon. Hours now read “0 hours / 1.5 hours” instead of two decimals.
- **Decision and reason** — Reviewed drafts are stored so the register can show “Draft”. Fresh demo data now matches the Figma values: Nina’s base salary ฿32,000 and rate ฿250, Maya’s personal email maya@example.com, and Maya’s October payslip with 1.5 approved hours (฿29,625 net). Saved device data is not migrated. Where Figma frames are partial (placeholder values, unchanged “Pending” status on resolved frames, “—” net pay), the app shows the real values.
- **Documentation** — Added [04-figma-design-completeness.md](04-figma-design-completeness.md), which classifies all 243 screen specs (213 complete, 30 partial) and lists workflow states with no Figma frame.
- **Verification** — `flutter analyze` reported no issues besides SDK deprecation notices for `material.dart` on Flutter 3.50; `flutter test` passed 37 tests, including 11 new Figma screen tests in `test/figma_screens_test.dart`; `flutter test tool/render_figma_screens.dart` rendered the changed screens at 402 × 874 and they were compared with the Figma screenshots. Checked in a Linux container; Android and iOS builds were not rerun.
- **Open** — The partial and undesigned states listed in the report need design decisions. Interactive device checks remain outstanding.

## 2026-11-25 — Single screen implementation document

- **Change** — Combined the 243 per-screen files and the index from `spec-md/screens/` into [05-screen-implementation.md](05-screen-implementation.md), adding each frame's Figma design status, then deleted the `screens/` folder. Links in the coverage audit and the design completeness report now point to sections of the combined file.
- **Verification** — Checked that every one of the 243 screen titles appears as a section in the combined file before deleting, and that no remaining Markdown links point into `screens/`.
- **Open** — `tool/generate_screen_docs.py` still writes individual files to `spec-md/screens/`; rerunning it would recreate the folder.

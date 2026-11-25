# Figma design completeness by screen spec

Date: 24 November 2026. Source: [Daily HR Mobile Programming](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=0-1), page `0:1`.

This report answers whether the Figma design behind each `spec-md/screens` file is finished. It is about the design file, not the Flutter code. Every frame was read with one Figma plugin query that listed its visible text, hidden layers, instances and prototype links, so the 13 frames that the earlier audit could not retrieve are now covered too. Frames with suspicious content were checked against their rendered screenshots.

## Summary

- **243** screen specs, each matching one Figma frame. No spec points at a missing frame.
- **213 complete**: the frame has final copy, values and controls for the state it names.
- **30 partial**: the frame exists but has placeholder values, a wrong status, hidden content or only a bare label. The app implements the intended behaviour for these and the notes say what it shows instead.
- **0 missing frames**, but several workflow states have no frame at all. They are listed under “Not designed in Figma”.

## Partial designs

| # | Frame | Node | What is incomplete | App behaviour |
| --- | --- | --- | --- | --- |
| 163 | [Leave / First Employee Resolved](05-screen-implementation.md#screen-163) | `44:1747` | “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed. | Shows the real outcome and “HR has approved/rejected this request.” |
| 165 | [Leave / First HR Resolved](05-screen-implementation.md#screen-165) | `44:1785` | “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed. | Shows the real outcome and “HR has approved/rejected this request.” |
| 170 | [Leave / Second Employee Resolved](05-screen-implementation.md#screen-170) | `44:1868` | “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed. | Shows the real outcome and “HR has approved/rejected this request.” |
| 172 | [Leave / Second HR Resolved](05-screen-implementation.md#screen-172) | `44:1906` | “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed. | Shows the real outcome and “HR has approved/rejected this request.” |
| 190 | [Work / OT employee detail](05-screen-implementation.md#screen-190) | `69:2161` | Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”. | Uses the newer overtime detail (Shift, Overtime, Status, reason) with real values. |
| 191 | [Work / OT HR detail](05-screen-implementation.md#screen-191) | `69:2181` | Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”. | Uses the newer overtime detail (Shift, Overtime, Status, reason) with real values. |
| 192 | [Work / OT HR decision](05-screen-implementation.md#screen-192) | `69:2201` | Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”. | Uses the newer overtime detail (Shift, Overtime, Status, reason) with real values. |
| 198 | [Work / Payroll](05-screen-implementation.md#screen-198) | `69:2337` | Rows are inconsistent: Maya’s row has an icon tile and chevron icon, Nina’s row has neither. | All rows use the icon-tile style. |
| 202 | [Work / Calculation salary 0](05-screen-implementation.md#screen-202) | `73:2074` | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. | Shows “Calculating net pay…” briefly, then the review draft. |
| 203 | [Work / Calculation ded 00](05-screen-implementation.md#screen-203) | `73:2076` | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. | Shows “Calculating net pay…” briefly, then the review draft. |
| 204 | [Work / Calculation ot 00](05-screen-implementation.md#screen-204) | `73:2078` | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. | Shows “Calculating net pay…” briefly, then the review draft. |
| 205 | [Work / Calculation ded 01](05-screen-implementation.md#screen-205) | `73:2080` | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. | Shows “Calculating net pay…” briefly, then the review draft. |
| 206 | [Work / Calculation ot 01](05-screen-implementation.md#screen-206) | `73:2082` | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. | Shows “Calculating net pay…” briefly, then the review draft. |
| 207 | [Work / Calculation salary 1](05-screen-implementation.md#screen-207) | `73:2084` | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. | Shows “Calculating net pay…” briefly, then the review draft. |
| 208 | [Work / Calculation ded 10](05-screen-implementation.md#screen-208) | `73:2086` | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. | Shows “Calculating net pay…” briefly, then the review draft. |
| 209 | [Work / Calculation ot 10](05-screen-implementation.md#screen-209) | `73:2088` | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. | Shows “Calculating net pay…” briefly, then the review draft. |
| 210 | [Work / Calculation ded 11](05-screen-implementation.md#screen-210) | `73:2090` | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. | Shows “Calculating net pay…” briefly, then the review draft. |
| 211 | [Work / Calculation ot 11](05-screen-implementation.md#screen-211) | `73:2092` | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. | Shows “Calculating net pay…” briefly, then the review draft. |
| 218 | [Paydesk / Maya entries](05-screen-implementation.md#screen-218) | `84:2186` | Says approved entries are included but shows no rows and 0 hours, while the 19 and 24 November approved-entry frames exist for Maya. | Lists approved entries for the month with a total, or “No approved entries for … this month.” |
| 219 | [Paydesk / Maya draft](05-screen-implementation.md#screen-219) | `84:2205` | Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina). | Shows the calculated net pay. |
| 220 | [Paydesk / Maya published](05-screen-implementation.md#screen-220) | `84:2233` | Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina). | Shows the calculated net pay. |
| 221 | [Paydesk / Maya employee](05-screen-implementation.md#screen-221) | `84:2256` | Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina). | Shows the calculated net pay. |
| 230 | [Paydesk / Nina draft](05-screen-implementation.md#screen-230) | `84:2410` | Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina). | Shows the calculated net pay. |
| 231 | [Paydesk / Nina published](05-screen-implementation.md#screen-231) | `84:2438` | Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina). | Shows the calculated net pay. |
| 237 | [Paydesk / Second employee](05-screen-implementation.md#screen-237) | `84:2575` | Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected. | Shows the real status (Pending, Approved or Rejected). |
| 238 | [Paydesk / Second pending](05-screen-implementation.md#screen-238) | `84:2589` | Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected. | Shows the real status (Pending, Approved or Rejected). |
| 239 | [Paydesk / Second resolved](05-screen-implementation.md#screen-239) | `84:2609` | Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected. | Shows the real status (Pending, Approved or Rejected). |
| 240 | [Paydesk / Notifications](05-screen-implementation.md#screen-240) | `84:2623` | Only the empty state (“You’re all caught up.”) is visible; the notification rows are hidden layers. | Lists decision and payslip notifications; empty state when there are none. |
| 242 | [Payroll / Approved entry / 19 November](05-screen-implementation.md#screen-242) | `90:2098` | Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”. | Uses the newer overtime detail (Shift, Overtime, Status, reason) with real values. |
| 243 | [Payroll / Approved entry / 24 November](05-screen-implementation.md#screen-243) | `90:2120` | Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected. | Shows the real status (Pending, Approved or Rejected). |

## Not designed in Figma

These states are needed by the workflows in [Agent.md](../Agent.md) or by the app, but no frame shows them. The app uses its shared components for them.

- Leave start and end date picker. The app uses Flutter’s date range picker.
- Approved, rejected and cancelled leave and overtime outcomes (the “Resolved” frames still say Pending or Not submitted).
- Overtime approve and reject confirmation pages. The app reuses the leave confirmation layout.
- Populated notification list, populated employee overtime history and populated HR overtime queue.
- Employee Home while checked in or after checkout, and HR overview with pending overtime.
- Publish payslip confirmation. The app uses a bottom sheet.
- Inline validation for an invalid email on Edit contact details and Add or Edit employee, and a duplicate work email.
- Real net pay on November draft and published payslips.

## Duplicate or superseded frames

- The `Work / …` payroll frames (69:2252 to 69:2399) use one “Total deductions” value. The newer `Paydesk / …` frames itemise employee insurance and salary advance. The app follows Paydesk.
- `Work / Overtime form` (69:2002) and `Paydesk / Second request` (84:2515) are two versions of the same form with different placeholder copy. The app uses “Choose date / Choose start time / Choose end time / Add reason” and the 24-hour values from the newer frame.
- The nine role and returning-user splash frames (19:426 to 19:474) are identical to the base splash.
- The ten `Work / Calculation …` frames are identical.

## All screen specs

| # | Screen spec | Node | Figma design | Note |
| --- | --- | --- | --- | --- |
| 1 | [DailyHR / Splash](05-screen-implementation.md#screen-001) | `4:6` | Complete |  |
| 2 | [DailyHR / Splash · Reveal](05-screen-implementation.md#screen-002) | `6:8` | Complete |  |
| 3 | [DailyHR / Splash · Rest](05-screen-implementation.md#screen-003) | `6:14` | Complete |  |
| 4 | [Employee / Sign in / Empty](05-screen-implementation.md#screen-004) | `17:179` | Complete |  |
| 5 | [Employee / Sign in / Entered](05-screen-implementation.md#screen-005) | `17:205` | Complete |  |
| 6 | [Employee / Sign in / Visible](05-screen-implementation.md#screen-006) | `17:231` | Complete |  |
| 7 | [Employee / Sign in / Loading](05-screen-implementation.md#screen-007) | `17:258` | Complete |  |
| 8 | [HR Admin / Sign in / Empty](05-screen-implementation.md#screen-008) | `17:286` | Complete |  |
| 9 | [HR Admin / Sign in / Entered](05-screen-implementation.md#screen-009) | `17:312` | Complete |  |
| 10 | [HR Admin / Sign in / Visible](05-screen-implementation.md#screen-010) | `17:338` | Complete |  |
| 11 | [HR Admin / Sign in / Loading](05-screen-implementation.md#screen-011) | `17:365` | Complete |  |
| 12 | [Feedback / Sign in / Required](05-screen-implementation.md#screen-012) | `17:393` | Complete |  |
| 13 | [Feedback / Sign in / Invalid email](05-screen-implementation.md#screen-013) | `17:421` | Complete |  |
| 14 | [Feedback / Sign in / Password required](05-screen-implementation.md#screen-014) | `17:448` | Complete |  |
| 15 | [Feedback / Sign in / Incorrect credentials](05-screen-implementation.md#screen-015) | `17:475` | Complete |  |
| 16 | [Feedback / Sign in / Offline](05-screen-implementation.md#screen-016) | `17:502` | Complete |  |
| 17 | [Feedback / Sign in / Unassigned role](05-screen-implementation.md#screen-017) | `17:529` | Complete |  |
| 18 | [Employee / Employee Home](05-screen-implementation.md#screen-018) | `18:303` | Complete | Complete for “Ready to check in” only; no Working or Shift complete home variant. |
| 19 | [Employee / Profile](05-screen-implementation.md#screen-019) | `18:317` | Complete |  |
| 20 | [Employee / Confirm sign out](05-screen-implementation.md#screen-020) | `18:331` | Complete |  |
| 21 | [HR Admin / HR Overview](05-screen-implementation.md#screen-021) | `18:358` | Complete |  |
| 22 | [HR Admin / Profile](05-screen-implementation.md#screen-022) | `18:372` | Complete |  |
| 23 | [HR Admin / Confirm sign out](05-screen-implementation.md#screen-023) | `18:386` | Complete |  |
| 24 | [HR Admin / Sign in / Required](05-screen-implementation.md#screen-024) | `19:419` | Complete |  |
| 25 | [HR Admin / Splash / Start](05-screen-implementation.md#screen-025) | `19:426` | Complete | Complete; visually identical to the base splash (no role-specific difference). |
| 26 | [HR Admin / Splash / Reveal](05-screen-implementation.md#screen-026) | `19:432` | Complete | Complete; visually identical to the base splash (no role-specific difference). |
| 27 | [HR Admin / Splash / Rest](05-screen-implementation.md#screen-027) | `19:438` | Complete | Complete; visually identical to the base splash (no role-specific difference). |
| 28 | [Returning employee / Splash / Start](05-screen-implementation.md#screen-028) | `19:444` | Complete | Complete; visually identical to the base splash (no role-specific difference). |
| 29 | [Returning employee / Splash / Reveal](05-screen-implementation.md#screen-029) | `19:450` | Complete | Complete; visually identical to the base splash (no role-specific difference). |
| 30 | [Returning employee / Splash / Rest](05-screen-implementation.md#screen-030) | `19:456` | Complete | Complete; visually identical to the base splash (no role-specific difference). |
| 31 | [Returning HR admin / Splash / Start](05-screen-implementation.md#screen-031) | `19:462` | Complete | Complete; visually identical to the base splash (no role-specific difference). |
| 32 | [Returning HR admin / Splash / Reveal](05-screen-implementation.md#screen-032) | `19:468` | Complete | Complete; visually identical to the base splash (no role-specific difference). |
| 33 | [Returning HR admin / Splash / Rest](05-screen-implementation.md#screen-033) | `19:474` | Complete | Complete; visually identical to the base splash (no role-specific difference). |
| 34 | [People / Employee / Edit contact](05-screen-implementation.md#screen-034) | `30:380` | Complete |  |
| 35 | [People / Employee / Edit contact · entered](05-screen-implementation.md#screen-035) | `30:400` | Complete |  |
| 36 | [People / Employee / Profile · saved](05-screen-implementation.md#screen-036) | `30:420` | Complete |  |
| 37 | [People / HR / Directory · initial](05-screen-implementation.md#screen-037) | `31:356` | Complete |  |
| 38 | [People / HR / Directory · added](05-screen-implementation.md#screen-038) | `31:371` | Complete |  |
| 39 | [People / HR / Directory · updated](05-screen-implementation.md#screen-039) | `31:392` | Complete |  |
| 40 | [People / HR / Directory · inactive](05-screen-implementation.md#screen-040) | `31:407` | Complete |  |
| 41 | [People / HR / Directory · ninaUpdated](05-screen-implementation.md#screen-041) | `31:422` | Complete |  |
| 42 | [People / HR / Directory · ninaInactive](05-screen-implementation.md#screen-042) | `31:443` | Complete |  |
| 43 | [People / HR / Maya Chen · active](05-screen-implementation.md#screen-043) | `31:464` | Complete |  |
| 44 | [People / HR / Maya Chen · updated](05-screen-implementation.md#screen-044) | `31:491` | Complete |  |
| 45 | [People / HR / Maya Chen · inactive](05-screen-implementation.md#screen-045) | `31:518` | Complete |  |
| 46 | [People / HR / Deactivate Maya Chen](05-screen-implementation.md#screen-046) | `31:539` | Complete |  |
| 47 | [People / HR / Nina Park · active](05-screen-implementation.md#screen-047) | `31:553` | Complete |  |
| 48 | [People / HR / Nina Park · updated](05-screen-implementation.md#screen-048) | `31:580` | Complete |  |
| 49 | [People / HR / Nina Park · inactive](05-screen-implementation.md#screen-049) | `31:607` | Complete |  |
| 50 | [People / HR / Deactivate Nina Park](05-screen-implementation.md#screen-050) | `31:628` | Complete |  |
| 51 | [People / HR / Add / blank / 00](05-screen-implementation.md#screen-051) | `32:1217` | Complete |  |
| 52 | [People / HR / Add / Required fields](05-screen-implementation.md#screen-052) | `32:1250` | Complete |  |
| 53 | [People / HR / Add / nina / 00](05-screen-implementation.md#screen-053) | `32:1284` | Complete |  |
| 54 | [People / HR / add / Choose Position / 00](05-screen-implementation.md#screen-054) | `32:1317` | Complete |  |
| 55 | [People / HR / add / Choose Department / 00](05-screen-implementation.md#screen-055) | `32:1329` | Complete |  |
| 56 | [People / HR / Add / nina / 01](05-screen-implementation.md#screen-056) | `32:1341` | Complete |  |
| 57 | [People / HR / add / Choose Position / 01](05-screen-implementation.md#screen-057) | `32:1374` | Complete |  |
| 58 | [People / HR / add / Choose Department / 01](05-screen-implementation.md#screen-058) | `32:1386` | Complete |  |
| 59 | [People / HR / Add / nina / 10](05-screen-implementation.md#screen-059) | `32:1398` | Complete |  |
| 60 | [People / HR / add / Choose Position / 10](05-screen-implementation.md#screen-060) | `32:1431` | Complete |  |
| 61 | [People / HR / add / Choose Department / 10](05-screen-implementation.md#screen-061) | `32:1443` | Complete |  |
| 62 | [People / HR / Add / nina / 11](05-screen-implementation.md#screen-062) | `32:1455` | Complete |  |
| 63 | [People / HR / add / Choose Position / 11](05-screen-implementation.md#screen-063) | `32:1488` | Complete |  |
| 64 | [People / HR / add / Choose Department / 11](05-screen-implementation.md#screen-064) | `32:1500` | Complete |  |
| 65 | [People / HR / Edit / maya / 00](05-screen-implementation.md#screen-065) | `32:1512` | Complete |  |
| 66 | [People / HR / maya / Choose Position / 00](05-screen-implementation.md#screen-066) | `32:1545` | Complete |  |
| 67 | [People / HR / maya / Choose Department / 00](05-screen-implementation.md#screen-067) | `32:1557` | Complete |  |
| 68 | [People / HR / Edit / maya / 01](05-screen-implementation.md#screen-068) | `32:1569` | Complete |  |
| 69 | [People / HR / maya / Choose Position / 01](05-screen-implementation.md#screen-069) | `32:1602` | Complete |  |
| 70 | [People / HR / maya / Choose Department / 01](05-screen-implementation.md#screen-070) | `32:1614` | Complete |  |
| 71 | [People / HR / Edit / maya / 10](05-screen-implementation.md#screen-071) | `32:1626` | Complete |  |
| 72 | [People / HR / maya / Choose Position / 10](05-screen-implementation.md#screen-072) | `32:1659` | Complete |  |
| 73 | [People / HR / maya / Choose Department / 10](05-screen-implementation.md#screen-073) | `32:1671` | Complete |  |
| 74 | [People / HR / Edit / maya / 11](05-screen-implementation.md#screen-074) | `32:1683` | Complete |  |
| 75 | [People / HR / maya / Choose Position / 11](05-screen-implementation.md#screen-075) | `32:1716` | Complete |  |
| 76 | [People / HR / maya / Choose Department / 11](05-screen-implementation.md#screen-076) | `32:1728` | Complete |  |
| 77 | [People / HR / Edit / nina / 00](05-screen-implementation.md#screen-077) | `32:1740` | Complete |  |
| 78 | [People / HR / nina / Choose Position / 00](05-screen-implementation.md#screen-078) | `32:1773` | Complete |  |
| 79 | [People / HR / nina / Choose Department / 00](05-screen-implementation.md#screen-079) | `32:1785` | Complete |  |
| 80 | [People / HR / Edit / nina / 01](05-screen-implementation.md#screen-080) | `32:1797` | Complete |  |
| 81 | [People / HR / nina / Choose Position / 01](05-screen-implementation.md#screen-081) | `32:1830` | Complete |  |
| 82 | [People / HR / nina / Choose Department / 01](05-screen-implementation.md#screen-082) | `32:1842` | Complete |  |
| 83 | [People / HR / Edit / nina / 10](05-screen-implementation.md#screen-083) | `32:1854` | Complete |  |
| 84 | [People / HR / nina / Choose Position / 10](05-screen-implementation.md#screen-084) | `32:1887` | Complete |  |
| 85 | [People / HR / nina / Choose Department / 10](05-screen-implementation.md#screen-085) | `32:1899` | Complete |  |
| 86 | [People / HR / Edit / nina / 11](05-screen-implementation.md#screen-086) | `32:1911` | Complete |  |
| 87 | [People / HR / nina / Choose Position / 11](05-screen-implementation.md#screen-087) | `32:1944` | Complete |  |
| 88 | [People / HR / nina / Choose Department / 11](05-screen-implementation.md#screen-088) | `32:1956` | Complete |  |
| 89 | [People / HR / maya / 01 / Record](05-screen-implementation.md#screen-089) | `32:2107` | Complete |  |
| 90 | [People / HR / maya / 01 / Confirmation](05-screen-implementation.md#screen-090) | `32:2134` | Complete |  |
| 91 | [People / HR / maya / 01 / Inactive](05-screen-implementation.md#screen-091) | `32:2148` | Complete |  |
| 92 | [People / HR / maya / 01 / Directory](05-screen-implementation.md#screen-092) | `32:2169` | Complete |  |
| 93 | [People / HR / maya / 01 / Inactive directory](05-screen-implementation.md#screen-093) | `32:2179` | Complete |  |
| 94 | [People / HR / maya / 10 / Record](05-screen-implementation.md#screen-094) | `32:2189` | Complete |  |
| 95 | [People / HR / maya / 10 / Confirmation](05-screen-implementation.md#screen-095) | `32:2216` | Complete |  |
| 96 | [People / HR / maya / 10 / Inactive](05-screen-implementation.md#screen-096) | `32:2230` | Complete |  |
| 97 | [People / HR / maya / 10 / Directory](05-screen-implementation.md#screen-097) | `32:2251` | Complete |  |
| 98 | [People / HR / maya / 10 / Inactive directory](05-screen-implementation.md#screen-098) | `32:2261` | Complete |  |
| 99 | [People / HR / maya / 11 / Confirmation](05-screen-implementation.md#screen-099) | `32:2271` | Complete |  |
| 100 | [People / HR / maya / 11 / Inactive](05-screen-implementation.md#screen-100) | `32:2285` | Complete |  |
| 101 | [People / HR / maya / 11 / Inactive directory](05-screen-implementation.md#screen-101) | `32:2306` | Complete |  |
| 102 | [People / HR / nina / 01 / Record](05-screen-implementation.md#screen-102) | `32:2316` | Complete |  |
| 103 | [People / HR / nina / 01 / Confirmation](05-screen-implementation.md#screen-103) | `32:2343` | Complete |  |
| 104 | [People / HR / nina / 01 / Inactive](05-screen-implementation.md#screen-104) | `32:2357` | Complete |  |
| 105 | [People / HR / nina / 01 / Directory](05-screen-implementation.md#screen-105) | `32:2378` | Complete |  |
| 106 | [People / HR / nina / 01 / Inactive directory](05-screen-implementation.md#screen-106) | `32:2389` | Complete |  |
| 107 | [People / HR / nina / 10 / Record](05-screen-implementation.md#screen-107) | `32:2400` | Complete |  |
| 108 | [People / HR / nina / 10 / Confirmation](05-screen-implementation.md#screen-108) | `32:2427` | Complete |  |
| 109 | [People / HR / nina / 10 / Inactive](05-screen-implementation.md#screen-109) | `32:2441` | Complete |  |
| 110 | [People / HR / nina / 10 / Directory](05-screen-implementation.md#screen-110) | `32:2462` | Complete |  |
| 111 | [People / HR / nina / 10 / Inactive directory](05-screen-implementation.md#screen-111) | `32:2473` | Complete |  |
| 112 | [People / HR / nina / 11 / Confirmation](05-screen-implementation.md#screen-112) | `32:2484` | Complete |  |
| 113 | [People / HR / nina / 11 / Inactive](05-screen-implementation.md#screen-113) | `32:2498` | Complete |  |
| 114 | [People / HR / nina / 11 / Inactive directory](05-screen-implementation.md#screen-114) | `32:2519` | Complete |  |
| 115 | [People / HR / Edit mobile / maya00](05-screen-implementation.md#screen-115) | `32:2729` | Complete |  |
| 116 | [People / HR / Updated mobile / maya00](05-screen-implementation.md#screen-116) | `32:2762` | Complete |  |
| 117 | [People / HR / Edit mobile / maya01](05-screen-implementation.md#screen-117) | `32:2789` | Complete |  |
| 118 | [People / HR / Updated mobile / maya01](05-screen-implementation.md#screen-118) | `32:2822` | Complete |  |
| 119 | [People / HR / Edit mobile / maya10](05-screen-implementation.md#screen-119) | `32:2849` | Complete |  |
| 120 | [People / HR / Updated mobile / maya10](05-screen-implementation.md#screen-120) | `32:2882` | Complete |  |
| 121 | [People / HR / Edit mobile / maya11](05-screen-implementation.md#screen-121) | `32:2909` | Complete |  |
| 122 | [People / HR / Updated mobile / maya11](05-screen-implementation.md#screen-122) | `32:2942` | Complete |  |
| 123 | [People / HR / Edit mobile / nina00](05-screen-implementation.md#screen-123) | `32:2969` | Complete |  |
| 124 | [People / HR / Updated mobile / nina00](05-screen-implementation.md#screen-124) | `32:3002` | Complete |  |
| 125 | [People / HR / Edit mobile / nina01](05-screen-implementation.md#screen-125) | `32:3029` | Complete |  |
| 126 | [People / HR / Updated mobile / nina01](05-screen-implementation.md#screen-126) | `32:3062` | Complete |  |
| 127 | [People / HR / Edit mobile / nina10](05-screen-implementation.md#screen-127) | `32:3089` | Complete |  |
| 128 | [People / HR / Updated mobile / nina10](05-screen-implementation.md#screen-128) | `32:3122` | Complete |  |
| 129 | [People / HR / Edit mobile / nina11](05-screen-implementation.md#screen-129) | `32:3149` | Complete |  |
| 130 | [People / HR / Updated mobile / nina11](05-screen-implementation.md#screen-130) | `32:3182` | Complete |  |
| 131 | [People / Employee / Edit saved contact](05-screen-implementation.md#screen-131) | `32:3249` | Complete |  |
| 132 | [Attendance / Ready](05-screen-implementation.md#screen-132) | `37:476` | Complete |  |
| 133 | [Attendance / Working](05-screen-implementation.md#screen-133) | `37:506` | Complete |  |
| 134 | [Attendance / Complete](05-screen-implementation.md#screen-134) | `37:536` | Complete |  |
| 135 | [Attendance / Location](05-screen-implementation.md#screen-135) | `37:563` | Complete |  |
| 136 | [Attendance / Location unavailable](05-screen-implementation.md#screen-136) | `37:577` | Complete |  |
| 137 | [Attendance / Confirm checkout](05-screen-implementation.md#screen-137) | `37:586` | Complete |  |
| 138 | [Attendance / Calendar Ready 17](05-screen-implementation.md#screen-138) | `37:641` | Complete |  |
| 139 | [Attendance / Calendar Ready 18](05-screen-implementation.md#screen-139) | `37:703` | Complete |  |
| 140 | [Attendance / Calendar Ready 19](05-screen-implementation.md#screen-140) | `37:765` | Complete |  |
| 141 | [Attendance / Calendar Working 17](05-screen-implementation.md#screen-141) | `37:827` | Complete |  |
| 142 | [Attendance / Calendar Working 18](05-screen-implementation.md#screen-142) | `37:889` | Complete |  |
| 143 | [Attendance / Calendar Working 19](05-screen-implementation.md#screen-143) | `37:951` | Complete |  |
| 144 | [Attendance / Calendar Complete 17](05-screen-implementation.md#screen-144) | `37:1013` | Complete |  |
| 145 | [Attendance / Calendar Complete 18](05-screen-implementation.md#screen-145) | `37:1075` | Complete |  |
| 146 | [Attendance / Calendar Complete 19](05-screen-implementation.md#screen-146) | `37:1137` | Complete |  |
| 147 | [Attendance / Daily review 17](05-screen-implementation.md#screen-147) | `37:1199` | Complete |  |
| 148 | [Attendance / Review Maya 17](05-screen-implementation.md#screen-148) | `37:1235` | Complete |  |
| 149 | [Attendance / Review Nina 17](05-screen-implementation.md#screen-149) | `37:1253` | Complete |  |
| 150 | [Attendance / Daily review 18](05-screen-implementation.md#screen-150) | `37:1271` | Complete |  |
| 151 | [Attendance / Review Maya 18](05-screen-implementation.md#screen-151) | `37:1307` | Complete |  |
| 152 | [Attendance / Review Nina 18](05-screen-implementation.md#screen-152) | `37:1325` | Complete |  |
| 153 | [Attendance / Daily review 19](05-screen-implementation.md#screen-153) | `37:1343` | Complete |  |
| 154 | [Attendance / Review Maya 19](05-screen-implementation.md#screen-154) | `37:1379` | Complete |  |
| 155 | [Attendance / Review Nina 19](05-screen-implementation.md#screen-155) | `37:1397` | Complete |  |
| 156 | [Leave / My leave](05-screen-implementation.md#screen-156) | `44:1595` | Complete |  |
| 157 | [Leave / Leave review](05-screen-implementation.md#screen-157) | `44:1621` | Complete |  |
| 158 | [Leave / New request](05-screen-implementation.md#screen-158) | `44:1638` | Complete |  |
| 159 | [Leave / Ready to submit](05-screen-implementation.md#screen-159) | `44:1664` | Complete |  |
| 160 | [Leave / Missing details](05-screen-implementation.md#screen-160) | `44:1690` | Complete |  |
| 161 | [Leave / Leave type](05-screen-implementation.md#screen-161) | `44:1717` | Complete |  |
| 162 | [Leave / First Employee Pending](05-screen-implementation.md#screen-162) | `44:1728` | Complete |  |
| 163 | [Leave / First Employee Resolved](05-screen-implementation.md#screen-163) | `44:1747` | Partial | “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed. |
| 164 | [Leave / First HR Pending](05-screen-implementation.md#screen-164) | `44:1763` | Complete |  |
| 165 | [Leave / First HR Resolved](05-screen-implementation.md#screen-165) | `44:1785` | Partial | “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed. |
| 166 | [Leave / First Confirm Cancel](05-screen-implementation.md#screen-166) | `44:1801` | Complete |  |
| 167 | [Leave / First Confirm Approve](05-screen-implementation.md#screen-167) | `44:1817` | Complete |  |
| 168 | [Leave / First Confirm Reject](05-screen-implementation.md#screen-168) | `44:1833` | Complete |  |
| 169 | [Leave / Second Employee Pending](05-screen-implementation.md#screen-169) | `44:1849` | Complete |  |
| 170 | [Leave / Second Employee Resolved](05-screen-implementation.md#screen-170) | `44:1868` | Partial | “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed. |
| 171 | [Leave / Second HR Pending](05-screen-implementation.md#screen-171) | `44:1884` | Complete |  |
| 172 | [Leave / Second HR Resolved](05-screen-implementation.md#screen-172) | `44:1906` | Partial | “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed. |
| 173 | [Leave / Second Confirm Cancel](05-screen-implementation.md#screen-173) | `44:1922` | Complete |  |
| 174 | [Leave / Second Confirm Approve](05-screen-implementation.md#screen-174) | `44:1938` | Complete |  |
| 175 | [Leave / Second Confirm Reject](05-screen-implementation.md#screen-175) | `44:1954` | Complete |  |
| 176 | [Leave / Dates entered](05-screen-implementation.md#screen-176) | `44:1970` | Complete |  |
| 177 | [Leave / Reason entered](05-screen-implementation.md#screen-177) | `44:1996` | Complete |  |
| 178 | [Leave / Type for Dates entered](05-screen-implementation.md#screen-178) | `44:2022` | Complete |  |
| 179 | [Leave / Type for Reason entered](05-screen-implementation.md#screen-179) | `44:2033` | Complete |  |
| 180 | [Leave / Type for Ready to submit](05-screen-implementation.md#screen-180) | `44:2044` | Complete |  |
| 181 | [HR Admin / Overview menu](05-screen-implementation.md#screen-181) | `66:1923` | Complete |  |
| 182 | [Work / My overtime](05-screen-implementation.md#screen-182) | `69:1979` | Complete | Complete for the empty state only; no populated list is designed. |
| 183 | [Work / Overtime form](05-screen-implementation.md#screen-183) | `69:2002` | Complete | Complete, but duplicates the newer overtime form (84:2515) with different placeholder copy. |
| 184 | [Work / Overtime validation](05-screen-implementation.md#screen-184) | `69:2052` | Complete | Complete, but duplicates the newer overtime form (84:2515) with different placeholder copy. |
| 185 | [Work / Pick Date](05-screen-implementation.md#screen-185) | `69:2103` | Complete | Complete, though the picker offers a single option. |
| 186 | [Work / Pick Start](05-screen-implementation.md#screen-186) | `69:2111` | Complete | Complete, though the picker offers a single option. |
| 187 | [Work / Pick End](05-screen-implementation.md#screen-187) | `69:2119` | Complete |  |
| 188 | [Work / Pick Reason](05-screen-implementation.md#screen-188) | `69:2130` | Complete |  |
| 189 | [Work / OT review](05-screen-implementation.md#screen-189) | `69:2141` | Complete | Complete for the empty state only; no populated list is designed. |
| 190 | [Work / OT employee detail](05-screen-implementation.md#screen-190) | `69:2161` | Partial | Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”. |
| 191 | [Work / OT HR detail](05-screen-implementation.md#screen-191) | `69:2181` | Partial | Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”. |
| 192 | [Work / OT HR decision](05-screen-implementation.md#screen-192) | `69:2201` | Partial | Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”. |
| 193 | [Work / My payslips](05-screen-implementation.md#screen-193) | `69:2227` | Complete |  |
| 194 | [Work / October payslip](05-screen-implementation.md#screen-194) | `69:2252` | Complete | Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk. |
| 195 | [Work / November payslip](05-screen-implementation.md#screen-195) | `69:2272` | Complete | Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk. |
| 196 | [Work / Review draft](05-screen-implementation.md#screen-196) | `69:2292` | Complete | Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk. |
| 197 | [Work / Published payroll](05-screen-implementation.md#screen-197) | `69:2317` | Complete | Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk. |
| 198 | [Work / Payroll](05-screen-implementation.md#screen-198) | `69:2337` | Partial | Rows are inconsistent: Maya’s row has an icon tile and chevron icon, Nina’s row has neither. |
| 199 | [Work / Prepare payroll](05-screen-implementation.md#screen-199) | `69:2353` | Complete | Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk. |
| 200 | [Work / Set Salary](05-screen-implementation.md#screen-200) | `69:2388` | Complete | Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk. |
| 201 | [Work / Set Deduction](05-screen-implementation.md#screen-201) | `69:2399` | Complete | Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk. |
| 202 | [Work / Calculation salary 0](05-screen-implementation.md#screen-202) | `73:2074` | Partial | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. |
| 203 | [Work / Calculation ded 00](05-screen-implementation.md#screen-203) | `73:2076` | Partial | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. |
| 204 | [Work / Calculation ot 00](05-screen-implementation.md#screen-204) | `73:2078` | Partial | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. |
| 205 | [Work / Calculation ded 01](05-screen-implementation.md#screen-205) | `73:2080` | Partial | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. |
| 206 | [Work / Calculation ot 01](05-screen-implementation.md#screen-206) | `73:2082` | Partial | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. |
| 207 | [Work / Calculation salary 1](05-screen-implementation.md#screen-207) | `73:2084` | Partial | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. |
| 208 | [Work / Calculation ded 10](05-screen-implementation.md#screen-208) | `73:2086` | Partial | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. |
| 209 | [Work / Calculation ot 10](05-screen-implementation.md#screen-209) | `73:2088` | Partial | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. |
| 210 | [Work / Calculation ded 11](05-screen-implementation.md#screen-210) | `73:2090` | Partial | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. |
| 211 | [Work / Calculation ot 11](05-screen-implementation.md#screen-211) | `73:2092` | Partial | Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed. |
| 212 | [Paydesk / Maya pay settings](05-screen-implementation.md#screen-212) | `83:2123` | Complete |  |
| 213 | [Paydesk / Maya base](05-screen-implementation.md#screen-213) | `84:2103` | Complete |  |
| 214 | [Paydesk / Maya rate](05-screen-implementation.md#screen-214) | `84:2115` | Complete |  |
| 215 | [Paydesk / Maya insurance](05-screen-implementation.md#screen-215) | `84:2127` | Complete |  |
| 216 | [Paydesk / Maya advance](05-screen-implementation.md#screen-216) | `84:2139` | Complete |  |
| 217 | [Paydesk / Maya prepare](05-screen-implementation.md#screen-217) | `84:2151` | Complete |  |
| 218 | [Paydesk / Maya entries](05-screen-implementation.md#screen-218) | `84:2186` | Partial | Says approved entries are included but shows no rows and 0 hours, while the 19 and 24 November approved-entry frames exist for Maya. |
| 219 | [Paydesk / Maya draft](05-screen-implementation.md#screen-219) | `84:2205` | Partial | Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina). |
| 220 | [Paydesk / Maya published](05-screen-implementation.md#screen-220) | `84:2233` | Partial | Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina). |
| 221 | [Paydesk / Maya employee](05-screen-implementation.md#screen-221) | `84:2256` | Partial | Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina). |
| 222 | [Paydesk / Maya october](05-screen-implementation.md#screen-222) | `84:2279` | Complete |  |
| 223 | [Paydesk / Nina pay settings](05-screen-implementation.md#screen-223) | `84:2302` | Complete |  |
| 224 | [Paydesk / Nina base](05-screen-implementation.md#screen-224) | `84:2318` | Complete |  |
| 225 | [Paydesk / Nina rate](05-screen-implementation.md#screen-225) | `84:2330` | Complete |  |
| 226 | [Paydesk / Nina insurance](05-screen-implementation.md#screen-226) | `84:2342` | Complete |  |
| 227 | [Paydesk / Nina advance](05-screen-implementation.md#screen-227) | `84:2354` | Complete |  |
| 228 | [Paydesk / Nina prepare](05-screen-implementation.md#screen-228) | `84:2366` | Complete |  |
| 229 | [Paydesk / Nina entries](05-screen-implementation.md#screen-229) | `84:2401` | Complete |  |
| 230 | [Paydesk / Nina draft](05-screen-implementation.md#screen-230) | `84:2410` | Partial | Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina). |
| 231 | [Paydesk / Nina published](05-screen-implementation.md#screen-231) | `84:2438` | Partial | Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina). |
| 232 | [Paydesk / Nina october](05-screen-implementation.md#screen-232) | `84:2461` | Complete |  |
| 233 | [Paydesk / October register](05-screen-implementation.md#screen-233) | `84:2484` | Complete |  |
| 234 | [Paydesk / Months](05-screen-implementation.md#screen-234) | `84:2502` | Complete |  |
| 235 | [Paydesk / Second request](05-screen-implementation.md#screen-235) | `84:2515` | Complete |  |
| 236 | [Paydesk / Second ready](05-screen-implementation.md#screen-236) | `84:2545` | Complete |  |
| 237 | [Paydesk / Second employee](05-screen-implementation.md#screen-237) | `84:2575` | Partial | Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected. |
| 238 | [Paydesk / Second pending](05-screen-implementation.md#screen-238) | `84:2589` | Partial | Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected. |
| 239 | [Paydesk / Second resolved](05-screen-implementation.md#screen-239) | `84:2609` | Partial | Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected. |
| 240 | [Paydesk / Notifications](05-screen-implementation.md#screen-240) | `84:2623` | Partial | Only the empty state (“You’re all caught up.”) is visible; the notification rows are hidden layers. |
| 241 | [Paydesk / October employee](05-screen-implementation.md#screen-241) | `84:2681` | Complete |  |
| 242 | [Payroll / Approved entry / 19 November](05-screen-implementation.md#screen-242) | `90:2098` | Partial | Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”. |
| 243 | [Payroll / Approved entry / 24 November](05-screen-implementation.md#screen-243) | `90:2120` | Partial | Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected. |

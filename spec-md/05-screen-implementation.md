# Screen implementation

All 243 per-screen implementation specs, one per Figma frame, in frame order. This file replaces the former `spec-md/screens/` folder. Each section keeps the original content and adds the Figma design status from [the design completeness report](04-figma-design-completeness.md).

[Overall audit and limitations](03-screen-coverage.md)

## Contents

| # | Screen | Node | Figma design |
| --- | --- | --- | --- |
| 1 | [DailyHR / Splash](#screen-001) | `4:6` | Complete |
| 2 | [DailyHR / Splash · Reveal](#screen-002) | `6:8` | Complete |
| 3 | [DailyHR / Splash · Rest](#screen-003) | `6:14` | Complete |
| 4 | [Employee / Sign in / Empty](#screen-004) | `17:179` | Complete |
| 5 | [Employee / Sign in / Entered](#screen-005) | `17:205` | Complete |
| 6 | [Employee / Sign in / Visible](#screen-006) | `17:231` | Complete |
| 7 | [Employee / Sign in / Loading](#screen-007) | `17:258` | Complete |
| 8 | [HR Admin / Sign in / Empty](#screen-008) | `17:286` | Complete |
| 9 | [HR Admin / Sign in / Entered](#screen-009) | `17:312` | Complete |
| 10 | [HR Admin / Sign in / Visible](#screen-010) | `17:338` | Complete |
| 11 | [HR Admin / Sign in / Loading](#screen-011) | `17:365` | Complete |
| 12 | [Feedback / Sign in / Required](#screen-012) | `17:393` | Complete |
| 13 | [Feedback / Sign in / Invalid email](#screen-013) | `17:421` | Complete |
| 14 | [Feedback / Sign in / Password required](#screen-014) | `17:448` | Complete |
| 15 | [Feedback / Sign in / Incorrect credentials](#screen-015) | `17:475` | Complete |
| 16 | [Feedback / Sign in / Offline](#screen-016) | `17:502` | Complete |
| 17 | [Feedback / Sign in / Unassigned role](#screen-017) | `17:529` | Complete |
| 18 | [Employee / Employee Home](#screen-018) | `18:303` | Complete |
| 19 | [Employee / Profile](#screen-019) | `18:317` | Complete |
| 20 | [Employee / Confirm sign out](#screen-020) | `18:331` | Complete |
| 21 | [HR Admin / HR Overview](#screen-021) | `18:358` | Complete |
| 22 | [HR Admin / Profile](#screen-022) | `18:372` | Complete |
| 23 | [HR Admin / Confirm sign out](#screen-023) | `18:386` | Complete |
| 24 | [HR Admin / Sign in / Required](#screen-024) | `19:419` | Complete |
| 25 | [HR Admin / Splash / Start](#screen-025) | `19:426` | Complete |
| 26 | [HR Admin / Splash / Reveal](#screen-026) | `19:432` | Complete |
| 27 | [HR Admin / Splash / Rest](#screen-027) | `19:438` | Complete |
| 28 | [Returning employee / Splash / Start](#screen-028) | `19:444` | Complete |
| 29 | [Returning employee / Splash / Reveal](#screen-029) | `19:450` | Complete |
| 30 | [Returning employee / Splash / Rest](#screen-030) | `19:456` | Complete |
| 31 | [Returning HR admin / Splash / Start](#screen-031) | `19:462` | Complete |
| 32 | [Returning HR admin / Splash / Reveal](#screen-032) | `19:468` | Complete |
| 33 | [Returning HR admin / Splash / Rest](#screen-033) | `19:474` | Complete |
| 34 | [People / Employee / Edit contact](#screen-034) | `30:380` | Complete |
| 35 | [People / Employee / Edit contact · entered](#screen-035) | `30:400` | Complete |
| 36 | [People / Employee / Profile · saved](#screen-036) | `30:420` | Complete |
| 37 | [People / HR / Directory · initial](#screen-037) | `31:356` | Complete |
| 38 | [People / HR / Directory · added](#screen-038) | `31:371` | Complete |
| 39 | [People / HR / Directory · updated](#screen-039) | `31:392` | Complete |
| 40 | [People / HR / Directory · inactive](#screen-040) | `31:407` | Complete |
| 41 | [People / HR / Directory · ninaUpdated](#screen-041) | `31:422` | Complete |
| 42 | [People / HR / Directory · ninaInactive](#screen-042) | `31:443` | Complete |
| 43 | [People / HR / Maya Chen · active](#screen-043) | `31:464` | Complete |
| 44 | [People / HR / Maya Chen · updated](#screen-044) | `31:491` | Complete |
| 45 | [People / HR / Maya Chen · inactive](#screen-045) | `31:518` | Complete |
| 46 | [People / HR / Deactivate Maya Chen](#screen-046) | `31:539` | Complete |
| 47 | [People / HR / Nina Park · active](#screen-047) | `31:553` | Complete |
| 48 | [People / HR / Nina Park · updated](#screen-048) | `31:580` | Complete |
| 49 | [People / HR / Nina Park · inactive](#screen-049) | `31:607` | Complete |
| 50 | [People / HR / Deactivate Nina Park](#screen-050) | `31:628` | Complete |
| 51 | [People / HR / Add / blank / 00](#screen-051) | `32:1217` | Complete |
| 52 | [People / HR / Add / Required fields](#screen-052) | `32:1250` | Complete |
| 53 | [People / HR / Add / nina / 00](#screen-053) | `32:1284` | Complete |
| 54 | [People / HR / add / Choose Position / 00](#screen-054) | `32:1317` | Complete |
| 55 | [People / HR / add / Choose Department / 00](#screen-055) | `32:1329` | Complete |
| 56 | [People / HR / Add / nina / 01](#screen-056) | `32:1341` | Complete |
| 57 | [People / HR / add / Choose Position / 01](#screen-057) | `32:1374` | Complete |
| 58 | [People / HR / add / Choose Department / 01](#screen-058) | `32:1386` | Complete |
| 59 | [People / HR / Add / nina / 10](#screen-059) | `32:1398` | Complete |
| 60 | [People / HR / add / Choose Position / 10](#screen-060) | `32:1431` | Complete |
| 61 | [People / HR / add / Choose Department / 10](#screen-061) | `32:1443` | Complete |
| 62 | [People / HR / Add / nina / 11](#screen-062) | `32:1455` | Complete |
| 63 | [People / HR / add / Choose Position / 11](#screen-063) | `32:1488` | Complete |
| 64 | [People / HR / add / Choose Department / 11](#screen-064) | `32:1500` | Complete |
| 65 | [People / HR / Edit / maya / 00](#screen-065) | `32:1512` | Complete |
| 66 | [People / HR / maya / Choose Position / 00](#screen-066) | `32:1545` | Complete |
| 67 | [People / HR / maya / Choose Department / 00](#screen-067) | `32:1557` | Complete |
| 68 | [People / HR / Edit / maya / 01](#screen-068) | `32:1569` | Complete |
| 69 | [People / HR / maya / Choose Position / 01](#screen-069) | `32:1602` | Complete |
| 70 | [People / HR / maya / Choose Department / 01](#screen-070) | `32:1614` | Complete |
| 71 | [People / HR / Edit / maya / 10](#screen-071) | `32:1626` | Complete |
| 72 | [People / HR / maya / Choose Position / 10](#screen-072) | `32:1659` | Complete |
| 73 | [People / HR / maya / Choose Department / 10](#screen-073) | `32:1671` | Complete |
| 74 | [People / HR / Edit / maya / 11](#screen-074) | `32:1683` | Complete |
| 75 | [People / HR / maya / Choose Position / 11](#screen-075) | `32:1716` | Complete |
| 76 | [People / HR / maya / Choose Department / 11](#screen-076) | `32:1728` | Complete |
| 77 | [People / HR / Edit / nina / 00](#screen-077) | `32:1740` | Complete |
| 78 | [People / HR / nina / Choose Position / 00](#screen-078) | `32:1773` | Complete |
| 79 | [People / HR / nina / Choose Department / 00](#screen-079) | `32:1785` | Complete |
| 80 | [People / HR / Edit / nina / 01](#screen-080) | `32:1797` | Complete |
| 81 | [People / HR / nina / Choose Position / 01](#screen-081) | `32:1830` | Complete |
| 82 | [People / HR / nina / Choose Department / 01](#screen-082) | `32:1842` | Complete |
| 83 | [People / HR / Edit / nina / 10](#screen-083) | `32:1854` | Complete |
| 84 | [People / HR / nina / Choose Position / 10](#screen-084) | `32:1887` | Complete |
| 85 | [People / HR / nina / Choose Department / 10](#screen-085) | `32:1899` | Complete |
| 86 | [People / HR / Edit / nina / 11](#screen-086) | `32:1911` | Complete |
| 87 | [People / HR / nina / Choose Position / 11](#screen-087) | `32:1944` | Complete |
| 88 | [People / HR / nina / Choose Department / 11](#screen-088) | `32:1956` | Complete |
| 89 | [People / HR / maya / 01 / Record](#screen-089) | `32:2107` | Complete |
| 90 | [People / HR / maya / 01 / Confirmation](#screen-090) | `32:2134` | Complete |
| 91 | [People / HR / maya / 01 / Inactive](#screen-091) | `32:2148` | Complete |
| 92 | [People / HR / maya / 01 / Directory](#screen-092) | `32:2169` | Complete |
| 93 | [People / HR / maya / 01 / Inactive directory](#screen-093) | `32:2179` | Complete |
| 94 | [People / HR / maya / 10 / Record](#screen-094) | `32:2189` | Complete |
| 95 | [People / HR / maya / 10 / Confirmation](#screen-095) | `32:2216` | Complete |
| 96 | [People / HR / maya / 10 / Inactive](#screen-096) | `32:2230` | Complete |
| 97 | [People / HR / maya / 10 / Directory](#screen-097) | `32:2251` | Complete |
| 98 | [People / HR / maya / 10 / Inactive directory](#screen-098) | `32:2261` | Complete |
| 99 | [People / HR / maya / 11 / Confirmation](#screen-099) | `32:2271` | Complete |
| 100 | [People / HR / maya / 11 / Inactive](#screen-100) | `32:2285` | Complete |
| 101 | [People / HR / maya / 11 / Inactive directory](#screen-101) | `32:2306` | Complete |
| 102 | [People / HR / nina / 01 / Record](#screen-102) | `32:2316` | Complete |
| 103 | [People / HR / nina / 01 / Confirmation](#screen-103) | `32:2343` | Complete |
| 104 | [People / HR / nina / 01 / Inactive](#screen-104) | `32:2357` | Complete |
| 105 | [People / HR / nina / 01 / Directory](#screen-105) | `32:2378` | Complete |
| 106 | [People / HR / nina / 01 / Inactive directory](#screen-106) | `32:2389` | Complete |
| 107 | [People / HR / nina / 10 / Record](#screen-107) | `32:2400` | Complete |
| 108 | [People / HR / nina / 10 / Confirmation](#screen-108) | `32:2427` | Complete |
| 109 | [People / HR / nina / 10 / Inactive](#screen-109) | `32:2441` | Complete |
| 110 | [People / HR / nina / 10 / Directory](#screen-110) | `32:2462` | Complete |
| 111 | [People / HR / nina / 10 / Inactive directory](#screen-111) | `32:2473` | Complete |
| 112 | [People / HR / nina / 11 / Confirmation](#screen-112) | `32:2484` | Complete |
| 113 | [People / HR / nina / 11 / Inactive](#screen-113) | `32:2498` | Complete |
| 114 | [People / HR / nina / 11 / Inactive directory](#screen-114) | `32:2519` | Complete |
| 115 | [People / HR / Edit mobile / maya00](#screen-115) | `32:2729` | Complete |
| 116 | [People / HR / Updated mobile / maya00](#screen-116) | `32:2762` | Complete |
| 117 | [People / HR / Edit mobile / maya01](#screen-117) | `32:2789` | Complete |
| 118 | [People / HR / Updated mobile / maya01](#screen-118) | `32:2822` | Complete |
| 119 | [People / HR / Edit mobile / maya10](#screen-119) | `32:2849` | Complete |
| 120 | [People / HR / Updated mobile / maya10](#screen-120) | `32:2882` | Complete |
| 121 | [People / HR / Edit mobile / maya11](#screen-121) | `32:2909` | Complete |
| 122 | [People / HR / Updated mobile / maya11](#screen-122) | `32:2942` | Complete |
| 123 | [People / HR / Edit mobile / nina00](#screen-123) | `32:2969` | Complete |
| 124 | [People / HR / Updated mobile / nina00](#screen-124) | `32:3002` | Complete |
| 125 | [People / HR / Edit mobile / nina01](#screen-125) | `32:3029` | Complete |
| 126 | [People / HR / Updated mobile / nina01](#screen-126) | `32:3062` | Complete |
| 127 | [People / HR / Edit mobile / nina10](#screen-127) | `32:3089` | Complete |
| 128 | [People / HR / Updated mobile / nina10](#screen-128) | `32:3122` | Complete |
| 129 | [People / HR / Edit mobile / nina11](#screen-129) | `32:3149` | Complete |
| 130 | [People / HR / Updated mobile / nina11](#screen-130) | `32:3182` | Complete |
| 131 | [People / Employee / Edit saved contact](#screen-131) | `32:3249` | Complete |
| 132 | [Attendance / Ready](#screen-132) | `37:476` | Complete |
| 133 | [Attendance / Working](#screen-133) | `37:506` | Complete |
| 134 | [Attendance / Complete](#screen-134) | `37:536` | Complete |
| 135 | [Attendance / Location](#screen-135) | `37:563` | Complete |
| 136 | [Attendance / Location unavailable](#screen-136) | `37:577` | Complete |
| 137 | [Attendance / Confirm checkout](#screen-137) | `37:586` | Complete |
| 138 | [Attendance / Calendar Ready 17](#screen-138) | `37:641` | Complete |
| 139 | [Attendance / Calendar Ready 18](#screen-139) | `37:703` | Complete |
| 140 | [Attendance / Calendar Ready 19](#screen-140) | `37:765` | Complete |
| 141 | [Attendance / Calendar Working 17](#screen-141) | `37:827` | Complete |
| 142 | [Attendance / Calendar Working 18](#screen-142) | `37:889` | Complete |
| 143 | [Attendance / Calendar Working 19](#screen-143) | `37:951` | Complete |
| 144 | [Attendance / Calendar Complete 17](#screen-144) | `37:1013` | Complete |
| 145 | [Attendance / Calendar Complete 18](#screen-145) | `37:1075` | Complete |
| 146 | [Attendance / Calendar Complete 19](#screen-146) | `37:1137` | Complete |
| 147 | [Attendance / Daily review 17](#screen-147) | `37:1199` | Complete |
| 148 | [Attendance / Review Maya 17](#screen-148) | `37:1235` | Complete |
| 149 | [Attendance / Review Nina 17](#screen-149) | `37:1253` | Complete |
| 150 | [Attendance / Daily review 18](#screen-150) | `37:1271` | Complete |
| 151 | [Attendance / Review Maya 18](#screen-151) | `37:1307` | Complete |
| 152 | [Attendance / Review Nina 18](#screen-152) | `37:1325` | Complete |
| 153 | [Attendance / Daily review 19](#screen-153) | `37:1343` | Complete |
| 154 | [Attendance / Review Maya 19](#screen-154) | `37:1379` | Complete |
| 155 | [Attendance / Review Nina 19](#screen-155) | `37:1397` | Complete |
| 156 | [Leave / My leave](#screen-156) | `44:1595` | Complete |
| 157 | [Leave / Leave review](#screen-157) | `44:1621` | Complete |
| 158 | [Leave / New request](#screen-158) | `44:1638` | Complete |
| 159 | [Leave / Ready to submit](#screen-159) | `44:1664` | Complete |
| 160 | [Leave / Missing details](#screen-160) | `44:1690` | Complete |
| 161 | [Leave / Leave type](#screen-161) | `44:1717` | Complete |
| 162 | [Leave / First Employee Pending](#screen-162) | `44:1728` | Complete |
| 163 | [Leave / First Employee Resolved](#screen-163) | `44:1747` | Partial |
| 164 | [Leave / First HR Pending](#screen-164) | `44:1763` | Complete |
| 165 | [Leave / First HR Resolved](#screen-165) | `44:1785` | Partial |
| 166 | [Leave / First Confirm Cancel](#screen-166) | `44:1801` | Complete |
| 167 | [Leave / First Confirm Approve](#screen-167) | `44:1817` | Complete |
| 168 | [Leave / First Confirm Reject](#screen-168) | `44:1833` | Complete |
| 169 | [Leave / Second Employee Pending](#screen-169) | `44:1849` | Complete |
| 170 | [Leave / Second Employee Resolved](#screen-170) | `44:1868` | Partial |
| 171 | [Leave / Second HR Pending](#screen-171) | `44:1884` | Complete |
| 172 | [Leave / Second HR Resolved](#screen-172) | `44:1906` | Partial |
| 173 | [Leave / Second Confirm Cancel](#screen-173) | `44:1922` | Complete |
| 174 | [Leave / Second Confirm Approve](#screen-174) | `44:1938` | Complete |
| 175 | [Leave / Second Confirm Reject](#screen-175) | `44:1954` | Complete |
| 176 | [Leave / Dates entered](#screen-176) | `44:1970` | Complete |
| 177 | [Leave / Reason entered](#screen-177) | `44:1996` | Complete |
| 178 | [Leave / Type for Dates entered](#screen-178) | `44:2022` | Complete |
| 179 | [Leave / Type for Reason entered](#screen-179) | `44:2033` | Complete |
| 180 | [Leave / Type for Ready to submit](#screen-180) | `44:2044` | Complete |
| 181 | [HR Admin / Overview menu](#screen-181) | `66:1923` | Complete |
| 182 | [Work / My overtime](#screen-182) | `69:1979` | Complete |
| 183 | [Work / Overtime form](#screen-183) | `69:2002` | Complete |
| 184 | [Work / Overtime validation](#screen-184) | `69:2052` | Complete |
| 185 | [Work / Pick Date](#screen-185) | `69:2103` | Complete |
| 186 | [Work / Pick Start](#screen-186) | `69:2111` | Complete |
| 187 | [Work / Pick End](#screen-187) | `69:2119` | Complete |
| 188 | [Work / Pick Reason](#screen-188) | `69:2130` | Complete |
| 189 | [Work / OT review](#screen-189) | `69:2141` | Complete |
| 190 | [Work / OT employee detail](#screen-190) | `69:2161` | Partial |
| 191 | [Work / OT HR detail](#screen-191) | `69:2181` | Partial |
| 192 | [Work / OT HR decision](#screen-192) | `69:2201` | Partial |
| 193 | [Work / My payslips](#screen-193) | `69:2227` | Complete |
| 194 | [Work / October payslip](#screen-194) | `69:2252` | Complete |
| 195 | [Work / November payslip](#screen-195) | `69:2272` | Complete |
| 196 | [Work / Review draft](#screen-196) | `69:2292` | Complete |
| 197 | [Work / Published payroll](#screen-197) | `69:2317` | Complete |
| 198 | [Work / Payroll](#screen-198) | `69:2337` | Partial |
| 199 | [Work / Prepare payroll](#screen-199) | `69:2353` | Complete |
| 200 | [Work / Set Salary](#screen-200) | `69:2388` | Complete |
| 201 | [Work / Set Deduction](#screen-201) | `69:2399` | Complete |
| 202 | [Work / Calculation salary 0](#screen-202) | `73:2074` | Partial |
| 203 | [Work / Calculation ded 00](#screen-203) | `73:2076` | Partial |
| 204 | [Work / Calculation ot 00](#screen-204) | `73:2078` | Partial |
| 205 | [Work / Calculation ded 01](#screen-205) | `73:2080` | Partial |
| 206 | [Work / Calculation ot 01](#screen-206) | `73:2082` | Partial |
| 207 | [Work / Calculation salary 1](#screen-207) | `73:2084` | Partial |
| 208 | [Work / Calculation ded 10](#screen-208) | `73:2086` | Partial |
| 209 | [Work / Calculation ot 10](#screen-209) | `73:2088` | Partial |
| 210 | [Work / Calculation ded 11](#screen-210) | `73:2090` | Partial |
| 211 | [Work / Calculation ot 11](#screen-211) | `73:2092` | Partial |
| 212 | [Paydesk / Maya pay settings](#screen-212) | `83:2123` | Complete |
| 213 | [Paydesk / Maya base](#screen-213) | `84:2103` | Complete |
| 214 | [Paydesk / Maya rate](#screen-214) | `84:2115` | Complete |
| 215 | [Paydesk / Maya insurance](#screen-215) | `84:2127` | Complete |
| 216 | [Paydesk / Maya advance](#screen-216) | `84:2139` | Complete |
| 217 | [Paydesk / Maya prepare](#screen-217) | `84:2151` | Complete |
| 218 | [Paydesk / Maya entries](#screen-218) | `84:2186` | Partial |
| 219 | [Paydesk / Maya draft](#screen-219) | `84:2205` | Partial |
| 220 | [Paydesk / Maya published](#screen-220) | `84:2233` | Partial |
| 221 | [Paydesk / Maya employee](#screen-221) | `84:2256` | Partial |
| 222 | [Paydesk / Maya october](#screen-222) | `84:2279` | Complete |
| 223 | [Paydesk / Nina pay settings](#screen-223) | `84:2302` | Complete |
| 224 | [Paydesk / Nina base](#screen-224) | `84:2318` | Complete |
| 225 | [Paydesk / Nina rate](#screen-225) | `84:2330` | Complete |
| 226 | [Paydesk / Nina insurance](#screen-226) | `84:2342` | Complete |
| 227 | [Paydesk / Nina advance](#screen-227) | `84:2354` | Complete |
| 228 | [Paydesk / Nina prepare](#screen-228) | `84:2366` | Complete |
| 229 | [Paydesk / Nina entries](#screen-229) | `84:2401` | Complete |
| 230 | [Paydesk / Nina draft](#screen-230) | `84:2410` | Partial |
| 231 | [Paydesk / Nina published](#screen-231) | `84:2438` | Partial |
| 232 | [Paydesk / Nina october](#screen-232) | `84:2461` | Complete |
| 233 | [Paydesk / October register](#screen-233) | `84:2484` | Complete |
| 234 | [Paydesk / Months](#screen-234) | `84:2502` | Complete |
| 235 | [Paydesk / Second request](#screen-235) | `84:2515` | Complete |
| 236 | [Paydesk / Second ready](#screen-236) | `84:2545` | Complete |
| 237 | [Paydesk / Second employee](#screen-237) | `84:2575` | Partial |
| 238 | [Paydesk / Second pending](#screen-238) | `84:2589` | Partial |
| 239 | [Paydesk / Second resolved](#screen-239) | `84:2609` | Partial |
| 240 | [Paydesk / Notifications](#screen-240) | `84:2623` | Partial |
| 241 | [Paydesk / October employee](#screen-241) | `84:2681` | Complete |
| 242 | [Payroll / Approved entry / 19 November](#screen-242) | `90:2098` | Partial |
| 243 | [Payroll / Approved entry / 24 November](#screen-243) | `90:2120` | Partial |

<a id="screen-001"></a>

## 1. DailyHR / Splash

- Figma frame: [`4:6`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=4-6)
- Screen/state: **Splash**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 453 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-002"></a>

## 2. DailyHR / Splash · Reveal

- Figma frame: [`6:8`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=6-8)
- Screen/state: **Splash · Reveal**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 447 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-003"></a>

## 3. DailyHR / Splash · Rest

- Figma frame: [`6:14`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=6-14)
- Screen/state: **Splash · Rest**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 433 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-004"></a>

## 4. Employee / Sign in / Empty

- Figma frame: [`17:179`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-179)
- Screen/state: **Empty**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| name@company.com | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| Enter your password | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |
| DailyHR | 177 px | 86 px | 39 px |
| Try HR Admin demo | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-005"></a>

## 5. Employee / Sign in / Entered

- Figma frame: [`17:205`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-205)
- Screen/state: **Entered**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| maya@dailyhr.example | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| •••••••••• | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |
| DailyHR | 177 px | 86 px | 39 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-006"></a>

## 6. Employee / Sign in / Visible

- Figma frame: [`17:231`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-231)
- Screen/state: **Visible**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| maya@dailyhr.example | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| DemoPass42 | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |
| DailyHR | 177 px | 86 px | 39 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-007"></a>

## 7. Employee / Sign in / Loading

- Figma frame: [`17:258`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-258)
- Screen/state: **Loading**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| maya@dailyhr.example | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| •••••••••• | 75 px | 277 px | 16 px |
| Signing in… | 171 px | 17 px | 16 px |
| DailyHR | 177 px | 86 px | 39 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-008"></a>

## 8. HR Admin / Sign in / Empty

- Figma frame: [`17:286`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-286)
- Screen/state: **Empty**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| name@company.com | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| Enter your password | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |
| DailyHR | 177 px | 86 px | 39 px |
| Try Employee demo | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-009"></a>

## 9. HR Admin / Sign in / Entered

- Figma frame: [`17:312`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-312)
- Screen/state: **Entered**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 177 px | 86 px | 39 px |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| arun@dailyhr.example | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| •••••••••• | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-010"></a>

## 10. HR Admin / Sign in / Visible

- Figma frame: [`17:338`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-338)
- Screen/state: **Visible**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 177 px | 86 px | 39 px |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| arun@dailyhr.example | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| DemoPass42 | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-011"></a>

## 11. HR Admin / Sign in / Loading

- Figma frame: [`17:365`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-365)
- Screen/state: **Loading**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 177 px | 86 px | 39 px |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| arun@dailyhr.example | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| •••••••••• | 75 px | 277 px | 16 px |
| Signing in… | 171 px | 17 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-012"></a>

## 12. Feedback / Sign in / Required

- Figma frame: [`17:393`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-393)
- Screen/state: **Required**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| name@company.com | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| Enter your password | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |
| ⓘ Enter your work email. | 26 px | 201 px | 13 px |
| ⓘ Enter your password. | 26 px | 319 px | 13 px |
| DailyHR | 177 px | 86 px | 39 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-013"></a>

## 13. Feedback / Sign in / Invalid email

- Figma frame: [`17:421`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-421)
- Screen/state: **Invalid email**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| maya@ | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| •••••••••• | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |
| ⓘ Enter a valid email address. | 26 px | 201 px | 13 px |
| DailyHR | 177 px | 86 px | 39 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-014"></a>

## 14. Feedback / Sign in / Password required

- Figma frame: [`17:448`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-448)
- Screen/state: **Password required**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| maya@dailyhr.example | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| Enter your password | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |
| ⓘ Enter your password. | 26 px | 319 px | 13 px |
| DailyHR | 177 px | 86 px | 39 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-015"></a>

## 15. Feedback / Sign in / Incorrect credentials

- Figma frame: [`17:475`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-475)
- Screen/state: **Incorrect credentials**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| maya@dailyhr.example | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| •••••••••• | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |
| ⓘ The email or password is incorrect. Try again. | 24 px | 430 px | 15 px |
| DailyHR | 177 px | 86 px | 39 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-016"></a>

## 16. Feedback / Sign in / Offline

- Figma frame: [`17:502`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-502)
- Screen/state: **Offline**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| maya@dailyhr.example | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| •••••••••• | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |
| ⓘ Couldn’t connect. Check your internet connection and try again. | 24 px | 430 px | 15 px |
| DailyHR | 177 px | 86 px | 39 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-017"></a>

## 17. Feedback / Sign in / Unassigned role

- Figma frame: [`17:529`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=17-529)
- Screen/state: **Unassigned role**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| maya@dailyhr.example | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| •••••••••• | 75 px | 277 px | 16 px |
| Sign out | 171 px | 17 px | 16 px |
| ⓘ Your account needs a role before you can continue. Contact HR. | 24 px | 430 px | 15 px |
| DailyHR | 177 px | 86 px | 39 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-018"></a>

## 18. Employee / Employee Home

- Figma frame: [`18:303`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=18-303)
- Screen/state: **Employee Home**
- Implementation: [`Workspace.dashboard`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete for “Ready to check in” only; no Working or Shift complete home variant.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign in to the corresponding employee/HR workspace.

### Implemented behavior

Show current attendance and request/payroll navigation; the HR menu opens employee, attendance, review and payroll workflows.

### State and implementation notes

Counts and summaries are derived from the shared demo records; the overview menu uses Flutter popup-menu behavior.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 80 px | 65 px | 24 px |
| Good morning, Maya | 30 px | 118 px | 32 px |
| Recent requests | 30 px | 373 px | 22 px |
| Profile | 60 px | 12 px | 15 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |
| Today’s attendance | 48 px | 215 px | 15 px |
| Ready to check in | 48 px | 249 px | 25 px |
| Working hours | 48 px | 299 px | 14 px |
| — | 163 px | 296 px | 17 px |
| Leave | 41 px | 14 px | 14 px |
| Pending | 13 px | 47 px | 16 px |
| Overtime | 41 px | 14 px | 14 px |
| No request | 13 px | 47 px | 16 px |
| Quick actions | 30 px | 537 px | 20 px |
| Attendance | 42 px | 18 px | 14 px |
| My leave | 42 px | 18 px | 14 px |
| Overtime | 42 px | 18 px | 14 px |
| My payslips | 42 px | 18 px | 14 px |
| Notifications | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-019"></a>

## 19. Employee / Profile

- Figma frame: [`18:317`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=18-317)
- Screen/state: **Profile**
- Implementation: [`ProfileBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Choose the Profile bottom-navigation tab.

### Implemented behavior

Show role identity, work email and employee employment/contact details. Employees can edit contact details; both roles can sign out.

### State and implementation notes

Saved-contact variants read the same Employee object after a successful save; cancelled edits retain saved data.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Home | — | — | — |
| Profile | 30 px | 119 px | 34 px |
| MC | 66.5 px | 209 px | 20 px |
| Maya Chen | 108 px | 205 px | 22 px |
| Employee | 108 px | 238 px | 14 px |
| Work email | 62 px | 13 px | 17 px |
| maya@dailyhr.example | 62 px | 40 px | 14 px |
| Sign out | 171 px | 17 px | 16 px |
| Employment | 60 px | 358 px | 19 px |
| Position | 48 px | 412 px | 14 px |
| People Coordinator | 353 px | 412 px | 14 px |
| Department | 48 px | 452 px | 14 px |
| People Operations | 353 px | 452 px | 14 px |
| Contact details | 60 px | 514 px | 19 px |
| Mobile | 48 px | 562 px | 14 px |
| 081 555 0124 | 353 px | 562 px | 14 px |
| Personal email | 48 px | 600 px | 14 px |
| maya@example.com | 353 px | 600 px | 14 px |
| Edit contact details | 171 px | 15 px | 16 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-020"></a>

## 20. Employee / Confirm sign out

- Figma frame: [`18:331`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=18-331)
- Screen/state: **Confirm sign out**
- Implementation: [`Workspace.signOut / confirm`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Open Profile, then Sign out.

### Implemented behavior

White confirmation sheet supports Sign out and Stay signed in. Confirmation clears the persisted session.

### State and implementation notes

A shared bottom-sheet component supplies both employee and HR variants.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Sign out of DailyHR? | 30 px | 42 px | 26 px |
| You can sign back in with your work email. | 30 px | 83 px | 15 px |
| Sign out | 171 px | 17 px | 16 px |
| Stay signed in | 171 px | 17 px | 16 px |
| ‹ Home | 30 px | 65 px | 16 px |
| Profile | 30 px | 119 px | 34 px |
| MC | 66.5 px | 209 px | 20 px |
| Maya Chen | 108 px | 205 px | 22 px |
| Employee | 108 px | 238 px | 14 px |
| Work email | 62 px | 13 px | 17 px |
| maya@dailyhr.example | 62 px | 40 px | 14 px |
| Sign out | 171 px | 17 px | 16 px |
| Employment | 60 px | 358 px | 19 px |
| Position | 48 px | 412 px | 14 px |
| People Coordinator | 353 px | 412 px | 14 px |
| Department | 48 px | 452 px | 14 px |
| People Operations | 353 px | 452 px | 14 px |
| Contact details | 60 px | 514 px | 19 px |
| Mobile | 48 px | 562 px | 14 px |
| 081 555 0124 | 353 px | 562 px | 14 px |
| Personal email | 48 px | 600 px | 14 px |
| maya@example.com | 353 px | 600 px | 14 px |
| Edit contact details | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-021"></a>

## 21. HR Admin / HR Overview

- Figma frame: [`18:358`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=18-358)
- Screen/state: **HR Overview**
- Implementation: [`Workspace.dashboard`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign in to the corresponding employee/HR workspace.

### Implemented behavior

Show current attendance and request/payroll navigation; the HR menu opens employee, attendance, review and payroll workflows.

### State and implementation notes

Counts and summaries are derived from the shared demo records; the overview menu uses Flutter popup-menu behavior.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 80 px | 65 px | 24 px |
| HR overview | 30 px | 118 px | 32 px |
| Needs a decision | 30 px | 373 px | 22 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |
| Daily attendance | 48 px | 215 px | 15 px |
| 1 | 48 px | 246 px | 28 px |
| Checked in | 48 px | 293 px | 13 px |
| 0 | 154 px | 246 px | 28 px |
| On leave | 154 px | 293 px | 13 px |
| 2 | 260 px | 246 px | 28 px |
| Employees | 260 px | 293 px | 13 px |
| Leave queue | 41 px | 14 px | 14 px |
| 1 pending | 13 px | 47 px | 16 px |
| Overtime | 41 px | 14 px | 14 px |
| No pending overtime | 13 px | 47 px | 16 px |
| Quick actions | 30 px | 537 px | 20 px |
| Employees | 42 px | 18 px | 14 px |
| Attendance | 42 px | 18 px | 14 px |
| Leave requests | 42 px | 18 px | 14 px |
| Overtime | 42 px | 18 px | 14 px |
| Payroll | 42 px | 18 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-022"></a>

## 22. HR Admin / Profile

- Figma frame: [`18:372`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=18-372)
- Screen/state: **Profile**
- Implementation: [`ProfileBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Choose the Profile bottom-navigation tab.

### Implemented behavior

Show role identity, work email and employee employment/contact details. Employees can edit contact details; both roles can sign out.

### State and implementation notes

Saved-contact variants read the same Employee object after a successful save; cancelled edits retain saved data.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Home | — | — | — |
| Profile | 30 px | 119 px | 34 px |
| AP | 66.5 px | 209 px | 20 px |
| Arun Patel | 108 px | 205 px | 22 px |
| HR Admin | 108 px | 238 px | 14 px |
| Work email | 62 px | 13 px | 17 px |
| arun@dailyhr.example | 62 px | 40 px | 14 px |
| Sign out | 171 px | 17 px | 16 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-023"></a>

## 23. HR Admin / Confirm sign out

- Figma frame: [`18:386`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=18-386)
- Screen/state: **Confirm sign out**
- Implementation: [`Workspace.signOut / confirm`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Open Profile, then Sign out.

### Implemented behavior

White confirmation sheet supports Sign out and Stay signed in. Confirmation clears the persisted session.

### State and implementation notes

A shared bottom-sheet component supplies both employee and HR variants.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Sign out of DailyHR? | 30 px | 42 px | 26 px |
| You can sign back in with your work email. | 30 px | 83 px | 15 px |
| Sign out | 171 px | 17 px | 16 px |
| Stay signed in | 171 px | 17 px | 16 px |
| ‹ Home | 30 px | 65 px | 16 px |
| Profile | 30 px | 119 px | 34 px |
| AP | 66.5 px | 209 px | 20 px |
| Arun Patel | 108 px | 205 px | 22 px |
| HR Admin | 108 px | 238 px | 14 px |
| Work email | 62 px | 13 px | 17 px |
| arun@dailyhr.example | 62 px | 40 px | 14 px |
| Sign out | 171 px | 17 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-024"></a>

## 24. HR Admin / Sign in / Required

- Figma frame: [`19:419`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=19-419)
- Screen/state: **Required**
- Implementation: [`SignInScreen`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign out, then choose Employee or HR Admin demo.

### Implemented behavior

Email/password fields retain input; visibility, loading, required/invalid input, incorrect credentials, offline simulation and unassigned-role feedback are supported.

### State and implementation notes

Authentication is fictional and local. Use DemoPass42 with maya@dailyhr.example or arun@dailyhr.example; old demo credentials remain aliases.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Welcome back | 24 px | — | 36 px |
| Sign in to DailyHR with your work email. | 24 px | 53 px | 15 px |
| Work email | 24 px | 116 px | 14 px |
| name@company.com | 75 px | 160 px | 16 px |
| Password | 24 px | 233 px | 14 px |
| Enter your password | 75 px | 277 px | 16 px |
| Sign in | 171 px | 17 px | 16 px |
| ⓘ Enter your work email. | 26 px | 201 px | 13 px |
| ⓘ Enter your password. | 26 px | 319 px | 13 px |
| DailyHR | 177 px | 86 px | 39 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-025"></a>

## 25. HR Admin / Splash / Start

- Figma frame: [`19:426`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=19-426)
- Screen/state: **Start**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete; visually identical to the base splash (no role-specific difference).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 453 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-026"></a>

## 26. HR Admin / Splash / Reveal

- Figma frame: [`19:432`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=19-432)
- Screen/state: **Reveal**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete; visually identical to the base splash (no role-specific difference).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 447 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-027"></a>

## 27. HR Admin / Splash / Rest

- Figma frame: [`19:438`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=19-438)
- Screen/state: **Rest**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete; visually identical to the base splash (no role-specific difference).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 433 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-028"></a>

## 28. Returning employee / Splash / Start

- Figma frame: [`19:444`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=19-444)
- Screen/state: **Start**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete; visually identical to the base splash (no role-specific difference).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 453 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-029"></a>

## 29. Returning employee / Splash / Reveal

- Figma frame: [`19:450`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=19-450)
- Screen/state: **Reveal**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete; visually identical to the base splash (no role-specific difference).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 447 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-030"></a>

## 30. Returning employee / Splash / Rest

- Figma frame: [`19:456`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=19-456)
- Screen/state: **Rest**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete; visually identical to the base splash (no role-specific difference).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 433 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-031"></a>

## 31. Returning HR admin / Splash / Start

- Figma frame: [`19:462`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=19-462)
- Screen/state: **Start**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete; visually identical to the base splash (no role-specific difference).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 453 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-032"></a>

## 32. Returning HR admin / Splash / Reveal

- Figma frame: [`19:468`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=19-468)
- Screen/state: **Reveal**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete; visually identical to the base splash (no role-specific difference).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 447 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-033"></a>

## 33. Returning HR admin / Splash / Rest

- Figma frame: [`19:474`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=19-474)
- Screen/state: **Rest**
- Implementation: [`SplashScreen / DailyHrApp`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete; visually identical to the base splash (no role-specific difference).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Launch the app with or without a saved employee/HR session.

### Implemented behavior

Logo and landscape artwork animate before routing to sign-in or the restored workspace.

### State and implementation notes

Animation phases share one widget; exact Figma transition timing remains to be compared.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 201 px | 433 px | 52 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-034"></a>

## 34. People / Employee / Edit contact

- Figma frame: [`30:380`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=30-380)
- Screen/state: **Edit contact**
- Implementation: [`EmployeeForm(contactOnly: true)`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Profile → Edit contact details.

### Implemented behavior

Edit mobile and personal email; Save changes validates and persists only the signed-in employee; Cancel returns without mutation.

### State and implementation notes

Entered and preserved-input states use controllers owned by the form.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Profile | 60 px | 15 px | 16 px |
| Edit contact details | 30 px | 141 px | 32 px |
| Update how HR can reach you. | 30 px | 195 px | 16 px |
| Mobile number | — | — | 13 px |
| 081 555 0124 | 15 px | 39 px | 15 px |
| Personal email | — | — | 13 px |
| maya@example.com | 15 px | 39 px | 15 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-035"></a>

## 35. People / Employee / Edit contact · entered

- Figma frame: [`30:400`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=30-400)
- Screen/state: **Edit contact · entered**
- Implementation: [`EmployeeForm(contactOnly: true)`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Profile → Edit contact details.

### Implemented behavior

Edit mobile and personal email; Save changes validates and persists only the signed-in employee; Cancel returns without mutation.

### State and implementation notes

Entered and preserved-input states use controllers owned by the form.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Profile | 60 px | 15 px | 16 px |
| Edit contact details | 30 px | 141 px | 32 px |
| Update how HR can reach you. | 30 px | 195 px | 16 px |
| Mobile number | — | — | 13 px |
| 089 555 0126 | 15 px | 39 px | 15 px |
| Personal email | — | — | 13 px |
| maya.c@example.com | 15 px | 39 px | 15 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-036"></a>

## 36. People / Employee / Profile · saved

- Figma frame: [`30:420`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=30-420)
- Screen/state: **Profile · saved**
- Implementation: [`ProfileBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Choose the Profile bottom-navigation tab.

### Implemented behavior

Show role identity, work email and employee employment/contact details. Employees can edit contact details; both roles can sign out.

### State and implementation notes

Saved-contact variants read the same Employee object after a successful save; cancelled edits retain saved data.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Home | — | — | — |
| Profile | 30 px | 119 px | 34 px |
| MC | 66.5 px | 209 px | 20 px |
| Maya Chen | 108 px | 205 px | 22 px |
| Employee | 108 px | 238 px | 14 px |
| Work email | 62 px | 13 px | 17 px |
| maya@dailyhr.example | 62 px | 40 px | 14 px |
| Sign out | 171 px | 17 px | 16 px |
| Employment | 60 px | 358 px | 19 px |
| Position | 48 px | 412 px | 14 px |
| People Coordinator | 353 px | 412 px | 14 px |
| Department | 48 px | 452 px | 14 px |
| People Operations | 353 px | 452 px | 14 px |
| Contact details | 60 px | 514 px | 19 px |
| Mobile | 48 px | 562 px | 14 px |
| 089 555 0126 | 353 px | 562 px | 14 px |
| Personal email | 48 px | 600 px | 14 px |
| maya.c@example.com | 353 px | 600 px | 14 px |
| Edit contact details | 171 px | 15 px | 16 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-037"></a>

## 37. People / HR / Directory · initial

- Figma frame: [`31:356`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-356)
- Screen/state: **Directory · initial**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-038"></a>

## 38. People / HR / Directory · added

- Figma frame: [`31:371`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-371)
- Screen/state: **Directory · added**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| NP | 38 px | 33 px | 15 px |
| Nina Park | 76 px | 17 px | 17 px |
| Product Design | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-039"></a>

## 39. People / HR / Directory · updated

- Figma frame: [`31:392`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-392)
- Screen/state: **Directory · updated**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| Business Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-040"></a>

## 40. People / HR / Directory · inactive

- Figma frame: [`31:407`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-407)
- Screen/state: **Directory · inactive**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| Inactive · People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-041"></a>

## 41. People / HR / Directory · ninaUpdated

- Figma frame: [`31:422`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-422)
- Screen/state: **Directory · ninaUpdated**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| NP | 38 px | 33 px | 15 px |
| Nina Park | 76 px | 17 px | 17 px |
| Business Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-042"></a>

## 42. People / HR / Directory · ninaInactive

- Figma frame: [`31:443`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-443)
- Screen/state: **Directory · ninaInactive**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| NP | 38 px | 33 px | 15 px |
| Nina Park | 76 px | 17 px | 17 px |
| Inactive · Product Design | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-043"></a>

## 43. People / HR / Maya Chen · active

- Figma frame: [`31:464`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-464)
- Screen/state: **Maya Chen · active**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| People Coordinator | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| People Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0124 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-044"></a>

## 44. People / HR / Maya Chen · updated

- Figma frame: [`31:491`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-491)
- Screen/state: **Maya Chen · updated**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0124 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-045"></a>

## 45. People / HR / Maya Chen · inactive

- Figma frame: [`31:518`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-518)
- Screen/state: **Maya Chen · inactive**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Inactive | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| People Coordinator | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| People Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0124 | 353 px | 631 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-046"></a>

## 46. People / HR / Deactivate Maya Chen

- Figma frame: [`31:539`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-539)
- Screen/state: **Deactivate Maya Chen**
- Implementation: [`EmployeeDetail → DecisionPage`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Active employee record → Deactivate profile.

### Implemented behavior

Show the selected employee name and retention explanation. Confirm marks that employee inactive; Keep active returns without changes.

### State and implementation notes

Deactivation retains attendance, requests and payroll history; inactive detail hides edit/pay/deactivation actions.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Deactivate profile | 30 px | 141 px | 32 px |
| Deactivate Maya Chen? | 49 px | 261 px | 21 px |
| This marks the employee profile as inactive. The employee record and its history will be kept. | 49 px | 320 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Keep active | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-047"></a>

## 47. People / HR / Nina Park · active

- Figma frame: [`31:553`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-553)
- Screen/state: **Nina Park · active**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Design Associate | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Product Design | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0138 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-048"></a>

## 48. People / HR / Nina Park · updated

- Figma frame: [`31:580`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-580)
- Screen/state: **Nina Park · updated**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0138 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-049"></a>

## 49. People / HR / Nina Park · inactive

- Figma frame: [`31:607`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-607)
- Screen/state: **Nina Park · inactive**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Inactive | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Design Associate | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Product Design | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0138 | 353 px | 631 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-050"></a>

## 50. People / HR / Deactivate Nina Park

- Figma frame: [`31:628`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=31-628)
- Screen/state: **Deactivate Nina Park**
- Implementation: [`EmployeeDetail → DecisionPage`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Active employee record → Deactivate profile.

### Implemented behavior

Show the selected employee name and retention explanation. Confirm marks that employee inactive; Keep active returns without changes.

### State and implementation notes

Deactivation retains attendance, requests and payroll history; inactive detail hides edit/pay/deactivation actions.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Deactivate profile | 30 px | 141 px | 32 px |
| Deactivate Nina Park? | 49 px | 261 px | 21 px |
| This marks the employee profile as inactive. The employee record and its history will be kept. | 49 px | 320 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Keep active | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-051"></a>

## 51. People / HR / Add / blank / 00

- Figma frame: [`32:1217`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1217)
- Screen/state: **00**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Add employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Enter full name | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| name@company.com | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| Enter mobile number | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Choose position | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Choose department | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Add employee | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-052"></a>

## 52. People / HR / Add / Required fields

- Figma frame: [`32:1250`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1250)
- Screen/state: **Required fields**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Add employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Enter full name | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| name@company.com | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| Enter mobile number | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Choose position | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Choose department | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Add employee | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |
| Enter a name, work email, position and department. | 30 px | 817 px | 13 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-053"></a>

## 53. People / HR / Add / nina / 00

- Figma frame: [`32:1284`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1284)
- Screen/state: **00**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Add employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0138 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Design Associate | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Product Design | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Add employee | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-054"></a>

## 54. People / HR / add / Choose Position / 00

- Figma frame: [`32:1317`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1317)
- Screen/state: **00**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Design Associate ✓ | 171 px | 15 px | 16 px |
| Team Lead | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-055"></a>

## 55. People / HR / add / Choose Department / 00

- Figma frame: [`32:1329`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1329)
- Screen/state: **00**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Product Design ✓ | 171 px | 15 px | 16 px |
| Business Operations | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-056"></a>

## 56. People / HR / Add / nina / 01

- Figma frame: [`32:1341`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1341)
- Screen/state: **01**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Add employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0138 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Design Associate | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Business Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Add employee | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-057"></a>

## 57. People / HR / add / Choose Position / 01

- Figma frame: [`32:1374`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1374)
- Screen/state: **01**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Design Associate ✓ | 171 px | 15 px | 16 px |
| Team Lead | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-058"></a>

## 58. People / HR / add / Choose Department / 01

- Figma frame: [`32:1386`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1386)
- Screen/state: **01**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Product Design | 171 px | 15 px | 16 px |
| Business Operations ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-059"></a>

## 59. People / HR / Add / nina / 10

- Figma frame: [`32:1398`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1398)
- Screen/state: **10**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Add employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0138 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Team Lead | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Product Design | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Add employee | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-060"></a>

## 60. People / HR / add / Choose Position / 10

- Figma frame: [`32:1431`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1431)
- Screen/state: **10**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Design Associate | 171 px | 15 px | 16 px |
| Team Lead ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-061"></a>

## 61. People / HR / add / Choose Department / 10

- Figma frame: [`32:1443`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1443)
- Screen/state: **10**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Product Design ✓ | 171 px | 15 px | 16 px |
| Business Operations | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-062"></a>

## 62. People / HR / Add / nina / 11

- Figma frame: [`32:1455`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1455)
- Screen/state: **11**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Add employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0138 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Team Lead | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Business Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Add employee | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-063"></a>

## 63. People / HR / add / Choose Position / 11

- Figma frame: [`32:1488`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1488)
- Screen/state: **11**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Design Associate | 171 px | 15 px | 16 px |
| Team Lead ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-064"></a>

## 64. People / HR / add / Choose Department / 11

- Figma frame: [`32:1500`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1500)
- Screen/state: **11**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Product Design | 171 px | 15 px | 16 px |
| Business Operations ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-065"></a>

## 65. People / HR / Edit / maya / 00

- Figma frame: [`32:1512`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1512)
- Screen/state: **00**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Maya Chen | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| maya@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 081 555 0124 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| People Coordinator | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| People Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-066"></a>

## 66. People / HR / maya / Choose Position / 00

- Figma frame: [`32:1545`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1545)
- Screen/state: **00**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Maya Chen | 30 px | 194 px | 16 px |
| People Coordinator ✓ | 171 px | 15 px | 16 px |
| Team Lead | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-067"></a>

## 67. People / HR / maya / Choose Department / 00

- Figma frame: [`32:1557`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1557)
- Screen/state: **00**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Maya Chen | 30 px | 194 px | 16 px |
| People Operations ✓ | 171 px | 15 px | 16 px |
| Business Operations | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-068"></a>

## 68. People / HR / Edit / maya / 01

- Figma frame: [`32:1569`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1569)
- Screen/state: **01**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Maya Chen | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| maya@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 081 555 0124 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| People Coordinator | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Business Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-069"></a>

## 69. People / HR / maya / Choose Position / 01

- Figma frame: [`32:1602`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1602)
- Screen/state: **01**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Maya Chen | 30 px | 194 px | 16 px |
| People Coordinator ✓ | 171 px | 15 px | 16 px |
| Team Lead | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-070"></a>

## 70. People / HR / maya / Choose Department / 01

- Figma frame: [`32:1614`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1614)
- Screen/state: **01**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Maya Chen | 30 px | 194 px | 16 px |
| People Operations | 171 px | 15 px | 16 px |
| Business Operations ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-071"></a>

## 71. People / HR / Edit / maya / 10

- Figma frame: [`32:1626`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1626)
- Screen/state: **10**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Maya Chen | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| maya@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 081 555 0124 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Team Lead | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| People Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-072"></a>

## 72. People / HR / maya / Choose Position / 10

- Figma frame: [`32:1659`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1659)
- Screen/state: **10**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Maya Chen | 30 px | 194 px | 16 px |
| People Coordinator | 171 px | 15 px | 16 px |
| Team Lead ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-073"></a>

## 73. People / HR / maya / Choose Department / 10

- Figma frame: [`32:1671`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1671)
- Screen/state: **10**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Maya Chen | 30 px | 194 px | 16 px |
| People Operations ✓ | 171 px | 15 px | 16 px |
| Business Operations | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-074"></a>

## 74. People / HR / Edit / maya / 11

- Figma frame: [`32:1683`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1683)
- Screen/state: **11**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Maya Chen | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| maya@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 081 555 0124 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Team Lead | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Business Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-075"></a>

## 75. People / HR / maya / Choose Position / 11

- Figma frame: [`32:1716`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1716)
- Screen/state: **11**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Maya Chen | 30 px | 194 px | 16 px |
| People Coordinator | 171 px | 15 px | 16 px |
| Team Lead ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-076"></a>

## 76. People / HR / maya / Choose Department / 11

- Figma frame: [`32:1728`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1728)
- Screen/state: **11**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Maya Chen | 30 px | 194 px | 16 px |
| People Operations | 171 px | 15 px | 16 px |
| Business Operations ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-077"></a>

## 77. People / HR / Edit / nina / 00

- Figma frame: [`32:1740`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1740)
- Screen/state: **00**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0138 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Design Associate | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Product Design | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-078"></a>

## 78. People / HR / nina / Choose Position / 00

- Figma frame: [`32:1773`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1773)
- Screen/state: **00**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Design Associate ✓ | 171 px | 15 px | 16 px |
| Team Lead | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-079"></a>

## 79. People / HR / nina / Choose Department / 00

- Figma frame: [`32:1785`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1785)
- Screen/state: **00**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Product Design ✓ | 171 px | 15 px | 16 px |
| Business Operations | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-080"></a>

## 80. People / HR / Edit / nina / 01

- Figma frame: [`32:1797`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1797)
- Screen/state: **01**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0138 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Design Associate | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Business Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-081"></a>

## 81. People / HR / nina / Choose Position / 01

- Figma frame: [`32:1830`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1830)
- Screen/state: **01**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Design Associate ✓ | 171 px | 15 px | 16 px |
| Team Lead | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-082"></a>

## 82. People / HR / nina / Choose Department / 01

- Figma frame: [`32:1842`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1842)
- Screen/state: **01**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Product Design | 171 px | 15 px | 16 px |
| Business Operations ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-083"></a>

## 83. People / HR / Edit / nina / 10

- Figma frame: [`32:1854`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1854)
- Screen/state: **10**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0138 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Team Lead | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Product Design | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-084"></a>

## 84. People / HR / nina / Choose Position / 10

- Figma frame: [`32:1887`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1887)
- Screen/state: **10**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Design Associate | 171 px | 15 px | 16 px |
| Team Lead ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-085"></a>

## 85. People / HR / nina / Choose Department / 10

- Figma frame: [`32:1899`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1899)
- Screen/state: **10**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Product Design ✓ | 171 px | 15 px | 16 px |
| Business Operations | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-086"></a>

## 86. People / HR / Edit / nina / 11

- Figma frame: [`32:1911`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1911)
- Screen/state: **11**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0138 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Team Lead | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Business Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-087"></a>

## 87. People / HR / nina / Choose Position / 11

- Figma frame: [`32:1944`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1944)
- Screen/state: **11**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose position | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Design Associate | 171 px | 15 px | 16 px |
| Team Lead ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-088"></a>

## 88. People / HR / nina / Choose Department / 11

- Figma frame: [`32:1956`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-1956)
- Screen/state: **11**
- Implementation: [`EmployeeForm.picker → ChoicePage<String>`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Add/Edit employee → Position or Department.

### Implemented behavior

Open a full-screen option list, highlight the current value and return the chosen value to the same form.

### State and implementation notes

Position and department are independent; choosing one preserves the other and all entered contact fields. The app exposes the union of demo choices rather than restricting choices by employee name.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Form | 60 px | 15 px | 16 px |
| Choose department | 30 px | 141 px | 32 px |
| Nina Park | 30 px | 194 px | 16 px |
| Product Design | 171 px | 15 px | 16 px |
| Business Operations ✓ | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-089"></a>

## 89. People / HR / maya / 01 / Record

- Figma frame: [`32:2107`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2107)
- Screen/state: **Record**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| People Coordinator | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0124 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-090"></a>

## 90. People / HR / maya / 01 / Confirmation

- Figma frame: [`32:2134`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2134)
- Screen/state: **Confirmation**
- Implementation: [`EmployeeDetail → DecisionPage`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Active employee record → Deactivate profile.

### Implemented behavior

Show the selected employee name and retention explanation. Confirm marks that employee inactive; Keep active returns without changes.

### State and implementation notes

Deactivation retains attendance, requests and payroll history; inactive detail hides edit/pay/deactivation actions.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Deactivate profile | 30 px | 141 px | 32 px |
| Deactivate Maya Chen? | 49 px | 261 px | 21 px |
| This marks the employee profile as inactive. The employee record and its history will be kept. | 49 px | 320 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Keep active | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-091"></a>

## 91. People / HR / maya / 01 / Inactive

- Figma frame: [`32:2148`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2148)
- Screen/state: **Inactive**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Inactive | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| People Coordinator | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0124 | 353 px | 631 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-092"></a>

## 92. People / HR / maya / 01 / Directory

- Figma frame: [`32:2169`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2169)
- Screen/state: **Directory**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| Business Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-093"></a>

## 93. People / HR / maya / 01 / Inactive directory

- Figma frame: [`32:2179`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2179)
- Screen/state: **Inactive directory**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| Inactive · Business Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-094"></a>

## 94. People / HR / maya / 10 / Record

- Figma frame: [`32:2189`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2189)
- Screen/state: **Record**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| People Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0124 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-095"></a>

## 95. People / HR / maya / 10 / Confirmation

- Figma frame: [`32:2216`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2216)
- Screen/state: **Confirmation**
- Implementation: [`EmployeeDetail → DecisionPage`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Active employee record → Deactivate profile.

### Implemented behavior

Show the selected employee name and retention explanation. Confirm marks that employee inactive; Keep active returns without changes.

### State and implementation notes

Deactivation retains attendance, requests and payroll history; inactive detail hides edit/pay/deactivation actions.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Deactivate profile | 30 px | 141 px | 32 px |
| Deactivate Maya Chen? | 49 px | 261 px | 21 px |
| This marks the employee profile as inactive. The employee record and its history will be kept. | 49 px | 320 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Keep active | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-096"></a>

## 96. People / HR / maya / 10 / Inactive

- Figma frame: [`32:2230`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2230)
- Screen/state: **Inactive**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Inactive | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| People Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0124 | 353 px | 631 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-097"></a>

## 97. People / HR / maya / 10 / Directory

- Figma frame: [`32:2251`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2251)
- Screen/state: **Directory**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-098"></a>

## 98. People / HR / maya / 10 / Inactive directory

- Figma frame: [`32:2261`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2261)
- Screen/state: **Inactive directory**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| Inactive · People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-099"></a>

## 99. People / HR / maya / 11 / Confirmation

- Figma frame: [`32:2271`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2271)
- Screen/state: **Confirmation**
- Implementation: [`EmployeeDetail → DecisionPage`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Active employee record → Deactivate profile.

### Implemented behavior

Show the selected employee name and retention explanation. Confirm marks that employee inactive; Keep active returns without changes.

### State and implementation notes

Deactivation retains attendance, requests and payroll history; inactive detail hides edit/pay/deactivation actions.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Deactivate profile | 30 px | 141 px | 32 px |
| Deactivate Maya Chen? | 49 px | 261 px | 21 px |
| This marks the employee profile as inactive. The employee record and its history will be kept. | 49 px | 320 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Keep active | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-100"></a>

## 100. People / HR / maya / 11 / Inactive

- Figma frame: [`32:2285`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2285)
- Screen/state: **Inactive**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Inactive | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0124 | 353 px | 631 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-101"></a>

## 101. People / HR / maya / 11 / Inactive directory

- Figma frame: [`32:2306`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2306)
- Screen/state: **Inactive directory**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| Inactive · Business Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-102"></a>

## 102. People / HR / nina / 01 / Record

- Figma frame: [`32:2316`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2316)
- Screen/state: **Record**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Design Associate | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0138 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-103"></a>

## 103. People / HR / nina / 01 / Confirmation

- Figma frame: [`32:2343`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2343)
- Screen/state: **Confirmation**
- Implementation: [`EmployeeDetail → DecisionPage`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Active employee record → Deactivate profile.

### Implemented behavior

Show the selected employee name and retention explanation. Confirm marks that employee inactive; Keep active returns without changes.

### State and implementation notes

Deactivation retains attendance, requests and payroll history; inactive detail hides edit/pay/deactivation actions.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Deactivate profile | 30 px | 141 px | 32 px |
| Deactivate Nina Park? | 49 px | 261 px | 21 px |
| This marks the employee profile as inactive. The employee record and its history will be kept. | 49 px | 320 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Keep active | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-104"></a>

## 104. People / HR / nina / 01 / Inactive

- Figma frame: [`32:2357`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2357)
- Screen/state: **Inactive**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Inactive | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Design Associate | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0138 | 353 px | 631 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-105"></a>

## 105. People / HR / nina / 01 / Directory

- Figma frame: [`32:2378`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2378)
- Screen/state: **Directory**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| NP | 38 px | 33 px | 15 px |
| Nina Park | 76 px | 17 px | 17 px |
| Business Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-106"></a>

## 106. People / HR / nina / 01 / Inactive directory

- Figma frame: [`32:2389`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2389)
- Screen/state: **Inactive directory**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| NP | 38 px | 33 px | 15 px |
| Nina Park | 76 px | 17 px | 17 px |
| Inactive · Business Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-107"></a>

## 107. People / HR / nina / 10 / Record

- Figma frame: [`32:2400`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2400)
- Screen/state: **Record**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Product Design | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0138 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-108"></a>

## 108. People / HR / nina / 10 / Confirmation

- Figma frame: [`32:2427`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2427)
- Screen/state: **Confirmation**
- Implementation: [`EmployeeDetail → DecisionPage`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Active employee record → Deactivate profile.

### Implemented behavior

Show the selected employee name and retention explanation. Confirm marks that employee inactive; Keep active returns without changes.

### State and implementation notes

Deactivation retains attendance, requests and payroll history; inactive detail hides edit/pay/deactivation actions.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Deactivate profile | 30 px | 141 px | 32 px |
| Deactivate Nina Park? | 49 px | 261 px | 21 px |
| This marks the employee profile as inactive. The employee record and its history will be kept. | 49 px | 320 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Keep active | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-109"></a>

## 109. People / HR / nina / 10 / Inactive

- Figma frame: [`32:2441`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2441)
- Screen/state: **Inactive**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Inactive | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Product Design | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0138 | 353 px | 631 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-110"></a>

## 110. People / HR / nina / 10 / Directory

- Figma frame: [`32:2462`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2462)
- Screen/state: **Directory**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| NP | 38 px | 33 px | 15 px |
| Nina Park | 76 px | 17 px | 17 px |
| Product Design | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-111"></a>

## 111. People / HR / nina / 10 / Inactive directory

- Figma frame: [`32:2473`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2473)
- Screen/state: **Inactive directory**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| NP | 38 px | 33 px | 15 px |
| Nina Park | 76 px | 17 px | 17 px |
| Inactive · Product Design | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-112"></a>

## 112. People / HR / nina / 11 / Confirmation

- Figma frame: [`32:2484`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2484)
- Screen/state: **Confirmation**
- Implementation: [`EmployeeDetail → DecisionPage`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Active employee record → Deactivate profile.

### Implemented behavior

Show the selected employee name and retention explanation. Confirm marks that employee inactive; Keep active returns without changes.

### State and implementation notes

Deactivation retains attendance, requests and payroll history; inactive detail hides edit/pay/deactivation actions.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Deactivate profile | 30 px | 141 px | 32 px |
| Deactivate Nina Park? | 49 px | 261 px | 21 px |
| This marks the employee profile as inactive. The employee record and its history will be kept. | 49 px | 320 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Keep active | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-113"></a>

## 113. People / HR / nina / 11 / Inactive

- Figma frame: [`32:2498`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2498)
- Screen/state: **Inactive**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Inactive | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0138 | 353 px | 631 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-114"></a>

## 114. People / HR / nina / 11 / Inactive directory

- Figma frame: [`32:2519`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2519)
- Screen/state: **Inactive directory**
- Implementation: [`DirectoryBody`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR workspace → Employees.

### Implemented behavior

List employees, department and inactive status; open the selected record or Add employee.

### State and implementation notes

Initial/added/updated/inactive variants are derived from the employee collection, not separate hardcoded routes.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| MC | 38 px | 33 px | 15 px |
| Maya Chen | 76 px | 17 px | 17 px |
| People Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| ‹ HR overview | 60 px | 15 px | 16 px |
| Employees | 30 px | 141 px | 32 px |
| + Add employee | 171 px | 15 px | 16 px |
| Employee directory | 30 px | 301 px | 19 px |
| NP | 38 px | 33 px | 15 px |
| Nina Park | 76 px | 17 px | 17 px |
| Inactive · Business Operations | 76 px | 46 px | 14 px |
| › | 306 px | 22 px | 26 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-115"></a>

## 115. People / HR / Edit mobile / maya00

- Figma frame: [`32:2729`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2729)
- Screen/state: **maya00**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Maya Chen | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| maya@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 081 555 0175 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| People Coordinator | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| People Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-116"></a>

## 116. People / HR / Updated mobile / maya00

- Figma frame: [`32:2762`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2762)
- Screen/state: **maya00**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| People Coordinator | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| People Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0175 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-117"></a>

## 117. People / HR / Edit mobile / maya01

- Figma frame: [`32:2789`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2789)
- Screen/state: **maya01**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Maya Chen | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| maya@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 081 555 0175 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| People Coordinator | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Business Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-118"></a>

## 118. People / HR / Updated mobile / maya01

- Figma frame: [`32:2822`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2822)
- Screen/state: **maya01**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| People Coordinator | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0175 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-119"></a>

## 119. People / HR / Edit mobile / maya10

- Figma frame: [`32:2849`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2849)
- Screen/state: **maya10**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Maya Chen | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| maya@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 081 555 0175 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Team Lead | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| People Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-120"></a>

## 120. People / HR / Updated mobile / maya10

- Figma frame: [`32:2882`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2882)
- Screen/state: **maya10**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| People Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0175 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-121"></a>

## 121. People / HR / Edit mobile / maya11

- Figma frame: [`32:2909`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2909)
- Screen/state: **maya11**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Maya Chen | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| maya@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 081 555 0175 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Team Lead | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Business Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-122"></a>

## 122. People / HR / Updated mobile / maya11

- Figma frame: [`32:2942`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2942)
- Screen/state: **maya11**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-001 | 50 px | 234 px | 13 px |
| Maya Chen | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| maya@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 081 555 0175 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-123"></a>

## 123. People / HR / Edit mobile / nina00

- Figma frame: [`32:2969`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-2969)
- Screen/state: **nina00**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0160 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Design Associate | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Product Design | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-124"></a>

## 124. People / HR / Updated mobile / nina00

- Figma frame: [`32:3002`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-3002)
- Screen/state: **nina00**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Design Associate | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Product Design | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0160 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-125"></a>

## 125. People / HR / Edit mobile / nina01

- Figma frame: [`32:3029`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-3029)
- Screen/state: **nina01**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0160 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Design Associate | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Business Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-126"></a>

## 126. People / HR / Updated mobile / nina01

- Figma frame: [`32:3062`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-3062)
- Screen/state: **nina01**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Design Associate | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0160 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-127"></a>

## 127. People / HR / Edit mobile / nina10

- Figma frame: [`32:3089`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-3089)
- Screen/state: **nina10**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0160 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Team Lead | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Product Design | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-128"></a>

## 128. People / HR / Updated mobile / nina10

- Figma frame: [`32:3122`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-3122)
- Screen/state: **nina10**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Product Design | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0160 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-129"></a>

## 129. People / HR / Edit mobile / nina11

- Figma frame: [`32:3149`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-3149)
- Screen/state: **nina11**
- Implementation: [`EmployeeForm`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → Add employee, or employee record → Edit employee.

### Implemented behavior

Validate name/email and required position/department; save a new or existing record. Mobile is optional but validated when supplied. Cancel discards unsaved edits.

### State and implementation notes

00/01/10/11 encode independent position/department choices. Full forms and mobile edits reuse the same controller-backed screen.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 60 px | 15 px | 16 px |
| Edit employee | 30 px | 141 px | 32 px |
| Full name | — | — | 13 px |
| Nina Park | 15 px | 39 px | 15 px |
| Work email | — | — | 13 px |
| nina@dailyhr.example | 15 px | 39 px | 15 px |
| Mobile number | — | — | 13 px |
| 082 555 0160 | 15 px | 39 px | 15 px |
| Position | — | — | 13 px |
| Team Lead | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Department | — | — | 13 px |
| Business Operations | 15 px | 39 px | 15 px |
| ⌄ | 316 px | 34 px | 20 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-130"></a>

## 130. People / HR / Updated mobile / nina11

- Figma frame: [`32:3182`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-3182)
- Screen/state: **nina11**
- Implementation: [`EmployeeDetail`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Employees → selected employee.

### Implemented behavior

Show identity, employment and contacts. Active records expose pay settings, edit and deactivate. Inactive records retain their history without those actions.

### State and implementation notes

Updated/mobile/selection variants use saved Employee values; no hardcoded record copies are maintained.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Employees | 60 px | 15 px | 16 px |
| Employee record | 30 px | 141 px | 32 px |
| DH-002 | 50 px | 234 px | 13 px |
| Nina Park | 50 px | 261 px | 29 px |
| Active | 50 px | 301 px | 14 px |
| Employment | 60 px | 371 px | 19 px |
| Position | 48 px | 430 px | 14 px |
| Team Lead | 353 px | 430 px | 14 px |
| Department | 48 px | 467 px | 14 px |
| Business Operations | 353 px | 467 px | 14 px |
| Contact details | 60 px | 537 px | 19 px |
| Work email | 48 px | 594 px | 14 px |
| nina@dailyhr.example | 353 px | 594 px | 14 px |
| Mobile | 48 px | 631 px | 14 px |
| 082 555 0160 | 353 px | 631 px | 14 px |
| Edit employee | 171 px | 15 px | 16 px |
| Deactivate profile | 171 px | 15 px | 16 px |
| Pay settings | 73.5 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-131"></a>

## 131. People / Employee / Edit saved contact

- Figma frame: [`32:3249`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=32-3249)
- Screen/state: **Edit saved contact**
- Implementation: [`EmployeeForm(contactOnly: true)`](../lib/src/people.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Profile → Edit contact details.

### Implemented behavior

Edit mobile and personal email; Save changes validates and persists only the signed-in employee; Cancel returns without mutation.

### State and implementation notes

Entered and preserved-input states use controllers owned by the form.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Profile | 60 px | 15 px | 16 px |
| Edit contact details | 30 px | 141 px | 32 px |
| Update how HR can reach you. | 30 px | 195 px | 16 px |
| Mobile number | — | — | 13 px |
| 089 555 0126 | 15 px | 39 px | 15 px |
| Personal email | — | — | 13 px |
| maya.c@example.com | 15 px | 39 px | 15 px |
| Save changes | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-132"></a>

## 132. Attendance / Ready

- Figma frame: [`37:476`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-476)
- Screen/state: **Ready**
- Implementation: [`AttendanceBody / ShiftSummary`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance tab.

### Implemented behavior

Ready displays current time; checked-in displays the check-in time; complete displays total duration. Actions change with shift state.

### State and implementation notes

Ready/working/complete share the same store as the dashboard and calendar.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Home | 64 px | 15 px | 16 px |
| My attendance | 30 px | 130 px | 32 px |
| Thursday, 19 November 2026 | 30 px | 181 px | 15 px |
| Ready to check in | 51 px | 263 px | 17 px |
| 08:55 | 50 px | 301 px | 46 px |
| Current time · Bangkok | 52 px | 378 px | 14 px |
| Daily record | 60 px | 466 px | 19 px |
| Check-in | 91 px | 526 px | 12 px |
| — | 91 px | 556 px | 20 px |
| Check-out | 202 px | 526 px | 12 px |
| — | 202 px | 556 px | 20 px |
| Working hours | 313 px | 526 px | 12 px |
| — | 313 px | 556 px | 20 px |
| Check in | 171 px | 15 px | 16 px |
| Attendance calendar › | 171 px | 15 px | 16 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-133"></a>

## 133. Attendance / Working

- Figma frame: [`37:506`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-506)
- Screen/state: **Working**
- Implementation: [`AttendanceBody / ShiftSummary`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance tab.

### Implemented behavior

Ready displays current time; checked-in displays the check-in time; complete displays total duration. Actions change with shift state.

### State and implementation notes

Ready/working/complete share the same store as the dashboard and calendar.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Home | 64 px | 15 px | 16 px |
| My attendance | 30 px | 130 px | 32 px |
| Thursday, 19 November 2026 | 30 px | 181 px | 15 px |
| Checked in | 51 px | 263 px | 17 px |
| 08:55 | 50 px | 301 px | 46 px |
| Check-in time · Bangkok | 52 px | 378 px | 14 px |
| Daily record | 60 px | 466 px | 19 px |
| Check-in | 91 px | 526 px | 12 px |
| 08:55 | 91 px | 556 px | 20 px |
| Check-out | 202 px | 526 px | 12 px |
| — | 202 px | 556 px | 20 px |
| Working hours | 313 px | 526 px | 12 px |
| In progress | 313 px | 556 px | 20 px |
| Check out | 171 px | 15 px | 16 px |
| Attendance calendar › | 171 px | 15 px | 16 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-134"></a>

## 134. Attendance / Complete

- Figma frame: [`37:536`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-536)
- Screen/state: **Complete**
- Implementation: [`AttendanceBody / ShiftSummary`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance tab.

### Implemented behavior

Ready displays current time; checked-in displays the check-in time; complete displays total duration. Actions change with shift state.

### State and implementation notes

Ready/working/complete share the same store as the dashboard and calendar.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Home | 64 px | 15 px | 16 px |
| My attendance | 30 px | 130 px | 32 px |
| Thursday, 19 November 2026 | 30 px | 181 px | 15 px |
| Shift complete | 51 px | 263 px | 17 px |
| 8h 15m | 50 px | 301 px | 46 px |
| Total working time | 52 px | 378 px | 14 px |
| Daily record | 60 px | 466 px | 19 px |
| Check-in | 91 px | 526 px | 12 px |
| 08:55 | 91 px | 556 px | 20 px |
| Check-out | 202 px | 526 px | 12 px |
| 17:10 | 202 px | 556 px | 20 px |
| Working hours | 313 px | 526 px | 12 px |
| 8h 15m | 313 px | 556 px | 20 px |
| Attendance calendar › | 171 px | 15 px | 16 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-135"></a>

## 135. Attendance / Location

- Figma frame: [`37:563`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-563)
- Screen/state: **Location**
- Implementation: [`LocationPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Check in.

### Implemented behavior

Show location confirmation; skipping presents the unavailable state; retry returns to location confirmation; check-in creates the shared shift.

### State and implementation notes

Location is explicitly simulated in this local demo; device GPS permission/capture is not implemented.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Check-in location | 30 px | 130 px | 32 px |
| Bangkok office | 80 px | 261 px | 24 px |
| Record your current location with today’s check-in. | 50 px | 311 px | 16 px |
| Use location and check in | 171 px | 15 px | 16 px |
| Skip location access | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-136"></a>

## 136. Attendance / Location unavailable

- Figma frame: [`37:577`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-577)
- Screen/state: **Location unavailable**
- Implementation: [`LocationPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Check in.

### Implemented behavior

Show location confirmation; skipping presents the unavailable state; retry returns to location confirmation; check-in creates the shared shift.

### State and implementation notes

Location is explicitly simulated in this local demo; device GPS permission/capture is not implemented.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Location unavailable | 30 px | 130 px | 32 px |
| Location access is needed for GPS check-in. Allow access and try again. | 30 px | 220 px | 17 px |
| Try again | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-137"></a>

## 137. Attendance / Confirm checkout

- Figma frame: [`37:586`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-586)
- Screen/state: **Confirm checkout**
- Implementation: [`AttendanceBody → DecisionPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Working shift → Check out.

### Implemented behavior

Show shift start/current time and elapsed hours; Confirm check-out closes the shift; Keep working leaves it open.

### State and implementation notes

The displayed time comes from the injected Bangkok clock; test fixtures control the source-frame date/time.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Check out? | 30 px | 130 px | 32 px |
| Thursday, 19 November 2026 | 30 px | 184 px | 16 px |
| Your shift today | 50 px | 266 px | 16 px |
| 08:55 – 17:10 | 50 px | 300 px | 30 px |
| Working time: 8h 15m | 50 px | 357 px | 16 px |
| Confirm check-out | 171 px | 15 px | 16 px |
| Keep working | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-138"></a>

## 138. Attendance / Calendar Ready 17

- Figma frame: [`37:641`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-641)
- Screen/state: **Calendar Ready 17**
- Implementation: [`CalendarBody / MonthGrid`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Attendance calendar, or Calendar tab.

### Implemented behavior

Navigate a Monday-first month grid, select a date and display that day’s check-in, checkout and hours.

### State and implementation notes

Ready/working/complete variants are derived from the selected employee’s Shift records. Historical prototype dates are fixture values, not fabricated live records.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| November 2026 | 18 px | 16 px | 18 px |
| M | 33 px | 55 px | 12 px |
| T | 79 px | 55 px | 12 px |
| W | 125 px | 55 px | 12 px |
| T | 171 px | 55 px | 12 px |
| F | 217 px | 55 px | 12 px |
| S | 263 px | 55 px | 12 px |
| S | 309 px | 55 px | 12 px |
| 1 | 309 px | 82 px | 14 px |
| 2 | 33 px | 115 px | 14 px |
| 3 | 79 px | 115 px | 14 px |
| 4 | 125 px | 115 px | 14 px |
| 5 | 171 px | 115 px | 14 px |
| 6 | 217 px | 115 px | 14 px |
| 7 | 263 px | 115 px | 14 px |
| 8 | 309 px | 115 px | 14 px |
| 9 | 33 px | 148 px | 14 px |
| 10 | 79 px | 148 px | 14 px |
| 11 | 125 px | 148 px | 14 px |
| 12 | 171 px | 148 px | 14 px |
| 13 | 217 px | 148 px | 14 px |
| 14 | 263 px | 148 px | 14 px |
| 15 | 309 px | 148 px | 14 px |
| 16 | 33 px | 181 px | 14 px |
| 17 | 79 px | 181 px | 14 px |
| 18 | 125 px | 181 px | 14 px |
| 19 | 171 px | 181 px | 14 px |
| 20 | 217 px | 181 px | 14 px |
| 21 | 263 px | 181 px | 14 px |
| 22 | 309 px | 181 px | 14 px |
| 23 | 33 px | 214 px | 14 px |
| 24 | 79 px | 214 px | 14 px |
| 25 | 125 px | 214 px | 14 px |
| 26 | 171 px | 214 px | 14 px |
| 27 | 217 px | 214 px | 14 px |
| 28 | 263 px | 214 px | 14 px |
| 29 | 309 px | 214 px | 14 px |
| 30 | 33 px | 247 px | 14 px |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Attendance history | 30 px | 130 px | 32 px |
| 17 | 23 px | 5 px | 14 px |
| 18 | 23 px | 5 px | 14 px |
| 19 | 23 px | 5 px | 14 px |
| Tuesday, 17 November | 30 px | 551 px | 23 px |
| Late | 30 px | 594 px | 16 px |
| Check-in | 91 px | 660 px | 12 px |
| 09:12 | 91 px | 690 px | 20 px |
| Check-out | 202 px | 660 px | 12 px |
| 17:12 | 202 px | 690 px | 20 px |
| Working hours | 313 px | 660 px | 12 px |
| 8h 00m | 313 px | 690 px | 20 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-139"></a>

## 139. Attendance / Calendar Ready 18

- Figma frame: [`37:703`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-703)
- Screen/state: **Calendar Ready 18**
- Implementation: [`CalendarBody / MonthGrid`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Attendance calendar, or Calendar tab.

### Implemented behavior

Navigate a Monday-first month grid, select a date and display that day’s check-in, checkout and hours.

### State and implementation notes

Ready/working/complete variants are derived from the selected employee’s Shift records. Historical prototype dates are fixture values, not fabricated live records.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| November 2026 | 18 px | 16 px | 18 px |
| M | 33 px | 55 px | 12 px |
| T | 79 px | 55 px | 12 px |
| W | 125 px | 55 px | 12 px |
| T | 171 px | 55 px | 12 px |
| F | 217 px | 55 px | 12 px |
| S | 263 px | 55 px | 12 px |
| S | 309 px | 55 px | 12 px |
| 1 | 309 px | 82 px | 14 px |
| 2 | 33 px | 115 px | 14 px |
| 3 | 79 px | 115 px | 14 px |
| 4 | 125 px | 115 px | 14 px |
| 5 | 171 px | 115 px | 14 px |
| 6 | 217 px | 115 px | 14 px |
| 7 | 263 px | 115 px | 14 px |
| 8 | 309 px | 115 px | 14 px |
| 9 | 33 px | 148 px | 14 px |
| 10 | 79 px | 148 px | 14 px |
| 11 | 125 px | 148 px | 14 px |
| 12 | 171 px | 148 px | 14 px |
| 13 | 217 px | 148 px | 14 px |
| 14 | 263 px | 148 px | 14 px |
| 15 | 309 px | 148 px | 14 px |
| 16 | 33 px | 181 px | 14 px |
| 17 | 79 px | 181 px | 14 px |
| 18 | 125 px | 181 px | 14 px |
| 19 | 171 px | 181 px | 14 px |
| 20 | 217 px | 181 px | 14 px |
| 21 | 263 px | 181 px | 14 px |
| 22 | 309 px | 181 px | 14 px |
| 23 | 33 px | 214 px | 14 px |
| 24 | 79 px | 214 px | 14 px |
| 25 | 125 px | 214 px | 14 px |
| 26 | 171 px | 214 px | 14 px |
| 27 | 217 px | 214 px | 14 px |
| 28 | 263 px | 214 px | 14 px |
| 29 | 309 px | 214 px | 14 px |
| 30 | 33 px | 247 px | 14 px |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Attendance history | 30 px | 130 px | 32 px |
| 17 | 23 px | 5 px | 14 px |
| 18 | 23 px | 5 px | 14 px |
| 19 | 23 px | 5 px | 14 px |
| Wednesday, 18 November | 30 px | 551 px | 23 px |
| Present | 30 px | 594 px | 16 px |
| Check-in | 91 px | 660 px | 12 px |
| 08:58 | 91 px | 690 px | 20 px |
| Check-out | 202 px | 660 px | 12 px |
| 17:03 | 202 px | 690 px | 20 px |
| Working hours | 313 px | 660 px | 12 px |
| 8h 05m | 313 px | 690 px | 20 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-140"></a>

## 140. Attendance / Calendar Ready 19

- Figma frame: [`37:765`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-765)
- Screen/state: **Calendar Ready 19**
- Implementation: [`CalendarBody / MonthGrid`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Attendance calendar, or Calendar tab.

### Implemented behavior

Navigate a Monday-first month grid, select a date and display that day’s check-in, checkout and hours.

### State and implementation notes

Ready/working/complete variants are derived from the selected employee’s Shift records. Historical prototype dates are fixture values, not fabricated live records.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| November 2026 | 18 px | 16 px | 18 px |
| M | 33 px | 55 px | 12 px |
| T | 79 px | 55 px | 12 px |
| W | 125 px | 55 px | 12 px |
| T | 171 px | 55 px | 12 px |
| F | 217 px | 55 px | 12 px |
| S | 263 px | 55 px | 12 px |
| S | 309 px | 55 px | 12 px |
| 1 | 309 px | 82 px | 14 px |
| 2 | 33 px | 115 px | 14 px |
| 3 | 79 px | 115 px | 14 px |
| 4 | 125 px | 115 px | 14 px |
| 5 | 171 px | 115 px | 14 px |
| 6 | 217 px | 115 px | 14 px |
| 7 | 263 px | 115 px | 14 px |
| 8 | 309 px | 115 px | 14 px |
| 9 | 33 px | 148 px | 14 px |
| 10 | 79 px | 148 px | 14 px |
| 11 | 125 px | 148 px | 14 px |
| 12 | 171 px | 148 px | 14 px |
| 13 | 217 px | 148 px | 14 px |
| 14 | 263 px | 148 px | 14 px |
| 15 | 309 px | 148 px | 14 px |
| 16 | 33 px | 181 px | 14 px |
| 17 | 79 px | 181 px | 14 px |
| 18 | 125 px | 181 px | 14 px |
| 19 | 171 px | 181 px | 14 px |
| 20 | 217 px | 181 px | 14 px |
| 21 | 263 px | 181 px | 14 px |
| 22 | 309 px | 181 px | 14 px |
| 23 | 33 px | 214 px | 14 px |
| 24 | 79 px | 214 px | 14 px |
| 25 | 125 px | 214 px | 14 px |
| 26 | 171 px | 214 px | 14 px |
| 27 | 217 px | 214 px | 14 px |
| 28 | 263 px | 214 px | 14 px |
| 29 | 309 px | 214 px | 14 px |
| 30 | 33 px | 247 px | 14 px |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Attendance history | 30 px | 130 px | 32 px |
| 17 | 23 px | 5 px | 14 px |
| 18 | 23 px | 5 px | 14 px |
| 19 | 23 px | 5 px | 14 px |
| Thursday, 19 November | 30 px | 551 px | 23 px |
| No check-in | 30 px | 594 px | 16 px |
| Check-in | 91 px | 660 px | 12 px |
| — | 91 px | 690 px | 20 px |
| Check-out | 202 px | 660 px | 12 px |
| — | 202 px | 690 px | 20 px |
| Working hours | 313 px | 660 px | 12 px |
| — | 313 px | 690 px | 20 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-141"></a>

## 141. Attendance / Calendar Working 17

- Figma frame: [`37:827`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-827)
- Screen/state: **Calendar Working 17**
- Implementation: [`CalendarBody / MonthGrid`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Attendance calendar, or Calendar tab.

### Implemented behavior

Navigate a Monday-first month grid, select a date and display that day’s check-in, checkout and hours.

### State and implementation notes

Ready/working/complete variants are derived from the selected employee’s Shift records. Historical prototype dates are fixture values, not fabricated live records.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| November 2026 | 18 px | 16 px | 18 px |
| M | 33 px | 55 px | 12 px |
| T | 79 px | 55 px | 12 px |
| W | 125 px | 55 px | 12 px |
| T | 171 px | 55 px | 12 px |
| F | 217 px | 55 px | 12 px |
| S | 263 px | 55 px | 12 px |
| S | 309 px | 55 px | 12 px |
| 1 | 309 px | 82 px | 14 px |
| 2 | 33 px | 115 px | 14 px |
| 3 | 79 px | 115 px | 14 px |
| 4 | 125 px | 115 px | 14 px |
| 5 | 171 px | 115 px | 14 px |
| 6 | 217 px | 115 px | 14 px |
| 7 | 263 px | 115 px | 14 px |
| 8 | 309 px | 115 px | 14 px |
| 9 | 33 px | 148 px | 14 px |
| 10 | 79 px | 148 px | 14 px |
| 11 | 125 px | 148 px | 14 px |
| 12 | 171 px | 148 px | 14 px |
| 13 | 217 px | 148 px | 14 px |
| 14 | 263 px | 148 px | 14 px |
| 15 | 309 px | 148 px | 14 px |
| 16 | 33 px | 181 px | 14 px |
| 17 | 79 px | 181 px | 14 px |
| 18 | 125 px | 181 px | 14 px |
| 19 | 171 px | 181 px | 14 px |
| 20 | 217 px | 181 px | 14 px |
| 21 | 263 px | 181 px | 14 px |
| 22 | 309 px | 181 px | 14 px |
| 23 | 33 px | 214 px | 14 px |
| 24 | 79 px | 214 px | 14 px |
| 25 | 125 px | 214 px | 14 px |
| 26 | 171 px | 214 px | 14 px |
| 27 | 217 px | 214 px | 14 px |
| 28 | 263 px | 214 px | 14 px |
| 29 | 309 px | 214 px | 14 px |
| 30 | 33 px | 247 px | 14 px |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Attendance history | 30 px | 130 px | 32 px |
| 17 | 23 px | 5 px | 14 px |
| 18 | 23 px | 5 px | 14 px |
| 19 | 23 px | 5 px | 14 px |
| Tuesday, 17 November | 30 px | 551 px | 23 px |
| Late | 30 px | 594 px | 16 px |
| Check-in | 91 px | 660 px | 12 px |
| 09:12 | 91 px | 690 px | 20 px |
| Check-out | 202 px | 660 px | 12 px |
| 17:12 | 202 px | 690 px | 20 px |
| Working hours | 313 px | 660 px | 12 px |
| 8h 00m | 313 px | 690 px | 20 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-142"></a>

## 142. Attendance / Calendar Working 18

- Figma frame: [`37:889`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-889)
- Screen/state: **Calendar Working 18**
- Implementation: [`CalendarBody / MonthGrid`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Attendance calendar, or Calendar tab.

### Implemented behavior

Navigate a Monday-first month grid, select a date and display that day’s check-in, checkout and hours.

### State and implementation notes

Ready/working/complete variants are derived from the selected employee’s Shift records. Historical prototype dates are fixture values, not fabricated live records.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| November 2026 | 18 px | 16 px | 18 px |
| M | 33 px | 55 px | 12 px |
| T | 79 px | 55 px | 12 px |
| W | 125 px | 55 px | 12 px |
| T | 171 px | 55 px | 12 px |
| F | 217 px | 55 px | 12 px |
| S | 263 px | 55 px | 12 px |
| S | 309 px | 55 px | 12 px |
| 1 | 309 px | 82 px | 14 px |
| 2 | 33 px | 115 px | 14 px |
| 3 | 79 px | 115 px | 14 px |
| 4 | 125 px | 115 px | 14 px |
| 5 | 171 px | 115 px | 14 px |
| 6 | 217 px | 115 px | 14 px |
| 7 | 263 px | 115 px | 14 px |
| 8 | 309 px | 115 px | 14 px |
| 9 | 33 px | 148 px | 14 px |
| 10 | 79 px | 148 px | 14 px |
| 11 | 125 px | 148 px | 14 px |
| 12 | 171 px | 148 px | 14 px |
| 13 | 217 px | 148 px | 14 px |
| 14 | 263 px | 148 px | 14 px |
| 15 | 309 px | 148 px | 14 px |
| 16 | 33 px | 181 px | 14 px |
| 17 | 79 px | 181 px | 14 px |
| 18 | 125 px | 181 px | 14 px |
| 19 | 171 px | 181 px | 14 px |
| 20 | 217 px | 181 px | 14 px |
| 21 | 263 px | 181 px | 14 px |
| 22 | 309 px | 181 px | 14 px |
| 23 | 33 px | 214 px | 14 px |
| 24 | 79 px | 214 px | 14 px |
| 25 | 125 px | 214 px | 14 px |
| 26 | 171 px | 214 px | 14 px |
| 27 | 217 px | 214 px | 14 px |
| 28 | 263 px | 214 px | 14 px |
| 29 | 309 px | 214 px | 14 px |
| 30 | 33 px | 247 px | 14 px |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Attendance history | 30 px | 130 px | 32 px |
| 17 | 23 px | 5 px | 14 px |
| 18 | 23 px | 5 px | 14 px |
| 19 | 23 px | 5 px | 14 px |
| Wednesday, 18 November | 30 px | 551 px | 23 px |
| Present | 30 px | 594 px | 16 px |
| Check-in | 91 px | 660 px | 12 px |
| 08:58 | 91 px | 690 px | 20 px |
| Check-out | 202 px | 660 px | 12 px |
| 17:03 | 202 px | 690 px | 20 px |
| Working hours | 313 px | 660 px | 12 px |
| 8h 05m | 313 px | 690 px | 20 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-143"></a>

## 143. Attendance / Calendar Working 19

- Figma frame: [`37:951`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-951)
- Screen/state: **Calendar Working 19**
- Implementation: [`CalendarBody / MonthGrid`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Attendance calendar, or Calendar tab.

### Implemented behavior

Navigate a Monday-first month grid, select a date and display that day’s check-in, checkout and hours.

### State and implementation notes

Ready/working/complete variants are derived from the selected employee’s Shift records. Historical prototype dates are fixture values, not fabricated live records.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| November 2026 | 18 px | 16 px | 18 px |
| M | 33 px | 55 px | 12 px |
| T | 79 px | 55 px | 12 px |
| W | 125 px | 55 px | 12 px |
| T | 171 px | 55 px | 12 px |
| F | 217 px | 55 px | 12 px |
| S | 263 px | 55 px | 12 px |
| S | 309 px | 55 px | 12 px |
| 1 | 309 px | 82 px | 14 px |
| 2 | 33 px | 115 px | 14 px |
| 3 | 79 px | 115 px | 14 px |
| 4 | 125 px | 115 px | 14 px |
| 5 | 171 px | 115 px | 14 px |
| 6 | 217 px | 115 px | 14 px |
| 7 | 263 px | 115 px | 14 px |
| 8 | 309 px | 115 px | 14 px |
| 9 | 33 px | 148 px | 14 px |
| 10 | 79 px | 148 px | 14 px |
| 11 | 125 px | 148 px | 14 px |
| 12 | 171 px | 148 px | 14 px |
| 13 | 217 px | 148 px | 14 px |
| 14 | 263 px | 148 px | 14 px |
| 15 | 309 px | 148 px | 14 px |
| 16 | 33 px | 181 px | 14 px |
| 17 | 79 px | 181 px | 14 px |
| 18 | 125 px | 181 px | 14 px |
| 19 | 171 px | 181 px | 14 px |
| 20 | 217 px | 181 px | 14 px |
| 21 | 263 px | 181 px | 14 px |
| 22 | 309 px | 181 px | 14 px |
| 23 | 33 px | 214 px | 14 px |
| 24 | 79 px | 214 px | 14 px |
| 25 | 125 px | 214 px | 14 px |
| 26 | 171 px | 214 px | 14 px |
| 27 | 217 px | 214 px | 14 px |
| 28 | 263 px | 214 px | 14 px |
| 29 | 309 px | 214 px | 14 px |
| 30 | 33 px | 247 px | 14 px |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Attendance history | 30 px | 130 px | 32 px |
| 17 | 23 px | 5 px | 14 px |
| 18 | 23 px | 5 px | 14 px |
| 19 | 23 px | 5 px | 14 px |
| Thursday, 19 November | 30 px | 551 px | 23 px |
| Checked in | 30 px | 594 px | 16 px |
| Check-in | 91 px | 660 px | 12 px |
| 08:55 | 91 px | 690 px | 20 px |
| Check-out | 202 px | 660 px | 12 px |
| — | 202 px | 690 px | 20 px |
| Working hours | 313 px | 660 px | 12 px |
| In progress | 313 px | 690 px | 20 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-144"></a>

## 144. Attendance / Calendar Complete 17

- Figma frame: [`37:1013`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1013)
- Screen/state: **Calendar Complete 17**
- Implementation: [`CalendarBody / MonthGrid`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Attendance calendar, or Calendar tab.

### Implemented behavior

Navigate a Monday-first month grid, select a date and display that day’s check-in, checkout and hours.

### State and implementation notes

Ready/working/complete variants are derived from the selected employee’s Shift records. Historical prototype dates are fixture values, not fabricated live records.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| November 2026 | 18 px | 16 px | 18 px |
| M | 33 px | 55 px | 12 px |
| T | 79 px | 55 px | 12 px |
| W | 125 px | 55 px | 12 px |
| T | 171 px | 55 px | 12 px |
| F | 217 px | 55 px | 12 px |
| S | 263 px | 55 px | 12 px |
| S | 309 px | 55 px | 12 px |
| 1 | 309 px | 82 px | 14 px |
| 2 | 33 px | 115 px | 14 px |
| 3 | 79 px | 115 px | 14 px |
| 4 | 125 px | 115 px | 14 px |
| 5 | 171 px | 115 px | 14 px |
| 6 | 217 px | 115 px | 14 px |
| 7 | 263 px | 115 px | 14 px |
| 8 | 309 px | 115 px | 14 px |
| 9 | 33 px | 148 px | 14 px |
| 10 | 79 px | 148 px | 14 px |
| 11 | 125 px | 148 px | 14 px |
| 12 | 171 px | 148 px | 14 px |
| 13 | 217 px | 148 px | 14 px |
| 14 | 263 px | 148 px | 14 px |
| 15 | 309 px | 148 px | 14 px |
| 16 | 33 px | 181 px | 14 px |
| 17 | 79 px | 181 px | 14 px |
| 18 | 125 px | 181 px | 14 px |
| 19 | 171 px | 181 px | 14 px |
| 20 | 217 px | 181 px | 14 px |
| 21 | 263 px | 181 px | 14 px |
| 22 | 309 px | 181 px | 14 px |
| 23 | 33 px | 214 px | 14 px |
| 24 | 79 px | 214 px | 14 px |
| 25 | 125 px | 214 px | 14 px |
| 26 | 171 px | 214 px | 14 px |
| 27 | 217 px | 214 px | 14 px |
| 28 | 263 px | 214 px | 14 px |
| 29 | 309 px | 214 px | 14 px |
| 30 | 33 px | 247 px | 14 px |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Attendance history | 30 px | 130 px | 32 px |
| 17 | 23 px | 5 px | 14 px |
| 18 | 23 px | 5 px | 14 px |
| 19 | 23 px | 5 px | 14 px |
| Tuesday, 17 November | 30 px | 551 px | 23 px |
| Late | 30 px | 594 px | 16 px |
| Check-in | 91 px | 660 px | 12 px |
| 09:12 | 91 px | 690 px | 20 px |
| Check-out | 202 px | 660 px | 12 px |
| 17:12 | 202 px | 690 px | 20 px |
| Working hours | 313 px | 660 px | 12 px |
| 8h 00m | 313 px | 690 px | 20 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-145"></a>

## 145. Attendance / Calendar Complete 18

- Figma frame: [`37:1075`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1075)
- Screen/state: **Calendar Complete 18**
- Implementation: [`CalendarBody / MonthGrid`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Attendance calendar, or Calendar tab.

### Implemented behavior

Navigate a Monday-first month grid, select a date and display that day’s check-in, checkout and hours.

### State and implementation notes

Ready/working/complete variants are derived from the selected employee’s Shift records. Historical prototype dates are fixture values, not fabricated live records.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| November 2026 | 18 px | 16 px | 18 px |
| M | 33 px | 55 px | 12 px |
| T | 79 px | 55 px | 12 px |
| W | 125 px | 55 px | 12 px |
| T | 171 px | 55 px | 12 px |
| F | 217 px | 55 px | 12 px |
| S | 263 px | 55 px | 12 px |
| S | 309 px | 55 px | 12 px |
| 1 | 309 px | 82 px | 14 px |
| 2 | 33 px | 115 px | 14 px |
| 3 | 79 px | 115 px | 14 px |
| 4 | 125 px | 115 px | 14 px |
| 5 | 171 px | 115 px | 14 px |
| 6 | 217 px | 115 px | 14 px |
| 7 | 263 px | 115 px | 14 px |
| 8 | 309 px | 115 px | 14 px |
| 9 | 33 px | 148 px | 14 px |
| 10 | 79 px | 148 px | 14 px |
| 11 | 125 px | 148 px | 14 px |
| 12 | 171 px | 148 px | 14 px |
| 13 | 217 px | 148 px | 14 px |
| 14 | 263 px | 148 px | 14 px |
| 15 | 309 px | 148 px | 14 px |
| 16 | 33 px | 181 px | 14 px |
| 17 | 79 px | 181 px | 14 px |
| 18 | 125 px | 181 px | 14 px |
| 19 | 171 px | 181 px | 14 px |
| 20 | 217 px | 181 px | 14 px |
| 21 | 263 px | 181 px | 14 px |
| 22 | 309 px | 181 px | 14 px |
| 23 | 33 px | 214 px | 14 px |
| 24 | 79 px | 214 px | 14 px |
| 25 | 125 px | 214 px | 14 px |
| 26 | 171 px | 214 px | 14 px |
| 27 | 217 px | 214 px | 14 px |
| 28 | 263 px | 214 px | 14 px |
| 29 | 309 px | 214 px | 14 px |
| 30 | 33 px | 247 px | 14 px |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Attendance history | 30 px | 130 px | 32 px |
| 17 | 23 px | 5 px | 14 px |
| 18 | 23 px | 5 px | 14 px |
| 19 | 23 px | 5 px | 14 px |
| Wednesday, 18 November | 30 px | 551 px | 23 px |
| Present | 30 px | 594 px | 16 px |
| Check-in | 91 px | 660 px | 12 px |
| 08:58 | 91 px | 690 px | 20 px |
| Check-out | 202 px | 660 px | 12 px |
| 17:03 | 202 px | 690 px | 20 px |
| Working hours | 313 px | 660 px | 12 px |
| 8h 05m | 313 px | 690 px | 20 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-146"></a>

## 146. Attendance / Calendar Complete 19

- Figma frame: [`37:1137`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1137)
- Screen/state: **Calendar Complete 19**
- Implementation: [`CalendarBody / MonthGrid`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee Attendance → Attendance calendar, or Calendar tab.

### Implemented behavior

Navigate a Monday-first month grid, select a date and display that day’s check-in, checkout and hours.

### State and implementation notes

Ready/working/complete variants are derived from the selected employee’s Shift records. Historical prototype dates are fixture values, not fabricated live records.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| November 2026 | 18 px | 16 px | 18 px |
| M | 33 px | 55 px | 12 px |
| T | 79 px | 55 px | 12 px |
| W | 125 px | 55 px | 12 px |
| T | 171 px | 55 px | 12 px |
| F | 217 px | 55 px | 12 px |
| S | 263 px | 55 px | 12 px |
| S | 309 px | 55 px | 12 px |
| 1 | 309 px | 82 px | 14 px |
| 2 | 33 px | 115 px | 14 px |
| 3 | 79 px | 115 px | 14 px |
| 4 | 125 px | 115 px | 14 px |
| 5 | 171 px | 115 px | 14 px |
| 6 | 217 px | 115 px | 14 px |
| 7 | 263 px | 115 px | 14 px |
| 8 | 309 px | 115 px | 14 px |
| 9 | 33 px | 148 px | 14 px |
| 10 | 79 px | 148 px | 14 px |
| 11 | 125 px | 148 px | 14 px |
| 12 | 171 px | 148 px | 14 px |
| 13 | 217 px | 148 px | 14 px |
| 14 | 263 px | 148 px | 14 px |
| 15 | 309 px | 148 px | 14 px |
| 16 | 33 px | 181 px | 14 px |
| 17 | 79 px | 181 px | 14 px |
| 18 | 125 px | 181 px | 14 px |
| 19 | 171 px | 181 px | 14 px |
| 20 | 217 px | 181 px | 14 px |
| 21 | 263 px | 181 px | 14 px |
| 22 | 309 px | 181 px | 14 px |
| 23 | 33 px | 214 px | 14 px |
| 24 | 79 px | 214 px | 14 px |
| 25 | 125 px | 214 px | 14 px |
| 26 | 171 px | 214 px | 14 px |
| 27 | 217 px | 214 px | 14 px |
| 28 | 263 px | 214 px | 14 px |
| 29 | 309 px | 214 px | 14 px |
| 30 | 33 px | 247 px | 14 px |
| ‹ Attendance | 64 px | 15 px | 16 px |
| Attendance history | 30 px | 130 px | 32 px |
| 17 | 23 px | 5 px | 14 px |
| 18 | 23 px | 5 px | 14 px |
| 19 | 23 px | 5 px | 14 px |
| Thursday, 19 November | 30 px | 551 px | 23 px |
| Present | 30 px | 594 px | 16 px |
| Check-in | 91 px | 660 px | 12 px |
| 08:55 | 91 px | 690 px | 20 px |
| Check-out | 202 px | 660 px | 12 px |
| 17:10 | 202 px | 690 px | 20 px |
| Working hours | 313 px | 660 px | 12 px |
| 8h 15m | 313 px | 690 px | 20 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-147"></a>

## 147. Attendance / Daily review 17

- Figma frame: [`37:1199`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1199)
- Screen/state: **Daily review 17**
- Implementation: [`AttendanceReviewBody / HrPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Attendance → select workday → employee row.

### Implemented behavior

Switch workdays and open the selected employee’s attendance record; display times in Bangkok local time.

### State and implementation notes

The review derives Present/Late/Absent/On leave/Checked in from shifts and approved leave. Per-frame attendance history is not seeded automatically.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 64 px | 15 px | 16 px |
| Daily attendance | 30 px | 130 px | 32 px |
| November 2026 | 30 px | 190 px | 17 px |
| Tue 17 | 54 px | 15 px | 16 px |
| Wed 18 | 54 px | 15 px | 16 px |
| Thu 19 | 54 px | 15 px | 16 px |
| Attendance by employee | 60 px | 339 px | 19 px |
| Maya Chen | 18 px | 14 px | 17 px |
| Late › | 324 px | 16 px | 13 px |
| In | 18 px | 59 px | 12 px |
| 09:12 | 18 px | 80 px | 16 px |
| Out | 123 px | 59 px | 12 px |
| 17:12 | 123 px | 80 px | 16 px |
| Hours | 228 px | 59 px | 12 px |
| 8h 00m | 228 px | 80 px | 16 px |
| Nina Park | 18 px | 14 px | 17 px |
| Present › | 324 px | 16 px | 13 px |
| In | 18 px | 59 px | 12 px |
| 08:50 | 18 px | 80 px | 16 px |
| Out | 123 px | 59 px | 12 px |
| 16:50 | 123 px | 80 px | 16 px |
| Hours | 228 px | 59 px | 12 px |
| 8h 00m | 228 px | 80 px | 16 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-148"></a>

## 148. Attendance / Review Maya 17

- Figma frame: [`37:1235`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1235)
- Screen/state: **Review Maya 17**
- Implementation: [`AttendanceReviewBody / HrPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Attendance → select workday → employee row.

### Implemented behavior

Switch workdays and open the selected employee’s attendance record; display times in Bangkok local time.

### State and implementation notes

The review derives Present/Late/Absent/On leave/Checked in from shifts and approved leave. Per-frame attendance history is not seeded automatically.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Daily review | 64 px | 15 px | 16 px |
| Attendance record | 30 px | 130 px | 32 px |
| Maya Chen | 49 px | 241 px | 27 px |
| DH-001 · People Operations | 49 px | 285 px | 15 px |
| Late | 49 px | 321 px | 14 px |
| Tuesday, 17 November | 30 px | 404 px | 19 px |
| Check-in | 91 px | 476 px | 12 px |
| 09:12 | 91 px | 506 px | 20 px |
| Check-out | 202 px | 476 px | 12 px |
| 17:12 | 202 px | 506 px | 20 px |
| Working hours | 313 px | 476 px | 12 px |
| 8h 00m | 313 px | 506 px | 20 px |
| Times shown in Bangkok local time. | 30 px | 588 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-149"></a>

## 149. Attendance / Review Nina 17

- Figma frame: [`37:1253`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1253)
- Screen/state: **Review Nina 17**
- Implementation: [`AttendanceReviewBody / HrPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Attendance → select workday → employee row.

### Implemented behavior

Switch workdays and open the selected employee’s attendance record; display times in Bangkok local time.

### State and implementation notes

The review derives Present/Late/Absent/On leave/Checked in from shifts and approved leave. Per-frame attendance history is not seeded automatically.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Daily review | 64 px | 15 px | 16 px |
| Attendance record | 30 px | 130 px | 32 px |
| Nina Park | 49 px | 241 px | 27 px |
| DH-002 · Product Design | 49 px | 285 px | 15 px |
| Present | 49 px | 321 px | 14 px |
| Tuesday, 17 November | 30 px | 404 px | 19 px |
| Check-in | 91 px | 476 px | 12 px |
| 08:50 | 91 px | 506 px | 20 px |
| Check-out | 202 px | 476 px | 12 px |
| 16:50 | 202 px | 506 px | 20 px |
| Working hours | 313 px | 476 px | 12 px |
| 8h 00m | 313 px | 506 px | 20 px |
| Times shown in Bangkok local time. | 30 px | 588 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-150"></a>

## 150. Attendance / Daily review 18

- Figma frame: [`37:1271`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1271)
- Screen/state: **Daily review 18**
- Implementation: [`AttendanceReviewBody / HrPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Attendance → select workday → employee row.

### Implemented behavior

Switch workdays and open the selected employee’s attendance record; display times in Bangkok local time.

### State and implementation notes

The review derives Present/Late/Absent/On leave/Checked in from shifts and approved leave. Per-frame attendance history is not seeded automatically.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 64 px | 15 px | 16 px |
| Daily attendance | 30 px | 130 px | 32 px |
| November 2026 | 30 px | 190 px | 17 px |
| Tue 17 | 54 px | 15 px | 16 px |
| Wed 18 | 54 px | 15 px | 16 px |
| Thu 19 | 54 px | 15 px | 16 px |
| Attendance by employee | 60 px | 339 px | 19 px |
| Maya Chen | 18 px | 14 px | 17 px |
| Present › | 324 px | 16 px | 13 px |
| In | 18 px | 59 px | 12 px |
| 08:58 | 18 px | 80 px | 16 px |
| Out | 123 px | 59 px | 12 px |
| 17:03 | 123 px | 80 px | 16 px |
| Hours | 228 px | 59 px | 12 px |
| 8h 05m | 228 px | 80 px | 16 px |
| Nina Park | 18 px | 14 px | 17 px |
| On leave › | 324 px | 16 px | 13 px |
| In | 18 px | 59 px | 12 px |
| — | 18 px | 80 px | 16 px |
| Out | 123 px | 59 px | 12 px |
| — | 123 px | 80 px | 16 px |
| Hours | 228 px | 59 px | 12 px |
| — | 228 px | 80 px | 16 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-151"></a>

## 151. Attendance / Review Maya 18

- Figma frame: [`37:1307`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1307)
- Screen/state: **Review Maya 18**
- Implementation: [`AttendanceReviewBody / HrPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Attendance → select workday → employee row.

### Implemented behavior

Switch workdays and open the selected employee’s attendance record; display times in Bangkok local time.

### State and implementation notes

The review derives Present/Late/Absent/On leave/Checked in from shifts and approved leave. Per-frame attendance history is not seeded automatically.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Daily review | 64 px | 15 px | 16 px |
| Attendance record | 30 px | 130 px | 32 px |
| Maya Chen | 49 px | 241 px | 27 px |
| DH-001 · People Operations | 49 px | 285 px | 15 px |
| Present | 49 px | 321 px | 14 px |
| Wednesday, 18 November | 30 px | 404 px | 19 px |
| Check-in | 91 px | 476 px | 12 px |
| 08:58 | 91 px | 506 px | 20 px |
| Check-out | 202 px | 476 px | 12 px |
| 17:03 | 202 px | 506 px | 20 px |
| Working hours | 313 px | 476 px | 12 px |
| 8h 05m | 313 px | 506 px | 20 px |
| Times shown in Bangkok local time. | 30 px | 588 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-152"></a>

## 152. Attendance / Review Nina 18

- Figma frame: [`37:1325`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1325)
- Screen/state: **Review Nina 18**
- Implementation: [`AttendanceReviewBody / HrPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Attendance → select workday → employee row.

### Implemented behavior

Switch workdays and open the selected employee’s attendance record; display times in Bangkok local time.

### State and implementation notes

The review derives Present/Late/Absent/On leave/Checked in from shifts and approved leave. Per-frame attendance history is not seeded automatically.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Daily review | 64 px | 15 px | 16 px |
| Attendance record | 30 px | 130 px | 32 px |
| Nina Park | 49 px | 241 px | 27 px |
| DH-002 · Product Design | 49 px | 285 px | 15 px |
| On leave | 49 px | 321 px | 14 px |
| Wednesday, 18 November | 30 px | 404 px | 19 px |
| Check-in | 91 px | 476 px | 12 px |
| — | 91 px | 506 px | 20 px |
| Check-out | 202 px | 476 px | 12 px |
| — | 202 px | 506 px | 20 px |
| Working hours | 313 px | 476 px | 12 px |
| — | 313 px | 506 px | 20 px |
| Times shown in Bangkok local time. | 30 px | 588 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-153"></a>

## 153. Attendance / Daily review 19

- Figma frame: [`37:1343`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1343)
- Screen/state: **Daily review 19**
- Implementation: [`AttendanceReviewBody / HrPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Attendance → select workday → employee row.

### Implemented behavior

Switch workdays and open the selected employee’s attendance record; display times in Bangkok local time.

### State and implementation notes

The review derives Present/Late/Absent/On leave/Checked in from shifts and approved leave. Per-frame attendance history is not seeded automatically.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 64 px | 15 px | 16 px |
| Daily attendance | 30 px | 130 px | 32 px |
| November 2026 | 30 px | 190 px | 17 px |
| Tue 17 | 54 px | 15 px | 16 px |
| Wed 18 | 54 px | 15 px | 16 px |
| Thu 19 | 54 px | 15 px | 16 px |
| Attendance by employee | 60 px | 339 px | 19 px |
| Maya Chen | 18 px | 14 px | 17 px |
| Present › | 324 px | 16 px | 13 px |
| In | 18 px | 59 px | 12 px |
| 08:55 | 18 px | 80 px | 16 px |
| Out | 123 px | 59 px | 12 px |
| 17:10 | 123 px | 80 px | 16 px |
| Hours | 228 px | 59 px | 12 px |
| 8h 15m | 228 px | 80 px | 16 px |
| Nina Park | 18 px | 14 px | 17 px |
| Checked in › | 324 px | 16 px | 13 px |
| In | 18 px | 59 px | 12 px |
| 09:02 | 18 px | 80 px | 16 px |
| Out | 123 px | 59 px | 12 px |
| — | 123 px | 80 px | 16 px |
| Hours | 228 px | 59 px | 12 px |
| In progress | 228 px | 80 px | 16 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-154"></a>

## 154. Attendance / Review Maya 19

- Figma frame: [`37:1379`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1379)
- Screen/state: **Review Maya 19**
- Implementation: [`AttendanceReviewBody / HrPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Attendance → select workday → employee row.

### Implemented behavior

Switch workdays and open the selected employee’s attendance record; display times in Bangkok local time.

### State and implementation notes

The review derives Present/Late/Absent/On leave/Checked in from shifts and approved leave. Per-frame attendance history is not seeded automatically.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Daily review | 64 px | 15 px | 16 px |
| Attendance record | 30 px | 130 px | 32 px |
| Maya Chen | 49 px | 241 px | 27 px |
| DH-001 · People Operations | 49 px | 285 px | 15 px |
| Present | 49 px | 321 px | 14 px |
| Thursday, 19 November | 30 px | 404 px | 19 px |
| Check-in | 91 px | 476 px | 12 px |
| 08:55 | 91 px | 506 px | 20 px |
| Check-out | 202 px | 476 px | 12 px |
| 17:10 | 202 px | 506 px | 20 px |
| Working hours | 313 px | 476 px | 12 px |
| 8h 15m | 313 px | 506 px | 20 px |
| Times shown in Bangkok local time. | 30 px | 588 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-155"></a>

## 155. Attendance / Review Nina 19

- Figma frame: [`37:1397`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=37-1397)
- Screen/state: **Review Nina 19**
- Implementation: [`AttendanceReviewBody / HrPage`](../lib/src/attendance.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Attendance → select workday → employee row.

### Implemented behavior

Switch workdays and open the selected employee’s attendance record; display times in Bangkok local time.

### State and implementation notes

The review derives Present/Late/Absent/On leave/Checked in from shifts and approved leave. Per-frame attendance history is not seeded automatically.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Daily review | 64 px | 15 px | 16 px |
| Attendance record | 30 px | 130 px | 32 px |
| Nina Park | 49 px | 241 px | 27 px |
| DH-002 · Product Design | 49 px | 285 px | 15 px |
| Checked in | 49 px | 321 px | 14 px |
| Thursday, 19 November | 30 px | 404 px | 19 px |
| Check-in | 91 px | 476 px | 12 px |
| 09:02 | 91 px | 506 px | 20 px |
| Check-out | 202 px | 476 px | 12 px |
| — | 202 px | 506 px | 20 px |
| Working hours | 313 px | 476 px | 12 px |
| In progress | 313 px | 506 px | 20 px |
| Times shown in Bangkok local time. | 30 px | 588 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-156"></a>

## 156. Leave / My leave

- Figma frame: [`44:1595`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1595)
- Screen/state: **My leave**
- Implementation: [`RequestsPage`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Dashboard → My leave/My overtime or HR review.

### Implemented behavior

Show balances/approved hours and request statuses; open a selected request or create a new one; bottom navigation returns to workspace tabs.

### State and implementation notes

Demo annual/sick balances are 10/6 days before approved usage; pending/cancelled requests do not consume balance.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Home | 70 px | 15 px | 16 px |
| My leave | 30 px | 137 px | 32 px |
| Available balances | 30 px | 214 px | 18 px |
| Annual leave | 15 px | 18 px | 15 px |
| 10 days | 15 px | 52 px | 28 px |
| Sick leave | 15 px | 18 px | 15 px |
| 6 days | 15 px | 52 px | 28 px |
| Request leave | 171 px | 15 px | 16 px |
| My requests | 30 px | 489 px | 21 px |
| Annual leave · 23 Nov | 62 px | 13 px | 16 px |
| Pending | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-157"></a>

## 157. Leave / Leave review

- Figma frame: [`44:1621`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1621)
- Screen/state: **Leave review**
- Implementation: [`RequestsPage`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Dashboard → My leave/My overtime or HR review.

### Implemented behavior

Show balances/approved hours and request statuses; open a selected request or create a new one; bottom navigation returns to workspace tabs.

### State and implementation notes

Demo annual/sick balances are 10/6 days before approved usage; pending/cancelled requests do not consume balance.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 70 px | 15 px | 16 px |
| Leave requests | 30 px | 137 px | 32 px |
| Maya Chen | 30 px | 227 px | 24 px |
| People Operations | 30 px | 265 px | 15 px |
| Annual leave · 23 Nov | 62 px | 13 px | 16 px |
| Pending | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-158"></a>

## 158. Leave / New request

- Figma frame: [`44:1638`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1638)
- Screen/state: **New request**
- Implementation: [`RequestForm`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee My leave/My overtime → Request.

### Implemented behavior

Retain selected fields, validate completeness and positive overtime duration, calculate hours and submit a pending request.

### State and implementation notes

Each entered/validation state shares one stateful form; successful submission opens that exact request detail.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My leave | 70 px | 15 px | 16 px |
| Request leave | 30 px | 137 px | 32 px |
| Leave type | 62 px | 13 px | 16 px |
| Annual leave | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Start and end date | 62 px | 13 px | 16 px |
| Choose dates | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Reason | 62 px | 13 px | 16 px |
| Add a reason | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Submit request | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-159"></a>

## 159. Leave / Ready to submit

- Figma frame: [`44:1664`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1664)
- Screen/state: **Ready to submit**
- Implementation: [`RequestForm`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee My leave/My overtime → Request.

### Implemented behavior

Retain selected fields, validate completeness and positive overtime duration, calculate hours and submit a pending request.

### State and implementation notes

Each entered/validation state shares one stateful form; successful submission opens that exact request detail.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My leave | 70 px | 15 px | 16 px |
| Request leave | 30 px | 137 px | 32 px |
| Leave type | 62 px | 13 px | 16 px |
| Annual leave | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Start and end date | 62 px | 13 px | 16 px |
| 26 Nov 2026 · 1 working day | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Reason | 62 px | 13 px | 16 px |
| Personal appointment | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Submit request | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-160"></a>

## 160. Leave / Missing details

- Figma frame: [`44:1690`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1690)
- Screen/state: **Missing details**
- Implementation: [`RequestForm`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee My leave/My overtime → Request.

### Implemented behavior

Retain selected fields, validate completeness and positive overtime duration, calculate hours and submit a pending request.

### State and implementation notes

Each entered/validation state shares one stateful form; successful submission opens that exact request detail.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My leave | 70 px | 15 px | 16 px |
| Request leave | 30 px | 137 px | 32 px |
| Leave type | 62 px | 13 px | 16 px |
| Annual leave | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Start and end date | 62 px | 13 px | 16 px |
| Choose dates | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Reason | 62 px | 13 px | 16 px |
| Add a reason | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Choose dates and enter a reason to submit. | 30 px | 513 px | 15 px |
| Submit request | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-161"></a>

## 161. Leave / Leave type

- Figma frame: [`44:1717`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1717)
- Screen/state: **Leave type**
- Implementation: [`RequestForm → ChoicePage / ReasonEditor`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request form → relevant selection tile.

### Implemented behavior

Choose leave type, overtime date/time or a demo overtime reason without losing other entered fields.

### State and implementation notes

Leave dates use the native date-range picker and leave reason uses a text editor. Overtime choices use dedicated Figma-style pages.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 70 px | 15 px | 16 px |
| Choose leave type | 30 px | 137 px | 32 px |
| Annual leave | 171 px | 15 px | 16 px |
| Sick leave | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-162"></a>

## 162. Leave / First Employee Pending

- Figma frame: [`44:1728`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1728)
- Screen/state: **First Employee Pending**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My leave | 70 px | 15 px | 16 px |
| Request details | 30 px | 137 px | 32 px |
| Annual leave | 49 px | 234 px | 25 px |
| Monday, 23 November 2026 | 49 px | 282 px | 16 px |
| Pending | 49 px | 319 px | 15 px |
| Employee | 49 px | 416 px | 14 px |
| Maya Chen | 351 px | 416 px | 15 px |
| Duration | 49 px | 459 px | 14 px |
| 1 working day | 351 px | 459 px | 15 px |
| Reason | 49 px | 505 px | 14 px |
| Family visit | 351 px | 505 px | 15 px |
| Cancel request | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-163"></a>

## 163. Leave / First Employee Resolved

- Figma frame: [`44:1747`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1747)
- Screen/state: **First Employee Resolved**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My leave | 70 px | 15 px | 16 px |
| Request details | 30 px | 137 px | 32 px |
| Annual leave | 49 px | 234 px | 25 px |
| Monday, 23 November 2026 | 49 px | 282 px | 16 px |
| Pending | 49 px | 319 px | 15 px |
| Employee | 49 px | 416 px | 14 px |
| Maya Chen | 351 px | 416 px | 15 px |
| Duration | 49 px | 459 px | 14 px |
| 1 working day | 351 px | 459 px | 15 px |
| Reason | 49 px | 505 px | 14 px |
| Family visit | 351 px | 505 px | 15 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-164"></a>

## 164. Leave / First HR Pending

- Figma frame: [`44:1763`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1763)
- Screen/state: **First HR Pending**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Requests | 70 px | 15 px | 16 px |
| Request details | 30 px | 137 px | 32 px |
| Annual leave | 49 px | 234 px | 25 px |
| Monday, 23 November 2026 | 49 px | 282 px | 16 px |
| Pending | 49 px | 319 px | 15 px |
| Employee | 49 px | 416 px | 14 px |
| Maya Chen | 351 px | 416 px | 15 px |
| Duration | 49 px | 459 px | 14 px |
| 1 working day | 351 px | 459 px | 15 px |
| Reason | 49 px | 505 px | 14 px |
| Family visit | 351 px | 505 px | 15 px |
| Approve request | 171 px | 15 px | 16 px |
| Reject request | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-165"></a>

## 165. Leave / First HR Resolved

- Figma frame: [`44:1785`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1785)
- Screen/state: **First HR Resolved**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Requests | 70 px | 15 px | 16 px |
| Request details | 30 px | 137 px | 32 px |
| Annual leave | 49 px | 234 px | 25 px |
| Monday, 23 November 2026 | 49 px | 282 px | 16 px |
| Pending | 49 px | 319 px | 15 px |
| Employee | 49 px | 416 px | 14 px |
| Maya Chen | 351 px | 416 px | 15 px |
| Duration | 49 px | 459 px | 14 px |
| 1 working day | 351 px | 459 px | 15 px |
| Reason | 49 px | 505 px | 14 px |
| Family visit | 351 px | 505 px | 15 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-166"></a>

## 166. Leave / First Confirm Cancel

- Figma frame: [`44:1801`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1801)
- Screen/state: **First Confirm Cancel**
- Implementation: [`RequestDetail.decision → DecisionPage`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pending request → Cancel, Approve or Reject.

### Implemented behavior

Confirm a decision for the selected request, or go back without changing it; update its list/detail and notification.

### State and implementation notes

Employee cancellation is restricted to their own pending leave; HR approval/rejection is role checked.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 70 px | 15 px | 16 px |
| Cancel request? | 30 px | 137 px | 32 px |
| Maya Chen | 49 px | 258 px | 21 px |
| Annual leave | 49 px | 297 px | 17 px |
| 23 November · 1 working day | 49 px | 330 px | 15 px |
| The request will be marked as cancelled. | 49 px | 371 px | 15 px |
| Confirm cancellation | 171 px | 15 px | 16 px |
| Go back | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-167"></a>

## 167. Leave / First Confirm Approve

- Figma frame: [`44:1817`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1817)
- Screen/state: **First Confirm Approve**
- Implementation: [`RequestDetail.decision → DecisionPage`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pending request → Cancel, Approve or Reject.

### Implemented behavior

Confirm a decision for the selected request, or go back without changing it; update its list/detail and notification.

### State and implementation notes

Employee cancellation is restricted to their own pending leave; HR approval/rejection is role checked.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 70 px | 15 px | 16 px |
| Approve request? | 30 px | 137 px | 32 px |
| Maya Chen | 49 px | 258 px | 21 px |
| Annual leave | 49 px | 297 px | 17 px |
| 23 November · 1 working day | 49 px | 330 px | 15 px |
| Approval deducts one day from the selected leave balance. | 49 px | 371 px | 15 px |
| Confirm approval | 171 px | 15 px | 16 px |
| Go back | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-168"></a>

## 168. Leave / First Confirm Reject

- Figma frame: [`44:1833`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1833)
- Screen/state: **First Confirm Reject**
- Implementation: [`RequestDetail.decision → DecisionPage`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pending request → Cancel, Approve or Reject.

### Implemented behavior

Confirm a decision for the selected request, or go back without changing it; update its list/detail and notification.

### State and implementation notes

Employee cancellation is restricted to their own pending leave; HR approval/rejection is role checked.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 70 px | 15 px | 16 px |
| Reject request? | 30 px | 137 px | 32 px |
| Maya Chen | 49 px | 258 px | 21 px |
| Annual leave | 49 px | 297 px | 17 px |
| 23 November · 1 working day | 49 px | 330 px | 15 px |
| The employee will see this request as rejected. | 49 px | 371 px | 15 px |
| Confirm rejection | 171 px | 15 px | 16 px |
| Go back | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-169"></a>

## 169. Leave / Second Employee Pending

- Figma frame: [`44:1849`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1849)
- Screen/state: **Second Employee Pending**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My leave | 70 px | 15 px | 16 px |
| Request details | 30 px | 137 px | 32 px |
| Annual leave | 49 px | 234 px | 25 px |
| Thursday, 26 November 2026 | 49 px | 282 px | 16 px |
| Pending | 49 px | 319 px | 15 px |
| Employee | 49 px | 416 px | 14 px |
| Maya Chen | 351 px | 416 px | 15 px |
| Duration | 49 px | 459 px | 14 px |
| 1 working day | 351 px | 459 px | 15 px |
| Reason | 49 px | 505 px | 14 px |
| Personal appointment | 351 px | 505 px | 15 px |
| Cancel request | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-170"></a>

## 170. Leave / Second Employee Resolved

- Figma frame: [`44:1868`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1868)
- Screen/state: **Second Employee Resolved**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My leave | 70 px | 15 px | 16 px |
| Request details | 30 px | 137 px | 32 px |
| Annual leave | 49 px | 234 px | 25 px |
| Thursday, 26 November 2026 | 49 px | 282 px | 16 px |
| Pending | 49 px | 319 px | 15 px |
| Employee | 49 px | 416 px | 14 px |
| Maya Chen | 351 px | 416 px | 15 px |
| Duration | 49 px | 459 px | 14 px |
| 1 working day | 351 px | 459 px | 15 px |
| Reason | 49 px | 505 px | 14 px |
| Personal appointment | 351 px | 505 px | 15 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-171"></a>

## 171. Leave / Second HR Pending

- Figma frame: [`44:1884`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1884)
- Screen/state: **Second HR Pending**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Requests | 70 px | 15 px | 16 px |
| Request details | 30 px | 137 px | 32 px |
| Annual leave | 49 px | 234 px | 25 px |
| Thursday, 26 November 2026 | 49 px | 282 px | 16 px |
| Pending | 49 px | 319 px | 15 px |
| Employee | 49 px | 416 px | 14 px |
| Maya Chen | 351 px | 416 px | 15 px |
| Duration | 49 px | 459 px | 14 px |
| 1 working day | 351 px | 459 px | 15 px |
| Reason | 49 px | 505 px | 14 px |
| Personal appointment | 351 px | 505 px | 15 px |
| Approve request | 171 px | 15 px | 16 px |
| Reject request | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-172"></a>

## 172. Leave / Second HR Resolved

- Figma frame: [`44:1906`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1906)
- Screen/state: **Second HR Resolved**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — “Resolved” frame still shows “Pending”; no Approved, Rejected or Cancelled outcome is designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Requests | 70 px | 15 px | 16 px |
| Request details | 30 px | 137 px | 32 px |
| Annual leave | 49 px | 234 px | 25 px |
| Thursday, 26 November 2026 | 49 px | 282 px | 16 px |
| Pending | 49 px | 319 px | 15 px |
| Employee | 49 px | 416 px | 14 px |
| Maya Chen | 351 px | 416 px | 15 px |
| Duration | 49 px | 459 px | 14 px |
| 1 working day | 351 px | 459 px | 15 px |
| Reason | 49 px | 505 px | 14 px |
| Personal appointment | 351 px | 505 px | 15 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-173"></a>

## 173. Leave / Second Confirm Cancel

- Figma frame: [`44:1922`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1922)
- Screen/state: **Second Confirm Cancel**
- Implementation: [`RequestDetail.decision → DecisionPage`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pending request → Cancel, Approve or Reject.

### Implemented behavior

Confirm a decision for the selected request, or go back without changing it; update its list/detail and notification.

### State and implementation notes

Employee cancellation is restricted to their own pending leave; HR approval/rejection is role checked.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 70 px | 15 px | 16 px |
| Cancel request? | 30 px | 137 px | 32 px |
| Maya Chen | 49 px | 258 px | 21 px |
| Annual leave | 49 px | 297 px | 17 px |
| 26 November · 1 working day | 49 px | 330 px | 15 px |
| The request will be marked as cancelled. | 49 px | 371 px | 15 px |
| Confirm cancellation | 171 px | 15 px | 16 px |
| Go back | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-174"></a>

## 174. Leave / Second Confirm Approve

- Figma frame: [`44:1938`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1938)
- Screen/state: **Second Confirm Approve**
- Implementation: [`RequestDetail.decision → DecisionPage`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pending request → Cancel, Approve or Reject.

### Implemented behavior

Confirm a decision for the selected request, or go back without changing it; update its list/detail and notification.

### State and implementation notes

Employee cancellation is restricted to their own pending leave; HR approval/rejection is role checked.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 70 px | 15 px | 16 px |
| Approve request? | 30 px | 137 px | 32 px |
| Maya Chen | 49 px | 258 px | 21 px |
| Annual leave | 49 px | 297 px | 17 px |
| 26 November · 1 working day | 49 px | 330 px | 15 px |
| Approval deducts one day from the selected leave balance. | 49 px | 371 px | 15 px |
| Confirm approval | 171 px | 15 px | 16 px |
| Go back | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-175"></a>

## 175. Leave / Second Confirm Reject

- Figma frame: [`44:1954`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1954)
- Screen/state: **Second Confirm Reject**
- Implementation: [`RequestDetail.decision → DecisionPage`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pending request → Cancel, Approve or Reject.

### Implemented behavior

Confirm a decision for the selected request, or go back without changing it; update its list/detail and notification.

### State and implementation notes

Employee cancellation is restricted to their own pending leave; HR approval/rejection is role checked.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 70 px | 15 px | 16 px |
| Reject request? | 30 px | 137 px | 32 px |
| Maya Chen | 49 px | 258 px | 21 px |
| Annual leave | 49 px | 297 px | 17 px |
| 26 November · 1 working day | 49 px | 330 px | 15 px |
| The employee will see this request as rejected. | 49 px | 371 px | 15 px |
| Confirm rejection | 171 px | 15 px | 16 px |
| Go back | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-176"></a>

## 176. Leave / Dates entered

- Figma frame: [`44:1970`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1970)
- Screen/state: **Dates entered**
- Implementation: [`RequestForm`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee My leave/My overtime → Request.

### Implemented behavior

Retain selected fields, validate completeness and positive overtime duration, calculate hours and submit a pending request.

### State and implementation notes

Each entered/validation state shares one stateful form; successful submission opens that exact request detail.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My leave | 70 px | 15 px | 16 px |
| Request leave | 30 px | 137 px | 32 px |
| Leave type | 62 px | 13 px | 16 px |
| Annual leave | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Start and end date | 62 px | 13 px | 16 px |
| 26 Nov 2026 · 1 working day | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Reason | 62 px | 13 px | 16 px |
| Add a reason | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Submit request | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-177"></a>

## 177. Leave / Reason entered

- Figma frame: [`44:1996`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-1996)
- Screen/state: **Reason entered**
- Implementation: [`RequestForm`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee My leave/My overtime → Request.

### Implemented behavior

Retain selected fields, validate completeness and positive overtime duration, calculate hours and submit a pending request.

### State and implementation notes

Each entered/validation state shares one stateful form; successful submission opens that exact request detail.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My leave | 70 px | 15 px | 16 px |
| Request leave | 30 px | 137 px | 32 px |
| Leave type | 62 px | 13 px | 16 px |
| Annual leave | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Start and end date | 62 px | 13 px | 16 px |
| Choose dates | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Reason | 62 px | 13 px | 16 px |
| Personal appointment | 62 px | 43 px | 14 px |
| › | 303 px | 24 px | 21 px |
| Submit request | 171 px | 15 px | 16 px |
| Cancel | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-178"></a>

## 178. Leave / Type for Dates entered

- Figma frame: [`44:2022`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-2022)
- Screen/state: **Type for Dates entered**
- Implementation: [`RequestForm → ChoicePage / ReasonEditor`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request form → relevant selection tile.

### Implemented behavior

Choose leave type, overtime date/time or a demo overtime reason without losing other entered fields.

### State and implementation notes

Leave dates use the native date-range picker and leave reason uses a text editor. Overtime choices use dedicated Figma-style pages.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 70 px | 15 px | 16 px |
| Choose leave type | 30 px | 137 px | 32 px |
| Annual leave | 171 px | 15 px | 16 px |
| Sick leave | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-179"></a>

## 179. Leave / Type for Reason entered

- Figma frame: [`44:2033`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-2033)
- Screen/state: **Type for Reason entered**
- Implementation: [`RequestForm → ChoicePage / ReasonEditor`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request form → relevant selection tile.

### Implemented behavior

Choose leave type, overtime date/time or a demo overtime reason without losing other entered fields.

### State and implementation notes

Leave dates use the native date-range picker and leave reason uses a text editor. Overtime choices use dedicated Figma-style pages.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 70 px | 15 px | 16 px |
| Choose leave type | 30 px | 137 px | 32 px |
| Annual leave | 171 px | 15 px | 16 px |
| Sick leave | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-180"></a>

## 180. Leave / Type for Ready to submit

- Figma frame: [`44:2044`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=44-2044)
- Screen/state: **Type for Ready to submit**
- Implementation: [`RequestForm → ChoicePage / ReasonEditor`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request form → relevant selection tile.

### Implemented behavior

Choose leave type, overtime date/time or a demo overtime reason without losing other entered fields.

### State and implementation notes

Leave dates use the native date-range picker and leave reason uses a text editor. Overtime choices use dedicated Figma-style pages.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 70 px | 15 px | 16 px |
| Choose leave type | 30 px | 137 px | 32 px |
| Annual leave | 171 px | 15 px | 16 px |
| Sick leave | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-181"></a>

## 181. HR Admin / Overview menu

- Figma frame: [`66:1923`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=66-1923)
- Screen/state: **Overview menu**
- Implementation: [`Workspace.dashboard`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Sign in to the corresponding employee/HR workspace.

### Implemented behavior

Show current attendance and request/payroll navigation; the HR menu opens employee, attendance, review and payroll workflows.

### State and implementation notes

Counts and summaries are derived from the shared demo records; the overview menu uses Flutter popup-menu behavior.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| DailyHR | 80 px | 65 px | 24 px |
| HR overview | 30 px | 118 px | 32 px |
| Needs a decision | 30 px | 373 px | 22 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |
| Daily attendance | 48 px | 215 px | 15 px |
| 1 | 48 px | 246 px | 28 px |
| Checked in | 48 px | 293 px | 13 px |
| 0 | 154 px | 246 px | 28 px |
| On leave | 154 px | 293 px | 13 px |
| 2 | 260 px | 246 px | 28 px |
| Employees | 260 px | 293 px | 13 px |
| Leave queue | 41 px | 14 px | 14 px |
| 1 pending | 13 px | 47 px | 16 px |
| Overtime | 41 px | 14 px | 14 px |
| No pending overtime | 13 px | 47 px | 16 px |
| Quick actions | 30 px | 537 px | 20 px |
| Employees | 42 px | 18 px | 14 px |
| Attendance | 42 px | 18 px | 14 px |
| Leave requests | 42 px | 18 px | 14 px |
| Overtime | 42 px | 18 px | 14 px |
| Payroll | 42 px | 18 px | 14 px |
| Profile | 18 px | 14 px | 16 px |
| Sign out | 18 px | 14 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-182"></a>

## 182. Work / My overtime

- Figma frame: [`69:1979`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-1979)
- Screen/state: **My overtime**
- Implementation: [`RequestsPage`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete for the empty state only; no populated list is designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Dashboard → My leave/My overtime or HR review.

### Implemented behavior

Show balances/approved hours and request statuses; open a selected request or create a new one; bottom navigation returns to workspace tabs.

### State and implementation notes

Demo annual/sick balances are 10/6 days before approved usage; pending/cancelled requests do not consume balance.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Home | 68 px | 15 px | 16 px |
| My overtime | 30 px | 135 px | 30 px |
| Approved hours · November | 51 px | 241 px | 15 px |
| 0 hours | 50 px | 268 px | 36 px |
| Request overtime | 171 px | 15 px | 16 px |
| Request history | 30 px | 482 px | 21 px |
| Your submitted requests will appear here. | 30 px | 550 px | 15 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-183"></a>

## 183. Work / Overtime form

- Figma frame: [`69:2002`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2002)
- Screen/state: **Overtime form**
- Implementation: [`RequestForm`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, but duplicates the newer overtime form (84:2515) with different placeholder copy.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee My leave/My overtime → Request.

### Implemented behavior

Retain selected fields, validate completeness and positive overtime duration, calculate hours and submit a pending request.

### State and implementation notes

Each entered/validation state shares one stateful form; successful submission opens that exact request detail.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My overtime | 68 px | 15 px | 16 px |
| Request overtime | 30 px | 135 px | 30 px |
| Work date | 63 px | 12 px | 16 px |
| Choose date | 63 px | 40 px | 14 px |
| Start time | 63 px | 12 px | 16 px |
| Choose start time | 63 px | 40 px | 14 px |
| End time | 63 px | 12 px | 16 px |
| Choose end time | 63 px | 40 px | 14 px |
| Reason | 63 px | 12 px | 16 px |
| Add reason | 63 px | 40 px | 14 px |
| Calculated hours | 48 px | 557 px | 15 px |
| — | 354 px | 557 px | 15 px |
| Submit request | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-184"></a>

## 184. Work / Overtime validation

- Figma frame: [`69:2052`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2052)
- Screen/state: **Overtime validation**
- Implementation: [`RequestForm`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, but duplicates the newer overtime form (84:2515) with different placeholder copy.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee My leave/My overtime → Request.

### Implemented behavior

Retain selected fields, validate completeness and positive overtime duration, calculate hours and submit a pending request.

### State and implementation notes

Each entered/validation state shares one stateful form; successful submission opens that exact request detail.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My overtime | 68 px | 15 px | 16 px |
| Request overtime | 30 px | 135 px | 30 px |
| Work date | 63 px | 12 px | 16 px |
| Choose date | 63 px | 40 px | 14 px |
| Start time | 63 px | 12 px | 16 px |
| Choose start time | 63 px | 40 px | 14 px |
| End time | 63 px | 12 px | 16 px |
| Choose end time | 63 px | 40 px | 14 px |
| Reason | 63 px | 12 px | 16 px |
| Add reason | 63 px | 40 px | 14 px |
| Calculated hours | 48 px | 557 px | 15 px |
| — | 354 px | 557 px | 15 px |
| Complete all four fields before submitting. | 30 px | 617 px | 14 px |
| Submit request | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-185"></a>

## 185. Work / Pick Date

- Figma frame: [`69:2103`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2103)
- Screen/state: **Pick Date**
- Implementation: [`RequestForm → ChoicePage / ReasonEditor`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, though the picker offers a single option.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request form → relevant selection tile.

### Implemented behavior

Choose leave type, overtime date/time or a demo overtime reason without losing other entered fields.

### State and implementation notes

Leave dates use the native date-range picker and leave reason uses a text editor. Overtime choices use dedicated Figma-style pages.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 68 px | 15 px | 16 px |
| Choose work date | 30 px | 135 px | 30 px |
| Thu, 19 November 2026 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-186"></a>

## 186. Work / Pick Start

- Figma frame: [`69:2111`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2111)
- Screen/state: **Pick Start**
- Implementation: [`RequestForm → ChoicePage / ReasonEditor`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, though the picker offers a single option.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request form → relevant selection tile.

### Implemented behavior

Choose leave type, overtime date/time or a demo overtime reason without losing other entered fields.

### State and implementation notes

Leave dates use the native date-range picker and leave reason uses a text editor. Overtime choices use dedicated Figma-style pages.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 68 px | 15 px | 16 px |
| Choose start time | 30 px | 135 px | 30 px |
| 17:30 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-187"></a>

## 187. Work / Pick End

- Figma frame: [`69:2119`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2119)
- Screen/state: **Pick End**
- Implementation: [`RequestForm → ChoicePage / ReasonEditor`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request form → relevant selection tile.

### Implemented behavior

Choose leave type, overtime date/time or a demo overtime reason without losing other entered fields.

### State and implementation notes

Leave dates use the native date-range picker and leave reason uses a text editor. Overtime choices use dedicated Figma-style pages.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 68 px | 15 px | 16 px |
| Choose end time | 30 px | 135 px | 30 px |
| 19:30 | 171 px | 15 px | 16 px |
| 20:00 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-188"></a>

## 188. Work / Pick Reason

- Figma frame: [`69:2130`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2130)
- Screen/state: **Pick Reason**
- Implementation: [`RequestForm → ChoicePage / ReasonEditor`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request form → relevant selection tile.

### Implemented behavior

Choose leave type, overtime date/time or a demo overtime reason without losing other entered fields.

### State and implementation notes

Leave dates use the native date-range picker and leave reason uses a text editor. Overtime choices use dedicated Figma-style pages.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Request | 68 px | 15 px | 16 px |
| Choose demo reason | 30 px | 135 px | 30 px |
| Month-end reporting | 171 px | 15 px | 16 px |
| Inventory reconciliation | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-189"></a>

## 189. Work / OT review

- Figma frame: [`69:2141`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2141)
- Screen/state: **OT review**
- Implementation: [`RequestsPage`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete for the empty state only; no populated list is designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Dashboard → My leave/My overtime or HR review.

### Implemented behavior

Show balances/approved hours and request statuses; open a selected request or create a new one; bottom navigation returns to workspace tabs.

### State and implementation notes

Demo annual/sick balances are 10/6 days before approved usage; pending/cancelled requests do not consume balance.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 68 px | 15 px | 16 px |
| Overtime requests | 30 px | 135 px | 30 px |
| Review queue | 51 px | 233 px | 15 px |
| No pending overtime | 50 px | 260 px | 25 px |
| Employee requests | 30 px | 382 px | 20 px |
| No overtime requests submitted yet. | 30 px | 460 px | 16 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-190"></a>

## 190. Work / OT employee detail

- Figma frame: [`69:2161`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2161)
- Screen/state: **OT employee detail**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My overtime | 68 px | 15 px | 16 px |
| Overtime details | 30 px | 135 px | 30 px |
| Requested hours | 51 px | 218 px | 15 px |
| — | 50 px | 245 px | 36 px |
| Employee | 48 px | 368 px | 15 px |
| Maya Chen | 354 px | 368 px | 15 px |
| Work date | 48 px | 413 px | 15 px |
| 19 Nov 2026 | 354 px | 413 px | 15 px |
| Time from | 48 px | 458 px | 15 px |
| 17:30 | 354 px | 458 px | 15 px |
| Time until | 48 px | 503 px | 15 px |
| Choose end time | 354 px | 503 px | 15 px |
| Status | 48 px | 548 px | 15 px |
| No request | 354 px | 548 px | 15 px |
| Add reason | 48 px | 584 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-191"></a>

## 191. Work / OT HR detail

- Figma frame: [`69:2181`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2181)
- Screen/state: **OT HR detail**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Requests | 68 px | 15 px | 16 px |
| Review overtime | 30 px | 135 px | 30 px |
| Requested hours | 51 px | 218 px | 15 px |
| — | 50 px | 245 px | 36 px |
| Employee | 48 px | 368 px | 15 px |
| Maya Chen | 354 px | 368 px | 15 px |
| Work date | 48 px | 413 px | 15 px |
| 19 Nov 2026 | 354 px | 413 px | 15 px |
| Time from | 48 px | 458 px | 15 px |
| 17:30 | 354 px | 458 px | 15 px |
| Time until | 48 px | 503 px | 15 px |
| Choose end time | 354 px | 503 px | 15 px |
| Status | 48 px | 548 px | 15 px |
| No request | 354 px | 548 px | 15 px |
| Add reason | 48 px | 584 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-192"></a>

## 192. Work / OT HR decision

- Figma frame: [`69:2201`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2201)
- Screen/state: **OT HR decision**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Requests | 68 px | 15 px | 16 px |
| Review overtime | 30 px | 135 px | 30 px |
| Requested hours | 51 px | 218 px | 15 px |
| — | 50 px | 245 px | 36 px |
| Employee | 48 px | 368 px | 15 px |
| Maya Chen | 354 px | 368 px | 15 px |
| Work date | 48 px | 413 px | 15 px |
| 19 Nov 2026 | 354 px | 413 px | 15 px |
| Time from | 48 px | 458 px | 15 px |
| 17:30 | 354 px | 458 px | 15 px |
| Time until | 48 px | 503 px | 15 px |
| Choose end time | 354 px | 503 px | 15 px |
| Status | 48 px | 548 px | 15 px |
| No request | 354 px | 548 px | 15 px |
| Add reason | 48 px | 584 px | 14 px |
| Approve hours | 171 px | 15 px | 16 px |
| Reject request | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-193"></a>

## 193. Work / My payslips

- Figma frame: [`69:2227`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2227)
- Screen/state: **My payslips**
- Implementation: [`PayrollPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Dashboard → Payroll/My payslips.

### Implemented behavior

HR can prepare or open each employee’s month. Employees see only their published monthly history.

### State and implementation notes

Published and unpublished register rows navigate to different screens; inactive records cannot create new payroll.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Home | 68 px | 15 px | 16 px |
| My payslips | 30 px | 135 px | 30 px |
| Maya Chen · DH-001 | 30 px | 194 px | 16 px |
| Published payslips | 30 px | 261 px | 21 px |
| October 2026 | 63 px | 12 px | 16 px |
| ฿29,625 net pay | 63 px | 40 px | 14 px |
| Home | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Calendar | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-194"></a>

## 194. Work / October payslip

- Figma frame: [`69:2252`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2252)
- Screen/state: **October payslip**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Payslips | 68 px | 15 px | 16 px |
| Monthly payslip | 30 px | 135 px | 30 px |
| October 2026 · Maya Chen | 30 px | 191 px | 16 px |
| Net pay | 51 px | 253 px | 15 px |
| ฿29,625 | 50 px | 280 px | 36 px |
| Base salary | 48 px | 412 px | 15 px |
| ฿30,000 | 354 px | 412 px | 15 px |
| Approved overtime | 48 px | 459 px | 15 px |
| 1.5 hours | 354 px | 459 px | 15 px |
| Overtime pay | 48 px | 506 px | 15 px |
| ฿375 | 354 px | 506 px | 15 px |
| Deductions | 48 px | 553 px | 15 px |
| ฿750 | 354 px | 553 px | 15 px |
| Overtime rate · ฿250 per hour | 48 px | 595 px | 14 px |
| Published payslip | 30 px | 671 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-195"></a>

## 195. Work / November payslip

- Figma frame: [`69:2272`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2272)
- Screen/state: **November payslip**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Payslips | 68 px | 15 px | 16 px |
| Monthly payslip | 30 px | 135 px | 30 px |
| November 2026 · Maya Chen | 30 px | 191 px | 16 px |
| Net pay | 51 px | 253 px | 15 px |
| ฿29,250 | 50 px | 280 px | 36 px |
| Base salary | 48 px | 412 px | 15 px |
| ฿30,000 | 354 px | 412 px | 15 px |
| Approved overtime | 48 px | 459 px | 15 px |
| 0 hours | 354 px | 459 px | 15 px |
| Overtime pay | 48 px | 506 px | 15 px |
| ฿0 | 354 px | 506 px | 15 px |
| Deductions | 48 px | 553 px | 15 px |
| ฿750 | 354 px | 553 px | 15 px |
| Overtime rate · ฿250 per hour | 48 px | 595 px | 14 px |
| Published payslip | 30 px | 671 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-196"></a>

## 196. Work / Review draft

- Figma frame: [`69:2292`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2292)
- Screen/state: **Review draft**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Payroll | 68 px | 15 px | 16 px |
| Review draft | 30 px | 135 px | 30 px |
| November 2026 · Maya Chen | 30 px | 191 px | 16 px |
| Net pay | 51 px | 253 px | 15 px |
| ฿29,250 | 50 px | 280 px | 36 px |
| Base salary | 48 px | 412 px | 15 px |
| ฿30,000 | 354 px | 412 px | 15 px |
| Approved overtime | 48 px | 459 px | 15 px |
| 0 hours | 354 px | 459 px | 15 px |
| Overtime pay | 48 px | 506 px | 15 px |
| ฿0 | 354 px | 506 px | 15 px |
| Deductions | 48 px | 553 px | 15 px |
| ฿750 | 354 px | 553 px | 15 px |
| Overtime rate · ฿250 per hour | 48 px | 595 px | 14 px |
| Publish November payslip | 171 px | 15 px | 16 px |
| Edit salary details | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-197"></a>

## 197. Work / Published payroll

- Figma frame: [`69:2317`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2317)
- Screen/state: **Published payroll**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Payroll | 68 px | 15 px | 16 px |
| Monthly payslip | 30 px | 135 px | 30 px |
| November 2026 · Maya Chen | 30 px | 191 px | 16 px |
| Net pay | 51 px | 253 px | 15 px |
| ฿29,250 | 50 px | 280 px | 36 px |
| Base salary | 48 px | 412 px | 15 px |
| ฿30,000 | 354 px | 412 px | 15 px |
| Approved overtime | 48 px | 459 px | 15 px |
| 0 hours | 354 px | 459 px | 15 px |
| Overtime pay | 48 px | 506 px | 15 px |
| ฿0 | 354 px | 506 px | 15 px |
| Deductions | 48 px | 553 px | 15 px |
| ฿750 | 354 px | 553 px | 15 px |
| Overtime rate · ฿250 per hour | 48 px | 595 px | 14 px |
| Published payslip | 30 px | 671 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-198"></a>

## 198. Work / Payroll

- Figma frame: [`69:2337`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2337)
- Screen/state: **Payroll**
- Implementation: [`PayrollPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Rows are inconsistent: Maya’s row has an icon tile and chevron icon, Nina’s row has neither.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Dashboard → Payroll/My payslips.

### Implemented behavior

HR can prepare or open each employee’s month. Employees see only their published monthly history.

### State and implementation notes

Published and unpublished register rows navigate to different screens; inactive records cannot create new payroll.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 68 px | 15 px | 16 px |
| Monthly payroll | 30 px | 135 px | 30 px |
| Maya Chen · DH-001 | 63 px | 12 px | 16 px |
| Not prepared | 63 px | 40 px | 14 px |
| Overview | 47 px | 35 px | 12 px |
| Employees | 47 px | 35 px | 12 px |
| Attendance | 47 px | 35 px | 12 px |
| Profile | 47 px | 35 px | 12 px |
| November 2026 ▾ | 171 px | 15 px | 16 px |
| Nina Park · DH-002 | 17 px | 9 px | 16 px |
| Draft | 17 px | 36 px | 14 px |
| › | 308 px | 22 px | 18 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-199"></a>

## 199. Work / Prepare payroll

- Figma frame: [`69:2353`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2353)
- Screen/state: **Prepare payroll**
- Implementation: [`PreparePage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Payroll → unpublished employee/month.

### Implemented behavior

Edit salary/rate and itemized deductions, review approved entries, then calculate a draft.

### State and implementation notes

Net pay uses base + approved hours × rate − insurance − advance. Stale drafts must be recalculated before publication.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Payroll | 68 px | 15 px | 16 px |
| Prepare payslip | 30 px | 135 px | 30 px |
| Maya Chen · November 2026 | 30 px | 192 px | 16 px |
| Monthly base salary | 63 px | 12 px | 16 px |
| ฿30,000 | 63 px | 40 px | 14 px |
| Total deductions | 63 px | 12 px | 16 px |
| ฿750 | 63 px | 40 px | 14 px |
| Approved hours | 48 px | 459 px | 15 px |
| 0 hours | 354 px | 459 px | 15 px |
| Hourly rate | 48 px | 501 px | 15 px |
| ฿250 | 354 px | 501 px | 15 px |
| Overtime pay | 48 px | 544 px | 15 px |
| ฿0 | 354 px | 544 px | 15 px |
| Calculate and review | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-200"></a>

## 200. Work / Set Salary

- Figma frame: [`69:2388`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2388)
- Screen/state: **Set Salary**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Prepare | 68 px | 15 px | 16 px |
| Monthly base salary | 30 px | 135 px | 30 px |
| ฿30,000 | 171 px | 15 px | 16 px |
| ฿32,000 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-201"></a>

## 201. Work / Set Deduction

- Figma frame: [`69:2399`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=69-2399)
- Screen/state: **Set Deduction**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete** — Complete, but this is the older single “Total deductions” payroll flow; the Paydesk frames itemise insurance and advance instead. App follows Paydesk.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Prepare | 68 px | 15 px | 16 px |
| Total deductions | 30 px | 135 px | 30 px |
| ฿750 | 171 px | 15 px | 16 px |
| ฿1,000 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-202"></a>

## 202. Work / Calculation salary 0

- Figma frame: [`73:2074`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=73-2074)
- Screen/state: **Calculation salary 0**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Calculating net pay… | 201 px | 382 px | 23 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-203"></a>

## 203. Work / Calculation ded 00

- Figma frame: [`73:2076`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=73-2076)
- Screen/state: **Calculation ded 00**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Calculating net pay… | 201 px | 382 px | 23 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-204"></a>

## 204. Work / Calculation ot 00

- Figma frame: [`73:2078`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=73-2078)
- Screen/state: **Calculation ot 00**
- Implementation: [`EntriesPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Prepare/review payslip → approved hours/entries.

### Implemented behavior

List only approved overtime for the employee and pay month, or immutable snapshot entry IDs; open the selected request.

### State and implementation notes

Empty and populated states share this page; unrelated employees/months and unapproved requests are excluded.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Calculating net pay… | 201 px | 382 px | 23 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-205"></a>

## 205. Work / Calculation ded 01

- Figma frame: [`73:2080`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=73-2080)
- Screen/state: **Calculation ded 01**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Calculating net pay… | 201 px | 382 px | 23 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-206"></a>

## 206. Work / Calculation ot 01

- Figma frame: [`73:2082`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=73-2082)
- Screen/state: **Calculation ot 01**
- Implementation: [`EntriesPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Prepare/review payslip → approved hours/entries.

### Implemented behavior

List only approved overtime for the employee and pay month, or immutable snapshot entry IDs; open the selected request.

### State and implementation notes

Empty and populated states share this page; unrelated employees/months and unapproved requests are excluded.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Calculating net pay… | 201 px | 382 px | 23 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-207"></a>

## 207. Work / Calculation salary 1

- Figma frame: [`73:2084`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=73-2084)
- Screen/state: **Calculation salary 1**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Calculating net pay… | 201 px | 382 px | 23 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-208"></a>

## 208. Work / Calculation ded 10

- Figma frame: [`73:2086`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=73-2086)
- Screen/state: **Calculation ded 10**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Calculating net pay… | 201 px | 382 px | 23 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-209"></a>

## 209. Work / Calculation ot 10

- Figma frame: [`73:2088`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=73-2088)
- Screen/state: **Calculation ot 10**
- Implementation: [`EntriesPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Prepare/review payslip → approved hours/entries.

### Implemented behavior

List only approved overtime for the employee and pay month, or immutable snapshot entry IDs; open the selected request.

### State and implementation notes

Empty and populated states share this page; unrelated employees/months and unapproved requests are excluded.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Calculating net pay… | 201 px | 382 px | 23 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-210"></a>

## 210. Work / Calculation ded 11

- Figma frame: [`73:2090`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=73-2090)
- Screen/state: **Calculation ded 11**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Calculating net pay… | 201 px | 382 px | 23 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-211"></a>

## 211. Work / Calculation ot 11

- Figma frame: [`73:2092`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=73-2092)
- Screen/state: **Calculation ot 11**
- Implementation: [`EntriesPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only a “Calculating net pay…” label; no header, layout or navigation. All 10 frames are identical, so the salary/deduction/overtime combinations are not designed.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Prepare/review payslip → approved hours/entries.

### Implemented behavior

List only approved overtime for the employee and pay month, or immutable snapshot entry IDs; open the selected request.

### State and implementation notes

Empty and populated states share this page; unrelated employees/months and unapproved requests are excluded.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| Calculating net pay… | 201 px | 382 px | 23 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-212"></a>

## 212. Paydesk / Maya pay settings

- Figma frame: [`83:2123`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=83-2123)
- Screen/state: **Maya pay settings**
- Implementation: [`PaySettingsPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Active employee record → Pay settings.

### Implemented behavior

Show monthly base salary and hourly overtime rate; each opens its own amount selector.

### State and implementation notes

Settings are scoped to the selected employee and never rewrite published snapshots.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Record | 72 px | 15 px | 16 px |
| Pay settings | 30 px | 139 px | 30 px |
| Maya Chen · DH-001 | 30 px | 205 px | 16 px |
| Monthly base salary · THB | 17 px | 9 px | 16 px |
| ฿30,000 | 17 px | 36 px | 14 px |
| › | 308 px | 22 px | 18 px |
| Overtime rate · THB/hour | 17 px | 9 px | 16 px |
| ฿250 | 17 px | 36 px | 14 px |
| › | 308 px | 22 px | 18 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-213"></a>

## 213. Paydesk / Maya base

- Figma frame: [`84:2103`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2103)
- Screen/state: **Maya base**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Back | 72 px | 15 px | 16 px |
| Monthly base salary | 30 px | 139 px | 30 px |
| Maya Chen | 30 px | 203 px | 16 px |
| ฿30,000 | 171 px | 15 px | 16 px |
| ฿32,000 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-214"></a>

## 214. Paydesk / Maya rate

- Figma frame: [`84:2115`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2115)
- Screen/state: **Maya rate**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Back | 72 px | 15 px | 16 px |
| Hourly overtime rate | 30 px | 139 px | 30 px |
| Maya Chen | 30 px | 203 px | 16 px |
| ฿250 | 171 px | 15 px | 16 px |
| ฿300 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-215"></a>

## 215. Paydesk / Maya insurance

- Figma frame: [`84:2127`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2127)
- Screen/state: **Maya insurance**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Back | 72 px | 15 px | 16 px |
| Insurance deduction | 30 px | 139 px | 30 px |
| Maya Chen | 30 px | 203 px | 16 px |
| ฿500 | 171 px | 15 px | 16 px |
| ฿750 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-216"></a>

## 216. Paydesk / Maya advance

- Figma frame: [`84:2139`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2139)
- Screen/state: **Maya advance**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Back | 72 px | 15 px | 16 px |
| Salary advance | 30 px | 139 px | 30 px |
| Maya Chen | 30 px | 203 px | 16 px |
| ฿0 | 171 px | 15 px | 16 px |
| ฿250 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-217"></a>

## 217. Paydesk / Maya prepare

- Figma frame: [`84:2151`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2151)
- Screen/state: **Maya prepare**
- Implementation: [`PreparePage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

HR Payroll → unpublished employee/month.

### Implemented behavior

Edit salary/rate and itemized deductions, review approved entries, then calculate a draft.

### State and implementation notes

Net pay uses base + approved hours × rate − insurance − advance. Stale drafts must be recalculated before publication.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-218"></a>

## 218. Paydesk / Maya entries

- Figma frame: [`84:2186`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2186)
- Screen/state: **Maya entries**
- Implementation: [`EntriesPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Says approved entries are included but shows no rows and 0 hours, while the 19 and 24 November approved-entry frames exist for Maya.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Prepare/review payslip → approved hours/entries.

### Implemented behavior

List only approved overtime for the employee and pay month, or immutable snapshot entry IDs; open the selected request.

### State and implementation notes

Empty and populated states share this page; unrelated employees/months and unapproved requests are excluded.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Prepare | 72 px | 15 px | 16 px |
| Approved overtime | 30 px | 139 px | 30 px |
| Maya Chen · November 2026 | 30 px | 208 px | 16 px |
| Approved entries included in this pay period | 30 px | 260 px | 16 px |
| Total approved hours | 30 px | 545 px | 16 px |
| 0 hours | 372 px | 545 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-219"></a>

## 219. Paydesk / Maya draft

- Figma frame: [`84:2205`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2205)
- Screen/state: **Maya draft**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Payroll | 72 px | 15 px | 16 px |
| Review draft | 30 px | 139 px | 30 px |
| Maya Chen · November 2026 | 30 px | 202 px | 16 px |
| Net pay | 49 px | 267 px | 15 px |
| — | 48 px | 291 px | 33 px |
| Base salary | 48 px | 408 px | 15 px |
| ฿30,000 | 351 px | 408 px | 15 px |
| Approved hours | 48 px | 450 px | 15 px |
| 0 hours | 351 px | 450 px | 15 px |
| Overtime rate | 48 px | 492 px | 15 px |
| ฿250 | 351 px | 492 px | 15 px |
| Overtime pay | 48 px | 534 px | 15 px |
| ฿0 | 351 px | 534 px | 15 px |
| Employee insurance | 48 px | 576 px | 15 px |
| ฿750 | 351 px | 576 px | 15 px |
| Salary advance | 48 px | 618 px | 15 px |
| ฿0 | 351 px | 618 px | 15 px |
| Publish payslip | 171 px | 15 px | 16 px |
| Edit draft | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-220"></a>

## 220. Paydesk / Maya published

- Figma frame: [`84:2233`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2233)
- Screen/state: **Maya published**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Payroll | 72 px | 15 px | 16 px |
| Monthly payslip | 30 px | 139 px | 30 px |
| Maya Chen · November 2026 | 30 px | 202 px | 16 px |
| Net pay | 49 px | 267 px | 15 px |
| — | 48 px | 291 px | 33 px |
| Base salary | 48 px | 408 px | 15 px |
| ฿30,000 | 351 px | 408 px | 15 px |
| Approved hours | 48 px | 450 px | 15 px |
| 0 hours | 351 px | 450 px | 15 px |
| Overtime rate | 48 px | 492 px | 15 px |
| ฿250 | 351 px | 492 px | 15 px |
| Overtime pay | 48 px | 534 px | 15 px |
| ฿0 | 351 px | 534 px | 15 px |
| Employee insurance | 48 px | 576 px | 15 px |
| ฿750 | 351 px | 576 px | 15 px |
| Salary advance | 48 px | 618 px | 15 px |
| ฿0 | 351 px | 618 px | 15 px |
| Published | 30 px | 710 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-221"></a>

## 221. Paydesk / Maya employee

- Figma frame: [`84:2256`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2256)
- Screen/state: **Maya employee**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ My payslips | 72 px | 15 px | 16 px |
| Monthly payslip | 30 px | 139 px | 30 px |
| Maya Chen · November 2026 | 30 px | 202 px | 16 px |
| Net pay | 49 px | 267 px | 15 px |
| — | 48 px | 291 px | 33 px |
| Base salary | 48 px | 408 px | 15 px |
| ฿30,000 | 351 px | 408 px | 15 px |
| Approved hours | 48 px | 450 px | 15 px |
| 0 hours | 351 px | 450 px | 15 px |
| Overtime rate | 48 px | 492 px | 15 px |
| ฿250 | 351 px | 492 px | 15 px |
| Overtime pay | 48 px | 534 px | 15 px |
| ฿0 | 351 px | 534 px | 15 px |
| Employee insurance | 48 px | 576 px | 15 px |
| ฿750 | 351 px | 576 px | 15 px |
| Salary advance | 48 px | 618 px | 15 px |
| ฿0 | 351 px | 618 px | 15 px |
| Published | 30 px | 710 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-222"></a>

## 222. Paydesk / Maya october

- Figma frame: [`84:2279`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2279)
- Screen/state: **Maya october**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-223"></a>

## 223. Paydesk / Nina pay settings

- Figma frame: [`84:2302`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2302)
- Screen/state: **Nina pay settings**
- Implementation: [`PaySettingsPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Active employee record → Pay settings.

### Implemented behavior

Show monthly base salary and hourly overtime rate; each opens its own amount selector.

### State and implementation notes

Settings are scoped to the selected employee and never rewrite published snapshots.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-224"></a>

## 224. Paydesk / Nina base

- Figma frame: [`84:2318`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2318)
- Screen/state: **Nina base**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-225"></a>

## 225. Paydesk / Nina rate

- Figma frame: [`84:2330`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2330)
- Screen/state: **Nina rate**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-226"></a>

## 226. Paydesk / Nina insurance

- Figma frame: [`84:2342`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2342)
- Screen/state: **Nina insurance**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Back | 72 px | 15 px | 16 px |
| Insurance deduction | 30 px | 139 px | 30 px |
| Nina Park | 30 px | 203 px | 16 px |
| ฿500 | 171 px | 15 px | 16 px |
| ฿750 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-227"></a>

## 227. Paydesk / Nina advance

- Figma frame: [`84:2354`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2354)
- Screen/state: **Nina advance**
- Implementation: [`editPayAmount → ChoicePage<double>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Pay settings or Prepare payslip → selected amount.

### Implemented behavior

Select a base, hourly rate, insurance or advance amount; update only that employee/field and return to the caller.

### State and implementation notes

Legacy generic calculation states use the same itemized pay model; there is no separate generic total-deduction route. Exact legacy layout equivalence remains open.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-228"></a>

## 228. Paydesk / Nina prepare

- Figma frame: [`84:2366`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2366)
- Screen/state: **Nina prepare**
- Implementation: [`PreparePage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

HR Payroll → unpublished employee/month.

### Implemented behavior

Edit salary/rate and itemized deductions, review approved entries, then calculate a draft.

### State and implementation notes

Net pay uses base + approved hours × rate − insurance − advance. Stale drafts must be recalculated before publication.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-229"></a>

## 229. Paydesk / Nina entries

- Figma frame: [`84:2401`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2401)
- Screen/state: **Nina entries**
- Implementation: [`EntriesPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Prepare/review payslip → approved hours/entries.

### Implemented behavior

List only approved overtime for the employee and pay month, or immutable snapshot entry IDs; open the selected request.

### State and implementation notes

Empty and populated states share this page; unrelated employees/months and unapproved requests are excluded.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-230"></a>

## 230. Paydesk / Nina draft

- Figma frame: [`84:2410`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2410)
- Screen/state: **Nina draft**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina).
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-231"></a>

## 231. Paydesk / Nina published

- Figma frame: [`84:2438`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2438)
- Screen/state: **Nina published**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Net pay is “—” instead of a calculated amount (expected ฿29,250 for Maya, ฿31,250 for Nina).
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Payroll | 72 px | 15 px | 16 px |
| Monthly payslip | 30 px | 139 px | 30 px |
| Nina Park · November 2026 | 30 px | 202 px | 16 px |
| Net pay | 49 px | 267 px | 15 px |
| — | 48 px | 291 px | 33 px |
| Base salary | 48 px | 408 px | 15 px |
| ฿32,000 | 351 px | 408 px | 15 px |
| Approved hours | 48 px | 450 px | 15 px |
| 0 hours | 351 px | 450 px | 15 px |
| Overtime rate | 48 px | 492 px | 15 px |
| ฿250 | 351 px | 492 px | 15 px |
| Overtime pay | 48 px | 534 px | 15 px |
| ฿0 | 351 px | 534 px | 15 px |
| Employee insurance | 48 px | 576 px | 15 px |
| ฿750 | 351 px | 576 px | 15 px |
| Salary advance | 48 px | 618 px | 15 px |
| ฿0 | 351 px | 618 px | 15 px |
| Published | 30 px | 710 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-232"></a>

## 232. Paydesk / Nina october

- Figma frame: [`84:2461`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2461)
- Screen/state: **Nina october**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Payroll | 72 px | 15 px | 16 px |
| Monthly payslip | 30 px | 139 px | 30 px |
| Nina Park · October 2026 | 30 px | 202 px | 16 px |
| Net pay | 49 px | 267 px | 15 px |
| ฿31,250 | 48 px | 291 px | 33 px |
| Base salary | 48 px | 408 px | 15 px |
| ฿32,000 | 351 px | 408 px | 15 px |
| Approved hours | 48 px | 450 px | 15 px |
| 0 hours | 351 px | 450 px | 15 px |
| Overtime rate | 48 px | 492 px | 15 px |
| ฿250 | 351 px | 492 px | 15 px |
| Overtime pay | 48 px | 534 px | 15 px |
| ฿0 | 351 px | 534 px | 15 px |
| Employee insurance | 48 px | 576 px | 15 px |
| ฿750 | 351 px | 576 px | 15 px |
| Salary advance | 48 px | 618 px | 15 px |
| ฿0 | 351 px | 618 px | 15 px |
| Published | 30 px | 710 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-233"></a>

## 233. Paydesk / October register

- Figma frame: [`84:2484`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2484)
- Screen/state: **October register**
- Implementation: [`PayrollPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Dashboard → Payroll/My payslips.

### Implemented behavior

HR can prepare or open each employee’s month. Employees see only their published monthly history.

### State and implementation notes

Published and unpublished register rows navigate to different screens; inactive records cannot create new payroll.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ HR overview | 72 px | 15 px | 16 px |
| Monthly payroll | 30 px | 139 px | 30 px |
| October 2026 ▾ | 171 px | 15 px | 16 px |
| Maya Chen · DH-001 | 17 px | 9 px | 16 px |
| Published | 17 px | 36 px | 14 px |
| › | 308 px | 22 px | 18 px |
| Nina Park · DH-002 | 17 px | 9 px | 16 px |
| Published | 17 px | 36 px | 14 px |
| › | 308 px | 22 px | 18 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-234"></a>

## 234. Paydesk / Months

- Figma frame: [`84:2502`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2502)
- Screen/state: **Months**
- Implementation: [`PayrollPage → ChoicePage<DateTime>`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

HR Payroll → Pay period.

### Implemented behavior

Choose a month and return to the monthly register.

### State and implementation notes

The source shows October/November; the app offers the last twelve months based on the clock.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Payroll | 72 px | 15 px | 16 px |
| Choose pay period | 30 px | 139 px | 30 px |
| November 2026 | 171 px | 15 px | 16 px |
| October 2026 | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-235"></a>

## 235. Paydesk / Second request

- Figma frame: [`84:2515`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2515)
- Screen/state: **Second request**
- Implementation: [`RequestForm`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Employee My leave/My overtime → Request.

### Implemented behavior

Retain selected fields, validate completeness and positive overtime duration, calculate hours and submit a pending request.

### State and implementation notes

Each entered/validation state shares one stateful form; successful submission opens that exact request detail.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Overtime | 72 px | 15 px | 16 px |
| Request overtime | 30 px | 139 px | 30 px |
| Work date | 17 px | 9 px | 16 px |
| Select work details | 17 px | 36 px | 14 px |
| › | 308 px | 22 px | 18 px |
| Start time | 17 px | 9 px | 16 px |
| Select time | 17 px | 36 px | 14 px |
| › | 308 px | 22 px | 18 px |
| End time | 17 px | 9 px | 16 px |
| Select time | 17 px | 36 px | 14 px |
| › | 308 px | 22 px | 18 px |
| Reason | 17 px | 9 px | 16 px |
| Add a reason | 17 px | 36 px | 14 px |
| › | 308 px | 22 px | 18 px |
| Calculated hours | 48 px | 586 px | 15 px |
| — | 351 px | 586 px | 15 px |
| Enter request details | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-236"></a>

## 236. Paydesk / Second ready

- Figma frame: [`84:2545`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2545)
- Screen/state: **Second ready**
- Implementation: [`RequestForm`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Employee My leave/My overtime → Request.

### Implemented behavior

Retain selected fields, validate completeness and positive overtime duration, calculate hours and submit a pending request.

### State and implementation notes

Each entered/validation state shares one stateful form; successful submission opens that exact request detail.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-237"></a>

## 237. Paydesk / Second employee

- Figma frame: [`84:2575`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2575)
- Screen/state: **Second employee**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Overtime | 72 px | 15 px | 16 px |
| Overtime details | 30 px | 139 px | 30 px |
| Maya Chen · 24 Nov 2026 | 30 px | 210 px | 16 px |
| Shift | 48 px | 297 px | 15 px |
| 18:00 – 20:00 | 351 px | 297 px | 15 px |
| Overtime | 48 px | 349 px | 15 px |
| 2 hours | 351 px | 349 px | 15 px |
| Status | 48 px | 401 px | 15 px |
| Not submitted | 351 px | 401 px | 15 px |
| Inventory reconciliation | 48 px | 463 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-238"></a>

## 238. Paydesk / Second pending

- Figma frame: [`84:2589`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2589)
- Screen/state: **Second pending**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Overtime | 72 px | 15 px | 16 px |
| Overtime details | 30 px | 139 px | 30 px |
| Maya Chen · 24 Nov 2026 | 30 px | 210 px | 16 px |
| Shift | 48 px | 297 px | 15 px |
| 18:00 – 20:00 | 351 px | 297 px | 15 px |
| Overtime | 48 px | 349 px | 15 px |
| 2 hours | 351 px | 349 px | 15 px |
| Status | 48 px | 401 px | 15 px |
| Not submitted | 351 px | 401 px | 15 px |
| Inventory reconciliation | 48 px | 463 px | 16 px |
| Approve 2 hours | 171 px | 15 px | 16 px |
| Reject request | 171 px | 15 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-239"></a>

## 239. Paydesk / Second resolved

- Figma frame: [`84:2609`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2609)
- Screen/state: **Second resolved**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected.
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-240"></a>

## 240. Paydesk / Notifications

- Figma frame: [`84:2623`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2623)
- Screen/state: **Notifications**
- Implementation: [`NotificationsPage`](../lib/src/app.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Only the empty state (“You’re all caught up.”) is visible; the notification rows are hidden layers.
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Dashboard → notification control.

### Implemented behavior

Show current employee notices and navigate by the referenced request or payslip ID.

### State and implementation notes

Exact source layout was unavailable in this audit; routing isolation is covered by widget tests.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-241"></a>

## 241. Paydesk / October employee

- Figma frame: [`84:2681`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=84-2681)
- Screen/state: **October employee**
- Implementation: [`PayslipPage`](../lib/src/payroll.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Complete**
- Audit status: Reference retrieval blocked by Figma plan limit; shared implementation mapped; visual match unverified.

### Open this screen

Payroll calculation/register or employee payslip history → selected month.

### Implemented behavior

Show net pay, base, approved hours/rate, overtime pay and deductions. HR can publish a valid draft or return to edit it; published records show their snapshot.

### State and implementation notes

Source placeholders such as an em dash are replaced with calculated values when data is available. Published snapshots remain unchanged after settings edits.

### Reference content and layout

The frame is indexed, but Figma rejected its design-context request because the plan tool-call limit was reached. No exact labels, coordinates or screenshot comparison are asserted for this frame. Obtain this frame’s export or restore Figma access before visual sign-off.

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-242"></a>

## 242. Payroll / Approved entry / 19 November

- Figma frame: [`90:2098`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=90-2098)
- Screen/state: **19 November**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Values are unfilled placeholders: requested hours “—”, time until “Choose end time”, status “No request”, reason “Add reason”. HR frame shows Approve/Reject for a request that says “No request”.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Entries | 68 px | 15 px | 16 px |
| Review overtime | 30 px | 135 px | 30 px |
| Requested hours | 51 px | 218 px | 15 px |
| — | 50 px | 245 px | 36 px |
| Employee | 48 px | 368 px | 15 px |
| Maya Chen | 354 px | 368 px | 15 px |
| Work date | 48 px | 413 px | 15 px |
| 19 Nov 2026 | 354 px | 413 px | 15 px |
| Time from | 48 px | 458 px | 15 px |
| 17:30 | 354 px | 458 px | 15 px |
| Time until | 48 px | 503 px | 15 px |
| Choose end time | 354 px | 503 px | 15 px |
| Status | 48 px | 548 px | 15 px |
| No request | 354 px | 548 px | 15 px |
| Add reason | 48 px | 584 px | 14 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

---

<a id="screen-243"></a>

## 243. Payroll / Approved entry / 24 November

- Figma frame: [`90:2120`](https://www.figma.com/design/8JAJChwmBDUM2dkdvdXHgU/Daily-HR-Mobile-Programming?node-id=90-2120)
- Screen/state: **24 November**
- Implementation: [`RequestDetail`](../lib/src/requests.dart)
- Shared UI: [ui.dart](../lib/src/ui.dart)
- Shared records and rules: [store.dart](../lib/src/store.dart)
- Figma design: **Partial** — Status reads “Not submitted” on the employee, pending and resolved states; the resolved frame does not show Approved or Rejected.
- Audit status: Reference retrieved; shared implementation present; individual visual sign-off pending.

### Open this screen

Request list, notification, or payroll approved-entry drilldown → selected request.

### Implemented behavior

Show employee, request dates/times, reason, hours/duration and status. Pending HR decisions and employee leave cancellation disappear after resolution.

### State and implementation notes

First/Second and employee/HR variants are record and role states. Payroll entry drilldowns keep approved records read-only.

### Reference content and layout

The following labels and design coordinates were extracted from this frame’s retrieved design context. Coordinates are source CSS offsets and may be relative to nested groups, not absolute frame positions or a claim of measured Flutter equality. Flutter uses responsive layouts and safe areas.

| Reference text | Left | Top | Font size |
| --- | --- | --- | --- |
| ‹ Entries | 72 px | 15 px | 16 px |
| Overtime details | 30 px | 139 px | 30 px |
| Maya Chen · 24 Nov 2026 | 30 px | 210 px | 16 px |
| Shift | 48 px | 297 px | 15 px |
| 18:00 – 20:00 | 351 px | 297 px | 15 px |
| Overtime | 48 px | 349 px | 15 px |
| 2 hours | 351 px | 349 px | 15 px |
| Status | 48 px | 401 px | 15 px |
| Not submitted | 351 px | 401 px | 15 px |
| Inventory reconciliation | 48 px | 463 px | 16 px |

### Verification and remaining work

- Shared functional regression checks: [widget tests](../test/widget_test.dart), [Figma flow tests](../test/figma_flows_test.dart), [store tests](../test/store_test.dart).
- Representative render tool: [render_figma_screens.dart](../tool/render_figma_screens.dart), run with `flutter test tool/render_figma_screens.dart`.
- These checks cover shared workflows; they do **not** instantiate or visually certify every frame in this inventory.
- Compare this exact state at 402 × 874, including text, spacing, icons, selected values, return navigation and keyboard behavior, before marking it visually complete.
- Android build and iOS verification status are recorded in [the audit](03-screen-coverage.md).

# Daily HR mobile application

DailyHR is a Flutter employee and HR administrator app for Android and iOS. It implements the workflows in [Agent.md](Agent.md) and the [design implementation plan](spec-md/01-figma-design-implementation.md), using fictional records stored on the device.

Employees can check in and out, browse attendance history, edit contact details, request leave and overtime, view decisions, and open published payslips. HR can manage employees, review attendance and requests, edit pay settings, calculate payroll, inspect included overtime, and publish monthly payslips. Notifications link to the specific request or payslip.

## Local setup

Use Flutter with Dart compatible with `^3.13.0`.

```sh
flutter doctor -v
flutter pub get
```

The app starts with an animated splash and restores the last session. Sign-in uses Supabase email and password auth. Accounts listed in the `hr_admins` table open the HR workspace; accounts linked to an active row in `employees` open the employee workspace. Supabase keeps the session on the device. Copy `.env.example` to `.env` with the project URL and publishable key, and run `supabase/migrations/` and `supabase/seed.sql` in the Supabase SQL Editor before signing in.

Changes persist locally between launches and role switches using SharedPreferences. Clearing the application's storage resets sample records. Authentication and location are simulated; no backend account or device GPS permission is needed. Backend selection and production integration remain open.

## Run on Android

Start an Android emulator or connect a phone with USB debugging enabled.

```sh
flutter devices
flutter run -d <android-device-id>
flutter build apk --debug
```

The APK is at `build/app/outputs/flutter-apk/app-debug.apk`.

## Run on iOS

On macOS, install Xcode and an iOS Simulator runtime, then run:

```sh
open -a Simulator
flutter devices
flutter run -d <ios-device-id>
flutter build ios --simulator
```

For a physical iPhone, open `ios/Runner.xcworkspace`, choose a development team and bundle identifier under Signing & Capabilities, and enable Developer Mode on the phone.

## Development checks

```sh
flutter analyze
flutter test
flutter build apk --debug
flutter build ios --simulator
```

Tests cover role checks, persistence, attendance, leave validation and balances, request isolation, notification destinations, payroll filters and snapshots, form cancellation, sign-out navigation, safe areas and narrow layouts with the keyboard and enlarged text. Widget tests write reference-size screenshots to `build/qa/` for comparison with Figma.

Android debug builds were verified on Windows. iOS builds require macOS/Xcode; interactive checks on Android and iOS devices remain outstanding. The main screens were visually checked at 402 × 874, and forms were tested at 320 × 700 with enlarged text and keyboard insets. Dedicated full-screen selectors implement position, department, leave type, overtime date/time/reason, pay period and pay amount states; the leave date range remains a native Flutter picker; this is not a pixel-by-pixel certification of all 243 indexed frames.

## Structure and demo rules

- `lib/src/store.dart`: shared records, authorization checks for demo operations, Bangkok workday handling, request decisions, persistence, payroll calculation and immutable published totals.
- `lib/src/app.dart` and feature files: sign-in, dashboards, navigation and employee/HR screens.
- `lib/src/ui.dart`: palette, typography and reusable controls.
- `assets/`: downloaded Figma SVG artwork and locally bundled Inter font with its license.
- `tool/generate_icons.dart`: regenerate Android/iOS launcher icons from the source Figma SVG with `flutter test tool/generate_icons.dart`.

Leave uses Monday–Friday working days, with annual/sick/personal allowances of 10/6/6 days per calendar year. Approved leave consumes balance; pending and cancelled requests do not. Overtime must end after it starts on the same workday. Payroll includes only approved overtime for the selected employee and month. Net pay is base salary + hours × hourly rate − insurance − salary advance, rounded to two decimals. Published payslips retain their reviewed values when pay settings change. These are explicit demo rules, not a jurisdiction-specific payroll policy.

Project decisions and outstanding checks are recorded in [the decision log](spec-md/00-changes-and-decision.md).


## Figma implementation audit — 24 November 2026

The Figma inventory contains 243 frames (including state variants). Reference design context was retrieved for 230 frames; 13 requests were blocked by the Figma plan tool-call limit. See [screen coverage](spec-md/03-screen-coverage.md) for the mapping and remaining gaps. This is not a claim that all 243 frames have been visually certified.

Sign-in goes through Supabase (see above); the earlier static login has been removed. Existing saved records are preserved; the new seed identity values apply to fresh demo data.

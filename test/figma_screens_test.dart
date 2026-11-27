import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/payroll.dart';
import 'package:daily_hr_mobile_application/src/people.dart';
import 'package:daily_hr_mobile_application/src/requests.dart';
import 'package:daily_hr_mobile_application/src/store.dart';
import 'package:daily_hr_mobile_application/src/ui.dart';

/// Checks copy and states taken from the Figma frames listed in spec-md.
void main() {
  Future<void> mount(WidgetTester tester, Widget child) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(402, 874);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(theme: appTheme(), home: child));
    await tester.pumpAndSettle();
  }

  HrStore at(String? session) =>
      HrStore(clock: () => DateTime(2026, 11, 24, 9))..session = session;

  test('hour and date labels follow the Figma formats', () {
    expect(hoursLabel(0), '0 hours');
    expect(hoursLabel(1), '1 hour');
    expect(hoursLabel(1.5), '1.5 hours');
    expect(hoursLabel(2), '2 hours');
    expect(shortDateLabel(DateTime(2026, 11, 24)), '24 Nov 2026');
    expect(dayMonthLabel(DateTime(2026, 11, 23)), '23 Nov');
  });

  test('seed payslips match the October Figma payslips', () {
    final s = at('hr');
    final oct = {for (final p in s.payslips) p.employeeId: p};
    expect(oct['DH-001']!.net, 29625);
    expect(oct['DH-001']!.overtime, 375);
    expect(oct['DH-002']!.net, 31250);
  });

  testWidgets('HR payroll register shows Not prepared, Draft and Published '
      '(69:2337, 84:2484)', (tester) async {
    final s = at('hr');
    await mount(tester, PayrollPage(store: s));
    expect(find.text('Monthly payroll'), findsOneWidget);
    expect(find.text('November 2026'), findsOneWidget);
    expect(find.text('Maya Chen · DH-001'), findsOneWidget);
    expect(find.text('Not prepared'), findsNWidgets(2));
    s.saveDraft(s.calculate('DH-002', '2026-11'));
    await tester.pumpAndSettle();
    expect(find.text('Draft'), findsOneWidget);
    await tester.tap(find.text('November 2026'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('October 2026'));
    await tester.pumpAndSettle();
    expect(find.text('Published'), findsNWidgets(2));
  });

  testWidgets('calculate shows the calculating state then the draft '
      '(73:2074 → 84:2205)', (tester) async {
    final s = at('hr');
    await mount(
      tester,
      PreparePage(store: s, employee: s.employees.first, month: '2026-11'),
    );
    expect(find.text('0 hours'), findsOneWidget);
    await tester.ensureVisible(find.text('Calculate and review'));
    await tester.tap(find.text('Calculate and review'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Calculating net pay…'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('Review draft'), findsOneWidget);
    expect(find.text('฿29,250'), findsOneWidget);
    expect(s.payrollStatus(s.employees.first, '2026-11'), 'Draft');
  });

  testWidgets('approved overtime page shows the total and empty copy '
      '(84:2186, 84:2401)', (tester) async {
    final s = at('hr');
    await mount(
      tester,
      EntriesPage(store: s, employee: s.employees[1], month: '2026-11'),
    );
    expect(
      find.text('No approved entries for Nina this month.'),
      findsOneWidget,
    );
    expect(find.text('Total approved hours'), findsOneWidget);
    expect(find.text('0 hours'), findsOneWidget);
  });

  testWidgets('employee payslip list uses the Figma rows (69:2227)', (
    tester,
  ) async {
    await mount(tester, PayrollPage(store: at('DH-001')));
    expect(find.text('Maya Chen  ·  DH-001'), findsOneWidget);
    expect(find.text('Published payslips'), findsOneWidget);
    expect(find.text('October 2026'), findsOneWidget);
    expect(find.text('฿29,625 net pay'), findsOneWidget);
  });

  testWidgets('overtime lists show the empty Figma states (69:1979, 69:2141)', (
    tester,
  ) async {
    await mount(tester, RequestsPage(store: at('DH-001'), kind: 'Overtime'));
    expect(find.text('Approved hours · November'), findsOneWidget);
    expect(find.text('0 hours'), findsOneWidget);
    expect(find.text('Request history'), findsOneWidget);
    expect(
      find.text('Your submitted requests will appear here.'),
      findsOneWidget,
    );
    await mount(tester, RequestsPage(store: at('hr'), kind: 'Overtime'));
    expect(find.text('Overtime requests'), findsOneWidget);
    expect(find.text('No pending overtime'), findsOneWidget);
    expect(find.text('No overtime requests submitted yet.'), findsOneWidget);
  });

  testWidgets('leave lists use Figma row titles (44:1595, 44:1621)', (
    tester,
  ) async {
    await mount(tester, RequestsPage(store: at('DH-001'), kind: 'Leave'));
    expect(find.text('Annual Leave · 23 Nov'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);
    await mount(tester, RequestsPage(store: at('hr'), kind: 'Leave'));
    expect(find.text('Leave requests'), findsOneWidget);
    expect(find.text('Maya Chen'), findsOneWidget);
    expect(find.text('People Operations'), findsOneWidget);
  });

  testWidgets('HR overtime detail approves the requested hours '
      '(84:2589 → 84:2609)', (tester) async {
    final s = at('DH-001');
    final r = s.submit(
      'Overtime',
      'Overtime',
      DateTime(2026, 11, 24, 18),
      DateTime(2026, 11, 24, 20),
      'Inventory reconciliation',
    );
    s.session = 'hr';
    await mount(tester, RequestDetail(store: s, request: r));
    expect(find.text('Overtime details'), findsOneWidget);
    expect(find.text('Maya Chen · 24 Nov 2026'), findsOneWidget);
    expect(find.text('18:00 – 20:00'), findsOneWidget);
    await tester.tap(find.text('Approve 2 hours'));
    await tester.pumpAndSettle();
    expect(find.text('Approve request?'), findsOneWidget);
    await tester.tap(find.text('Confirm approval'));
    await tester.pumpAndSettle();
    expect(r.status, 'Approved');
    expect(find.text('Approve 2 hours'), findsNothing);
  });

  testWidgets('leave approval confirmation uses the Figma message (44:1817)', (
    tester,
  ) async {
    final s = at('hr');
    await mount(tester, RequestDetail(store: s, request: s.requests.first));
    await tester.ensureVisible(find.text('Approve request'));
    await tester.tap(find.text('Approve request'));
    await tester.pumpAndSettle();
    expect(find.text('23 November · 1 working day'), findsOneWidget);
    expect(
      find.text('Approval deducts one day from the selected leave balance.'),
      findsOneWidget,
    );
  });

  testWidgets('add employee shows the required-fields summary (32:1250)', (
    tester,
  ) async {
    final s = at('hr');
    await mount(tester, EmployeeForm(store: s));
    expect(find.text('name@company.com'), findsOneWidget);
    expect(find.text('Choose position'), findsOneWidget);
    await tester.ensureVisible(find.text('Add employee').last);
    await tester.tap(find.text('Add employee').last);
    await tester.pumpAndSettle();
    expect(
      find.text('Enter a name, work email, position and department.'),
      findsOneWidget,
    );
    expect(s.employees.length, 2);
  });
}

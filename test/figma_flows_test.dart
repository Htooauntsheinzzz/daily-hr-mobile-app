import 'package:flutter/material.dart';
import 'package:daily_hr_mobile_application/src/attendance.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/app.dart';
import 'package:daily_hr_mobile_application/src/people.dart';
import 'package:daily_hr_mobile_application/src/payroll.dart';
import 'package:daily_hr_mobile_application/src/requests.dart';
import 'package:daily_hr_mobile_application/src/store.dart';
import 'package:daily_hr_mobile_application/src/ui.dart';

void main() {
  Future<void> mount(WidgetTester tester, Widget child) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(402, 874);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(theme: appTheme(), home: child));
    await tester.pumpAndSettle();
  }

  for (final employeeIndex in [0, 1]) {
    testWidgets(
      'employee $employeeIndex independent position and department choices survive back',
      (tester) async {
        final store = HrStore()..session = 'hr';
        final e = store.employees[employeeIndex];
        final originalPosition = e.position;
        await mount(tester, EmployeeForm(store: store, employee: e));
        await tester.tap(find.text(e.position));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Team Lead'));
        await tester.pumpAndSettle();
        await tester.tap(find.text(e.department));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Business Operations'));
        await tester.pumpAndSettle();
        expect(find.text('Team Lead'), findsOneWidget);
        expect(find.text('Business Operations'), findsOneWidget);
        expect(e.position, originalPosition);
        await tester.ensureVisible(find.text('Save changes'));
        await tester.tap(find.text('Save changes'));
        await tester.pumpAndSettle();
        expect(e.position, 'Team Lead');
        expect(e.department, 'Business Operations');
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('inactive record removes editing and pay actions', (
    tester,
  ) async {
    final store = HrStore()..session = 'hr';
    final e = store.employees.first..active = false;
    await mount(tester, EmployeeDetail(store: store, employee: e));
    expect(find.text('Inactive'), findsOneWidget);
    expect(find.text('Pay settings'), findsNothing);
    expect(find.text('Edit employee'), findsNothing);
    expect(find.text('Deactivate profile'), findsNothing);
    expect(find.text(e.email), findsOneWidget);
  });

  testWidgets(
    'pay selectors update only their field and preserve published snapshots',
    (tester) async {
      final store = HrStore()..session = 'hr';
      final e = store.employees.first;
      final published = store.payslips.first;
      final originalNet = published.net;
      await mount(
        tester,
        PreparePage(store: store, employee: e, month: '2026-11'),
      );
      for (final entry in [
        ('Monthly base salary', 32000.0),
        ('Overtime rate per hour', 300.0),
        ('Employee insurance', 500.0),
        ('Salary advance', 250.0),
      ]) {
        await tester.ensureVisible(find.text(entry.$1));
        await tester.tap(find.text(entry.$1));
        await tester.pumpAndSettle();
        await tester.tap(find.text(money(entry.$2)));
        await tester.pumpAndSettle();
      }
      expect([e.base, e.rate, e.insurance, e.advance], [32000, 300, 500, 250]);
      expect(store.calculate(e.id, '2026-11').net, 31250);
      expect(published.net, originalNet);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'overtime full-screen choices calculate and submit the selected request',
    (tester) async {
      final store = HrStore(clock: () => DateTime(2026, 11, 19))
        ..session = 'DH-001';
      await mount(tester, RequestForm(store: store, kind: 'Overtime'));
      for (final entry in [
        ('Work date', 'Thu, 19 November 2026'),
        ('Start time', '17:30'),
        ('End time', '20:00'),
        ('Reason', 'Inventory reconciliation'),
      ]) {
        await tester.tap(find.text(entry.$1));
        await tester.pumpAndSettle();
        await tester.tap(find.text(entry.$2));
        await tester.pumpAndSettle();
      }
      expect(find.text('2.5 hours'), findsOneWidget);
      await tester.ensureVisible(find.text('Submit request'));
      await tester.tap(find.text('Submit request'));
      await tester.pumpAndSettle();
      final r = store.requests.last;
      expect(r.hours, 2.5);
      expect(r.reason, 'Inventory reconciliation');
      expect(r.status, 'Pending');
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('list bottom navigation returns to root workspace tab', (
    tester,
  ) async {
    final store = HrStore()..session = 'DH-001';
    await mount(tester, DailyHrApp(store: store, showSplash: false));
    await tester.ensureVisible(find.text('My leave'));
    await tester.tap(find.text('My leave'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(NavigationDestination).last);
    await tester.pumpAndSettle();
    expect(find.text('Edit contact details'), findsOneWidget);
    expect(find.text('Available balances'), findsNothing);
  });

  test('attendance review distinguishes approved leave and an open shift', () {
    final store = HrStore();
    final e = store.employees.first;
    final date = DateTime(2026, 11, 23);
    expect(attendanceStatus(store, e, date), 'Absent');
    store.requests.first.status = 'Approved';
    expect(attendanceStatus(store, e, date), 'On leave');
    store.shifts.add(Shift(e.id, DateTime(2026, 11, 23, 9, 2)));
    expect(attendanceStatus(store, e, date), 'Checked in');
    store.shifts.last.end = DateTime(2026, 11, 23, 17);
    expect(attendanceStatus(store, e, date), 'Late');
  });

  test('Figma credentials and legacy demo credentials remain valid', () {
    final store = HrStore();
    expect(store.signIn('arun@dailyhr.example', 'DemoPass42', true), isNull);
    expect(store.signIn('hr@dailyhr.example', 'DailyHR123!', true), isNull);
    expect(store.signIn('maya@dailyhr.example', 'DemoPass42', false), isNull);
    expect(store.balance('DH-001', 'Annual leave', 2026), 10);
    expect(store.balance('DH-001', 'Sick leave', 2026), 6);
  });
}

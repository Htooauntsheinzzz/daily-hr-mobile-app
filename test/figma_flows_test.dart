import 'package:flutter/material.dart';
import 'package:daily_hr_mobile_application/src/attendance.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/app.dart';
import 'package:daily_hr_mobile_application/src/people.dart';
import 'package:daily_hr_mobile_application/src/payroll.dart';
import 'package:daily_hr_mobile_application/src/requests.dart';
import 'package:daily_hr_mobile_application/src/store.dart';

import 'fake_auth.dart';

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
        await tester.enterText(
          find.byType(TextFormField),
          entry.$2.round().toString(),
        );
        await tester.tap(find.text('Save amount'));
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
      // Work date: any day from the calendar.
      await tester.tap(find.text('Work date'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('19'));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      // Start time 18:00 (the picker's default), end time 20:30.
      await tester.tap(find.text('Start time'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('End time'));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.keyboard_outlined));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(1), '30');
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      // Reason: typed freely.
      await tester.tap(find.text('Reason'));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byType(TextFormField),
        'Inventory reconciliation',
      );
      await tester.tap(find.text('Save reason'));
      await tester.pumpAndSettle();
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

  test('old demo credentials no longer sign in', () async {
    final store = HrStore(auth: FakeAuth());
    expect(await store.signIn('arun@dailyhr.example', 'DemoPass42'), isNotNull);
    expect(await store.signIn('maya@dailyhr.example', 'DemoPass42'), isNotNull);
    expect(await store.signIn('arun@gmail.com', '123456'), isNull);
    expect(store.session, 'hr');
    final now = DateTime(2026, 11, 24);
    expect(store.leaveLeft('DH-001', store.leaveType('Annual Leave'), now), 6);
    expect(store.leaveLeft('DH-001', store.leaveType('Monthly Leave'), now), 2);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/app.dart';
import 'package:daily_hr_mobile_application/src/auth.dart';
import 'package:daily_hr_mobile_application/src/store.dart';

import 'fake_auth.dart';
import 'fake_backend.dart';

void main() {
  late FakeBackend backend;

  Future<HrStore> signedIn(String who) async {
    backend.me = who == 'maya' ? 'DH-001' : null;
    backend.hr = who == 'arun';
    final store = HrStore(
      auth: FakeAuth(
        accounts: {
          'maya/pw': const AuthRoles(
            employee: {'id': 'DH-001', 'active': true},
          ),
          'arun/pw': const AuthRoles(hr: true),
        },
      ),
      backend: backend,
      clock: () => DateTime(2026, 11, 24, 10),
    );
    expect(await store.signIn(who, 'pw'), isNull);
    return store;
  }

  setUp(() => backend = FakeBackend());

  group('worked out on the device', () {
    test('HR totals: checked in, on leave, not checked in, pending', () {
      final store = HrStore(clock: () => DateTime(2026, 11, 24, 10))
        ..session = 'hr';
      store.shifts.add(Shift('DH-001', DateTime(2026, 11, 24, 9)));
      store.requests.add(
        WorkRequest(
          'l1',
          'DH-002',
          'Leave',
          'Annual Leave',
          DateTime(2026, 11, 24),
          DateTime(2026, 11, 24),
          'Trip',
          status: 'Approved',
        ),
      );
      final hr = store.hrSummary();
      expect(hr.employees, 2);
      expect(hr.checkedIn, 1);
      expect(hr.workingNow, 1);
      expect(hr.onLeave, 1);
      expect(hr.notCheckedIn, 0);
      // The demo request from Maya is still pending.
      expect(hr.pendingLeave, 1);
      expect(hr.pendingOvertime, 0);
    });

    test('employee: today, hours and latest requests', () {
      final store = HrStore(clock: () => DateTime(2026, 11, 24, 12))
        ..session = 'DH-001';
      store.shifts.add(Shift('DH-001', DateTime(2026, 11, 24, 9)));
      final me = store.employeeSummary();
      expect(me.state, 'Working');
      expect(me.hoursToday, 3);
      expect(me.latestLeaveStatus, 'Pending');
      expect(me.latestOvertimeStatus, isNull);
      expect(me.pendingRequests, 1);
    });
  });

  group('from Supabase', () {
    test('HR dashboard uses hr_dashboard()', () async {
      backend.hrSummary = {
        ...backend.hrSummary,
        'active_employees': 4,
        'checked_in': 3,
        'on_leave': 1,
        'not_checked_in': 0,
        'pending_leave': 2,
        'pending_overtime': 5,
      };
      final store = await signedIn('arun');
      final hr = store.hrSummary();
      expect(hr.employees, 4);
      expect(hr.checkedIn, 3);
      expect(hr.pendingOvertime, 5);
    });

    test('employee dashboard uses employee_dashboard()', () async {
      backend.employeeSummary = {
        'state': 'Shift complete',
        'hours_today': 9,
        'hours_this_month': 72.5,
        'days_worked_this_month': 8,
        'pending_requests': 1,
        'latest_leave': {'status': 'Approved'},
        'latest_overtime': {'status': 'Pending'},
      };
      final store = await signedIn('maya');
      final me = store.employeeSummary();
      expect(me.state, 'Shift complete');
      expect(me.hoursThisMonth, 72.5);
      expect(me.latestOvertimeStatus, 'Pending');
    });

    testWidgets('HR overview shows the Supabase totals', (tester) async {
      tester.view.physicalSize = const Size(402, 874);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      backend.hrSummary = {
        ...backend.hrSummary,
        'checked_in': 7,
        'pending_leave': 2,
      };
      late HrStore store;
      await tester.runAsync(() async => store = await signedIn('arun'));
      await tester.pumpWidget(DailyHrApp(store: store, showSplash: false));
      await tester.pumpAndSettle();
      expect(find.text('7'), findsOneWidget);
      expect(find.text('2 pending'), findsOneWidget);
      expect(find.textContaining('Not checked in 3'), findsOneWidget);
    });
  });
}

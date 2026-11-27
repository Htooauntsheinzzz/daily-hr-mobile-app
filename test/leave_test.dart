import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/requests.dart';
import 'package:daily_hr_mobile_application/src/auth.dart';
import 'package:daily_hr_mobile_application/src/store.dart';

import 'fake_auth.dart';
import 'fake_backend.dart';

void main() {
  group('leave rules on the device', () {
    late HrStore store;
    late LeaveType annual, monthly, partial;

    WorkRequest take(String type, DateTime start, DateTime end) {
      store.session = 'DH-002';
      final r = store.submit('Leave', type, start, end, 'Reason');
      store.session = 'hr';
      store.decide(r, 'Approved');
      store.session = 'DH-002';
      return r;
    }

    setUp(() {
      store = HrStore(clock: () => DateTime(2026, 3, 2))..session = 'DH-002';
      annual = store.leaveType('Annual Leave');
      monthly = store.leaveType('Monthly Leave');
      partial = store.leaveType('Partial Leave');
    });

    test('Annual Leave: 6 days a year, back to 6 after New Year', () {
      take('Annual Leave', DateTime(2026, 3, 2), DateTime(2026, 3, 3));
      expect(store.leaveLeft('DH-002', annual, DateTime(2026, 3, 9)), 4);
      expect(store.leaveLeft('DH-002', annual, DateTime(2026, 12, 31)), 4);
      expect(store.leaveLeft('DH-002', annual, DateTime(2027, 1, 4)), 6);
    });

    test('Monthly Leave: 2 days a month, back to 2 next month', () {
      take('Monthly Leave', DateTime(2026, 3, 4), DateTime(2026, 3, 4));
      expect(store.leaveLeft('DH-002', monthly, DateTime(2026, 3, 20)), 1);
      expect(store.leaveLeft('DH-002', monthly, DateTime(2026, 4, 1)), 2);
      expect(
        () => store.submit(
          'Leave',
          'Monthly Leave',
          DateTime(2026, 3, 31),
          DateTime(2026, 4, 1),
          'Across months',
        ),
        throwsA(
          isA<StateError>().having((e) => e.message, 'm', contains('month')),
        ),
      );
      expect(
        () => store.submit(
          'Leave',
          'Monthly Leave',
          DateTime(2026, 3, 9),
          DateTime(2026, 3, 10),
          'Too many',
        ),
        throwsA(
          isA<StateError>().having((e) => e.message, 'm', contains('1 day')),
        ),
      );
    });

    test('pending requests hold days until decided', () {
      store.submit(
        'Leave',
        'Monthly Leave',
        DateTime(2026, 3, 5),
        DateTime(2026, 3, 6),
        'Trip',
      );
      expect(store.leaveLeft('DH-002', monthly, DateTime(2026, 3, 2)), 2);
      expect(
        store.leaveLeft(
          'DH-002',
          monthly,
          DateTime(2026, 3, 2),
          includePending: true,
        ),
        0,
      );
    });

    test('Partial Leave only after Annual and Monthly Leave are used', () {
      expect(
        () => store.submit(
          'Leave',
          'Partial Leave',
          DateTime(2026, 3, 16),
          DateTime(2026, 3, 27),
          'Long trip',
        ),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'm',
            contains('Use your Annual Leave first'),
          ),
        ),
      );
      take('Annual Leave', DateTime(2026, 3, 2), DateTime(2026, 3, 9));
      expect(store.leaveLeft('DH-002', annual, DateTime(2026, 3, 2)), 0);
      expect(
        () => store.submit(
          'Leave',
          'Partial Leave',
          DateTime(2026, 3, 16),
          DateTime(2026, 3, 27),
          'Long trip',
        ),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'm',
            contains('Monthly Leave'),
          ),
        ),
      );
      take('Monthly Leave', DateTime(2026, 3, 10), DateTime(2026, 3, 11));
      final long = store.submit(
        'Leave',
        'Partial Leave',
        DateTime(2026, 3, 16),
        DateTime(2026, 3, 27),
        'Long trip',
      );
      expect(long.days, 10);
      expect(long.unpaid, isTrue);
      expect(store.leaveLeft('DH-002', partial, DateTime(2026, 3, 2)), isNull);
      store.session = 'hr';
      store.decide(long, 'Approved');
      expect(long.status, 'Approved');
    });

    test('overlapping leave is refused', () {
      store.submit(
        'Leave',
        'Annual Leave',
        DateTime(2026, 3, 3),
        DateTime(2026, 3, 4),
        'Trip',
      );
      expect(
        () => store.submit(
          'Leave',
          'Monthly Leave',
          DateTime(2026, 3, 4),
          DateTime(2026, 3, 4),
          'Again',
        ),
        throwsA(
          isA<StateError>().having((e) => e.message, 'm', contains('already')),
        ),
      );
    });
  });

  group('leave through Supabase', () {
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
        clock: () => DateTime(2026, 11, 24),
      );
      expect(await store.signIn(who, 'pw'), isNull);
      return store;
    }

    setUp(() => backend = FakeBackend());

    test('sign-in loads leave types and replaces local leave', () async {
      final store = await signedIn('maya');
      expect(store.leaveTypes.map((t) => t.name), [
        'Annual Leave',
        'Monthly Leave',
        'Partial Leave',
      ]);
      // The demo request only existed on the device.
      expect(store.requests.where((r) => r.kind == 'Leave'), isEmpty);
    });

    test('employee submits and cancels through Supabase', () async {
      final store = await signedIn('maya');
      final result = await store.submitLeave(
        'Annual Leave',
        DateTime(2026, 11, 26),
        DateTime(2026, 11, 27),
        'Family trip',
      );
      expect(result.error, isNull);
      expect(backend.leaveRows.single['leave_type'], 'annual');
      final r = result.request!;
      expect(r.days, 2);
      expect(store.requests, contains(r));
      expect(await store.decideRequest(r, 'Cancelled'), isNull);
      expect(backend.leaveRows.single['status'], 'Cancelled');
    });

    test('rules are checked before calling Supabase', () async {
      final store = await signedIn('maya');
      final result = await store.submitLeave(
        'Partial Leave',
        DateTime(2026, 12, 1),
        DateTime(2026, 12, 4),
        'Long trip',
      );
      expect(result.error, contains('Use your Annual Leave first'));
      expect(backend.leaveCalls, 0);
    });

    test('a second approval tap cannot deduct twice', () async {
      backend.leaveRows.add({
        'id': 'leave-9',
        'employee_id': 'DH-001',
        'kind': 'Leave',
        'type': 'Annual Leave',
        'leave_type': 'annual',
        'start_at': '2026-11-25T17:00:00Z',
        'end_at': '2026-11-25T17:00:00Z',
        'reason': 'Trip',
        'status': 'Pending',
        'unpaid': false,
      });
      final store = await signedIn('arun');
      final r = store.requests.firstWhere((r) => r.id == 'leave-9');
      expect(r.start, DateTime.utc(2026, 11, 26));
      final first = store.decideRequest(r, 'Approved');
      final second = store.decideRequest(r, 'Approved');
      expect(await first, isNull);
      expect(await second, contains('already been resolved'));
      expect(backend.deducted['DH-001/annual'], 1);
      expect(r.status, 'Approved');
    });
  });

  testWidgets('one day of Monthly Leave leaves 1 day', (tester) async {
    tester.view.physicalSize = const Size(402, 874);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final store = HrStore(clock: () => DateTime(2026, 11, 24))
      ..session = 'DH-002';
    await tester.pumpWidget(
      MaterialApp(
        home: RequestForm(store: store, kind: 'Leave'),
      ),
    );
    await tester.tap(find.text('Annual Leave'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Monthly Leave'));
    await tester.pumpAndSettle();
    expect(
      find.text('You can take 2 days of Monthly Leave this month.'),
      findsOneWidget,
    );
    await tester.tap(find.text('Choose start date'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('25'));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    // The end date follows the start date, so one day needs one tap.
    expect(find.text('25 Nov 2026 · 1 working day'), findsOneWidget);
    await tester.tap(find.text('Add a reason'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'Appointment');
    await tester.tap(find.text('Save reason'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Submit request'));
    await tester.pumpAndSettle();
    final r = store.requests.last;
    expect(r.type, 'Monthly Leave');
    expect(r.days, 1);
    // The form replaced itself with the request detail; start a fresh app.
    await tester.pumpWidget(
      MaterialApp(
        key: UniqueKey(),
        home: RequestsPage(store: store, kind: 'Leave'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('1 day'), findsOneWidget);
    expect(find.text('1 day waiting for approval'), findsOneWidget);
    store.session = 'hr';
    store.decide(r, 'Approved');
    store.session = 'DH-002';
    await tester.pumpAndSettle();
    expect(find.text('1 day'), findsOneWidget);
    expect(find.text('1 day waiting for approval'), findsNothing);
  });
}

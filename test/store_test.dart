import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily_hr_mobile_application/src/auth.dart';
import 'package:daily_hr_mobile_application/src/store.dart';

import 'fake_auth.dart';

void main() {
  late HrStore store;
  setUp(() {
    store = HrStore(clock: () => DateTime(2026, 11, 24, 9));
  });
  test('Supabase sign-in maps roles and errors', () async {
    final auth = FakeAuth();
    store = HrStore(clock: () => DateTime(2026, 11, 24, 9), auth: auth);
    expect(
      await store.signIn('arun@gmail.com', 'wrong'),
      contains('incorrect'),
    );
    expect(store.session, isNull);
    store.offline = true;
    expect(
      await store.signIn('arun@gmail.com', '123456'),
      contains('internet connection'),
    );
    store.offline = false;
    auth.failWith = AuthError.offline;
    expect(
      await store.signIn('arun@gmail.com', '123456'),
      contains('internet connection'),
    );
    auth.failWith = null;
    expect(await store.signIn(' Arun@Gmail.com ', '123456'), isNull);
    expect(store.session, 'hr');
    expect(store.accountEmail, 'arun@gmail.com');
    await store.signOut();
    expect(auth.signedInAs, isNull);
    expect(await store.signIn('maya@dailyhr.example', '123456'), isNull);
    expect(store.session, 'DH-001');
  });
  test('no sign-in without Supabase or for inactive employees', () async {
    expect(
      await store.signIn('arun@gmail.com', '123456'),
      contains('available'),
    );
    final maya = FakeAuth();
    store = HrStore(auth: maya)..employee('DH-001').active = false;
    expect(
      await store.signIn('maya@dailyhr.example', '123456'),
      contains('inactive'),
    );
    expect(store.session, isNull);
    expect(maya.signedInAs, isNull);
  });
  test('inactive and unassigned accounts get different messages', () async {
    final auth = FakeAuth(
      accounts: {
        'none@dailyhr.example/pw': const AuthRoles(),
        'old@dailyhr.example/pw': const AuthRoles(
          employee: {'id': 'DH-002', 'active': false},
        ),
        'oldhr@dailyhr.example/pw': const AuthRoles(hr: false),
      },
    );
    store = HrStore(auth: auth);
    expect(
      await store.signIn('none@dailyhr.example', 'pw'),
      contains('doesn’t have access'),
    );
    expect(
      await store.signIn('old@dailyhr.example', 'pw'),
      contains('inactive'),
    );
    expect(
      await store.signIn('oldhr@dailyhr.example', 'pw'),
      contains('inactive'),
    );
    expect(store.session, isNull);
    expect(auth.signOuts, 3);
  });
  test('inactive HR role still opens an active employee record', () async {
    final auth = FakeAuth(
      accounts: {
        'arun@gmail.com/pw': const AuthRoles(
          hr: false,
          employee: {'id': 'DH-001', 'active': true},
        ),
      },
    );
    store = HrStore(auth: auth);
    expect(await store.signIn('arun@gmail.com', 'pw'), isNull);
    expect(store.session, 'DH-001');
    expect(store.canUseHr, isFalse);
  });
  test('deactivation while signed in signs the person out', () async {
    final auth = FakeAuth();
    store = HrStore(auth: auth);
    expect(await store.signIn('maya@dailyhr.example', '123456'), isNull);
    auth.failWith = AuthError.offline;
    await store.refreshAccess();
    expect(store.session, 'DH-001');
    auth.failWith = null;
    await store.refreshAccess();
    expect(store.session, 'DH-001');
    auth.signedInAs = const AuthRoles(
      employee: {'id': 'DH-001', 'active': false},
    );
    await store.refreshAccess();
    expect(store.session, isNull);
    expect(store.signedOutReason, contains('inactive'));
    expect(auth.signOuts, 1);
  });
  test('losing HR access moves an HR employee to their own view', () async {
    final auth = FakeAuth(
      accounts: {
        'arun@gmail.com/123456': const AuthRoles(
          hr: true,
          employee: {'id': 'DH-001', 'active': true},
        ),
      },
    );
    store = HrStore(auth: auth);
    expect(await store.signIn('arun@gmail.com', '123456'), isNull);
    expect(store.session, 'hr');
    auth.signedInAs = const AuthRoles(
      hr: false,
      employee: {'id': 'DH-001', 'active': true},
    );
    await store.refreshAccess();
    expect(store.session, 'DH-001');
    expect(store.canSwitchWorkspace, isFalse);
  });
  test('restoring a deactivated account signs it out', () async {
    SharedPreferences.setMockInitialValues({});
    final auth = FakeAuth()
      ..signedInAs = const AuthRoles(
        employee: {'id': 'DH-001', 'active': false},
      );
    store = await HrStore.load(auth: auth);
    expect(store.session, isNull);
    expect(store.signedOutReason, contains('inactive'));
    expect(auth.signedInAs, isNull);
  });
  test('first sign-in copies the Supabase employee record', () async {
    final auth = FakeAuth(
      accounts: {
        'lee@dailyhr.example/pw': const AuthRoles(
          employee: {
            'id': 'DH-007',
            'name': 'Lee Wong',
            'email': 'lee@dailyhr.example',
            'position': 'Analyst',
            'department': 'Finance',
            'base_salary': 28000,
          },
        ),
      },
    );
    store = HrStore(auth: auth);
    expect(await store.signIn('lee@dailyhr.example', 'pw'), isNull);
    expect(store.session, 'DH-007');
    expect(store.me.name, 'Lee Wong');
    expect(store.me.base, 28000);
    expect(store.canSwitchWorkspace, isFalse);
  });
  test('HR admin who is also an employee switches views', () async {
    final auth = FakeAuth(
      accounts: {
        'arun@gmail.com/123456': const AuthRoles(
          hr: true,
          employee: {
            'id': 'DH-003',
            'name': 'Arun Patel',
            'email': 'arun@gmail.com',
            'position': 'HR Administrator',
            'department': 'People Operations',
          },
        ),
      },
    );
    store = HrStore(clock: () => DateTime(2026, 11, 24, 9), auth: auth);
    expect(await store.signIn('arun@gmail.com', '123456'), isNull);
    expect(store.session, 'hr');
    expect(store.ownEmployeeId, 'DH-003');
    expect(store.canSwitchWorkspace, isTrue);
    await store.switchWorkspace();
    expect(store.session, 'DH-003');
    expect(store.isHr, isFalse);
    final own = store.submit(
      'Leave',
      'Annual Leave',
      DateTime(2026, 11, 26),
      DateTime(2026, 11, 26),
      'Trip',
    );
    expect(() => store.decide(own, 'Approved'), throwsStateError);
    await store.switchWorkspace();
    expect(store.isHr, isTrue);
    expect(store.isOwnRequest(own), isTrue);
    expect(() => store.decide(own, 'Approved'), throwsStateError);
    expect(own.status, 'Pending');
    store.decide(store.requests.first, 'Approved');
    await store.signOut();
    expect(store.canUseHr, isFalse);
    expect(store.ownEmployeeId, isNull);
  });
  test('attendance uses one shared shift and rejects duplicate check-in', () {
    var now = DateTime(2026, 11, 24, 9);
    store = HrStore(clock: () => now)..session = 'DH-001';
    store.checkIn();
    expect(() => store.checkIn(), throwsStateError);
    now = DateTime(2026, 11, 24, 17, 30);
    store.checkOut();
    expect(store.shiftFor('DH-001', now)!.hours(now), 8.5);
    expect(store.openShift, isNull);
    expect(() => store.checkOut(), throwsStateError);
    expect(store.shiftFor('DH-002', now), isNull);
    store.session = 'hr';
    expect(store.shiftFor('DH-001', now)!.hours(now), 8.5);
  });
  test(
    'overnight shift remains open until checkout and keeps original day',
    () {
      var now = DateTime(2026, 11, 24, 23);
      store = HrStore(clock: () => now)..session = 'DH-001';
      store.checkIn();
      now = DateTime(2026, 11, 25, 2);
      store.checkOut();
      expect(store.shiftFor('DH-001', DateTime(2026, 11, 24))!.hours(now), 3);
      expect(store.shiftFor('DH-001', DateTime(2026, 11, 25)), isNull);
    },
  );
  test('decisions and notifications identify the exact request', () {
    store.session = 'DH-001';
    final a = store.submit(
      'Leave',
      'Annual Leave',
      DateTime(2026, 11, 25),
      DateTime(2026, 11, 25),
      'First',
    );
    final b = store.submit(
      'Leave',
      'Annual Leave',
      DateTime(2026, 11, 26),
      DateTime(2026, 11, 26),
      'Second',
    );
    expect(() => store.decide(a, 'Approved'), throwsStateError);
    store.session = 'hr';
    store.decide(b, 'Approved');
    expect(a.status, 'Pending');
    expect(b.status, 'Approved');
    expect(store.notices.single.target, b.id);
    final annual = store.leaveType('Annual Leave');
    expect(store.leaveLeft('DH-001', annual, DateTime(2026, 11, 24)), 5);
    expect(() => store.decide(b, 'Rejected'), throwsStateError);
    store.session = 'DH-002';
    expect(() => store.decide(a, 'Cancelled'), throwsStateError);
    store.session = 'DH-001';
    store.decide(a, 'Cancelled');
    expect(a.status, 'Cancelled');
    expect(store.leaveLeft('DH-001', annual, DateTime(2026, 11, 24)), 5);
  });
  test('leave excludes weekends and rejects invalid requests', () {
    store.session = 'DH-001';
    expect(workingDays(DateTime(2026, 11, 27), DateTime(2026, 11, 30)), 2);
    expect(
      () => store.submit(
        'Leave',
        'Annual Leave',
        DateTime(2026, 11, 28),
        DateTime(2026, 11, 29),
        'Weekend',
      ),
      throwsStateError,
    );
    expect(
      () => store.submit(
        'Overtime',
        'Overtime',
        DateTime(2026, 11, 24, 19),
        DateTime(2026, 11, 24, 18),
        'Invalid',
      ),
      throwsStateError,
    );
    expect(
      () => store.submit(
        'Leave',
        'Annual Leave',
        DateTime(2026, 12, 1),
        DateTime(2026, 12, 31),
        'Too long',
      ),
      throwsA(
        isA<StateError>().having((e) => e.message, 'message', contains('left')),
      ),
    );
  });
  test('payroll filters by approval, employee and month; published snapshot is immutable', () {
    store.session = 'DH-001';
    final a = store.submit(
      'Overtime',
      'Overtime',
      DateTime(2026, 11, 19, 17, 30),
      DateTime(2026, 11, 19, 20),
      'Release',
    );
    final b = store.submit(
      'Overtime',
      'Overtime',
      DateTime(2026, 11, 24, 18),
      DateTime(2026, 11, 24, 20),
      'Support',
    );
    final oct = store.submit(
      'Overtime',
      'Overtime',
      DateTime(2026, 10, 20, 18),
      DateTime(2026, 10, 20, 22),
      'October',
    );
    store.session = 'DH-002';
    final nina = store.submit(
      'Overtime',
      'Overtime',
      DateTime(2026, 11, 19, 18),
      DateTime(2026, 11, 19, 22),
      'Design',
    );
    store.session = 'hr';
    for (final r in [a, oct, nina]) {
      store.decide(r, 'Approved');
    }
    final draft = store.calculate('DH-001', '2026-11');
    expect(draft.hours, 2.5);
    expect(draft.overtime, 625);
    expect(draft.net, 29875);
    expect(draft.entryIds, [a.id]);
    store.publish(draft);
    expect(b.status, 'Pending');
    expect(store.notices.last.target, draft.id);
    store.employee('DH-001').base = 40000;
    expect(draft.net, 29875);
    expect(() => store.publish(draft), throwsStateError);
    store.session = 'DH-001';
    expect(store.visiblePayslips().length, 2);
    expect(
      store.visiblePayslips().every(
        (p) => p.employeeId == 'DH-001' && p.published,
      ),
      isTrue,
    );
    expect(
      store.visiblePayslips().firstWhere((p) => p.month == '2026-10').base,
      30000,
    );
    expect(() => store.calculate('DH-002', '2026-11'), throwsStateError);
  });
  test('stale payroll draft must be recalculated before publication', () {
    store.session = 'hr';
    final draft = store.calculate('DH-001', '2026-11');
    store.employee('DH-001').advance = 100;
    expect(() => store.publish(draft), throwsStateError);
    expect(draft.published, isFalse);
  });
  test('restores the Supabase session and local records', () async {
    SharedPreferences.setMockInitialValues({});
    final auth = FakeAuth();
    store = await HrStore.load(auth: auth);
    expect(store.session, isNull);
    expect(await store.signIn('arun@gmail.com', '123456'), isNull);
    store.employee('DH-002').mobile = '089 111 2222';
    await store.changed();
    final restored = await HrStore.load(auth: auth);
    expect(restored.session, 'hr');
    expect(restored.employee('DH-002').mobile, '089 111 2222');
    await restored.signOut();
    expect((await HrStore.load(auth: auth)).session, isNull);
  });
}

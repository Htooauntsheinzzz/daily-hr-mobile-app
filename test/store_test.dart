import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily_hr_mobile_application/src/store.dart';

void main() {
  late HrStore store;
  setUp(() {
    store = HrStore(clock: () => DateTime(2026, 11, 24, 9));
  });
  test(
    'authentication validates role, password, offline and inactive accounts',
    () {
      expect(store.signIn('maya@dailyhr.example', 'wrong', false), isNotNull);
      expect(store.session, isNull);
      expect(
        store.signIn('maya@dailyhr.example', 'DailyHR123!', true),
        isNotNull,
      );
      store.offline = true;
      expect(
        store.signIn('maya@dailyhr.example', 'DailyHR123!', false),
        contains('internet connection'),
      );
      store.offline = false;
      expect(
        store.signIn('unassigned@dailyhr.example', 'DailyHR123!', false),
        contains('needs a role'),
      );
      store.employee('DH-001').active = false;
      expect(
        store.signIn('maya@dailyhr.example', 'DailyHR123!', false),
        isNotNull,
      );
      expect(
        store.signIn('nina@dailyhr.example', 'DailyHR123!', false),
        isNull,
      );
      expect(store.session, 'DH-002');
    },
  );
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
      'Annual leave',
      DateTime(2026, 11, 25),
      DateTime(2026, 11, 25),
      'First',
    );
    final b = store.submit(
      'Leave',
      'Annual leave',
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
    expect(store.balance('DH-001', 'Annual leave', 2026), 9);
    expect(() => store.decide(b, 'Rejected'), throwsStateError);
    store.session = 'DH-002';
    expect(() => store.decide(a, 'Cancelled'), throwsStateError);
    store.session = 'DH-001';
    store.decide(a, 'Cancelled');
    expect(a.status, 'Cancelled');
    expect(store.balance('DH-001', 'Annual leave', 2026), 9);
  });
  test('leave excludes weekends and rejects invalid requests', () {
    store.session = 'DH-001';
    expect(workingDays(DateTime(2026, 11, 27), DateTime(2026, 11, 30)), 2);
    expect(
      () => store.submit(
        'Leave',
        'Annual leave',
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
    final r = store.submit(
      'Leave',
      'Annual leave',
      DateTime(2026, 11, 1),
      DateTime(2026, 11, 30),
      'Too long',
    );
    store.session = 'hr';
    expect(() => store.decide(r, 'Approved'), throwsStateError);
    expect(r.status, 'Pending');
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
  test('restores saved session and records; sign-out persists', () async {
    SharedPreferences.setMockInitialValues({});
    store = await HrStore.load();
    store.signIn('nina@dailyhr.example', 'DailyHR123!', false);
    store.me.mobile = '089 111 2222';
    await store.changed();
    final restored = await HrStore.load();
    expect(restored.session, 'DH-002');
    expect(restored.me.mobile, '089 111 2222');
    await restored.signOut();
    expect((await HrStore.load()).session, isNull);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/auth.dart';
import 'package:daily_hr_mobile_application/src/store.dart';

import 'fake_auth.dart';
import 'fake_backend.dart';

void main() {
  late FakeBackend backend;
  late FakeAuth auth;

  Future<HrStore> signedIn(String who, {HrStore? store}) async {
    backend.me = who == 'maya' ? 'DH-001' : null;
    backend.hr = who == 'arun';
    final s =
        store ??
        HrStore(
          auth: auth,
          backend: backend,
          clock: () => DateTime(2026, 11, 24),
        );
    expect(await s.signIn(who, 'pw'), isNull);
    return s;
  }

  setUp(() {
    backend = FakeBackend();
    auth = FakeAuth(
      accounts: {
        'maya/pw': const AuthRoles(employee: {'id': 'DH-001', 'active': true}),
        'arun/pw': const AuthRoles(hr: true),
      },
    );
  });

  test('employee saves overtime and Supabase keeps the hours', () async {
    final store = await signedIn('maya');
    final result = await store.submitOvertime(
      DateTime(2026, 11, 24, 18),
      DateTime(2026, 11, 24, 20, 30),
      'Month-end reporting',
    );
    expect(result.error, isNull);
    expect(result.request!.hours, 2.5);
    expect(backend.overtimeRows.single['hours'], 2.5);
    expect(backend.overtimeRows.single['start_at'], '2026-11-24T11:00:00.000Z');
    expect(store.overtimeMultiplier, 1.5);
    // Estimated until approved: 250 × 1.5 × 2.5.
    expect(store.overtimePay(result.request!), 937.5);
  });

  test('HR approval fixes the pay; a second tap does nothing', () async {
    final maya = await signedIn('maya');
    final r = (await maya.submitOvertime(
      DateTime(2026, 11, 24, 18),
      DateTime(2026, 11, 24, 20),
      'Inventory',
    )).request!;
    backend.multiplier = 2;
    final hr = await signedIn('arun');
    final entry = hr.requests.firstWhere((x) => x.id == r.id);
    expect(hr.overtimeMultiplier, 2);
    final first = hr.decideRequest(entry, 'Approved');
    final second = hr.decideRequest(entry, 'Approved');
    expect(await first, isNull);
    expect(await second, contains('already been resolved'));
    // Overtime Pay = Hourly Rate × Overtime Multiplier × Overtime Hours.
    expect(entry.overtimePay, 1000);
    expect(hr.overtimePay(entry), 1000);
    // Approved entries are available for payroll.
    final draft = hr.calculate('DH-001', '2026-11');
    expect(draft.entryIds, [entry.id]);
    expect(draft.hours, 2);
    expect(draft.overtime, 1000);
  });

  test('rejected and cancelled overtime never reach payroll', () async {
    final maya = await signedIn('maya');
    final a = (await maya.submitOvertime(
      DateTime(2026, 11, 24, 18),
      DateTime(2026, 11, 24, 19),
      'A',
    )).request!;
    final b = (await maya.submitOvertime(
      DateTime(2026, 11, 25, 18),
      DateTime(2026, 11, 25, 19),
      'B',
    )).request!;
    expect(await maya.decideRequest(b, 'Cancelled'), isNull);
    final hr = await signedIn('arun');
    expect(
      await hr.decideRequest(
        hr.requests.firstWhere((x) => x.id == a.id),
        'Rejected',
      ),
      isNull,
    );
    expect(hr.calculate('DH-001', '2026-11').hours, 0);
  });

  test('Supabase errors are shown to the employee', () async {
    final store = await signedIn('maya');
    final result = await store.submitOvertime(
      DateTime(2026, 11, 24, 20),
      DateTime(2026, 11, 24, 18),
      'Backwards',
    );
    expect(result.error, contains('End time must be after start time'));
    expect(backend.overtimeRows, isEmpty);
  });
}

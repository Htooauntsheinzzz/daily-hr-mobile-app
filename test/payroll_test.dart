import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/auth.dart';
import 'package:daily_hr_mobile_application/src/store.dart';

import 'fake_auth.dart';
import 'fake_backend.dart';

void main() {
  group('payroll calculation', () {
    late HrStore store;

    WorkRequest leave(String type, DateTime start, DateTime end) {
      final r = WorkRequest(
        'leave-${store.requests.length}',
        'DH-002',
        'Leave',
        type,
        start,
        end,
        'Reason',
        status: 'Approved',
        unpaid: type == 'Partial Leave',
      );
      store.requests.add(r);
      return r;
    }

    setUp(() {
      store = HrStore(clock: () => DateTime(2026, 11, 26))..session = 'hr';
    });

    test('daily rate is base salary ÷ working days', () {
      final p = store.calculate('DH-002', '2026-11');
      expect(p.workingDays, 21); // Monday to Friday in November 2026
      expect(p.dailyRate, 1523.81); // 32,000 ÷ 21
      expect(p.gross, 32000);
      expect(p.deductions, 750); // insurance only
      expect(p.net, 31250);
    });

    test('Partial Leave is deducted; Annual and Monthly Leave are paid', () {
      leave('Annual Leave', DateTime(2026, 11, 2), DateTime(2026, 11, 3));
      leave('Monthly Leave', DateTime(2026, 11, 4), DateTime(2026, 11, 4));
      leave('Partial Leave', DateTime(2026, 11, 9), DateTime(2026, 11, 11));
      final p = store.calculate('DH-002', '2026-11');
      expect(p.unpaidLeaveDays, 3);
      expect(p.unpaidLeaveDeduction, 4571.43); // 32,000 × 3 ÷ 21
      expect(p.net, 32000 - 750 - 4571.43);
    });

    test('Partial Leave across two months counts each month’s days', () {
      // Monday 30 Nov to Wednesday 2 Dec: 1 day in November, 2 in December.
      leave('Partial Leave', DateTime(2026, 11, 30), DateTime(2026, 12, 2));
      expect(store.calculate('DH-002', '2026-11').unpaidLeaveDays, 1);
      expect(store.calculate('DH-002', '2026-12').unpaidLeaveDays, 2);
    });

    test('absences: past working days with no check-in or leave', () {
      store.deductAbsences = true;
      store.absencesFrom = DateTime(2026, 11, 23);
      store.shifts.add(
        Shift(
          'DH-002',
          DateTime(2026, 11, 24, 9),
          end: DateTime(2026, 11, 24, 18),
        ),
      );
      leave('Annual Leave', DateTime(2026, 11, 25), DateTime(2026, 11, 25));
      // 23 Nov: absent. 24 Nov: checked in. 25 Nov: approved leave.
      // 26 Nov is today and isn't counted yet.
      final p = store.calculate('DH-002', '2026-11');
      expect(p.absentDays, 1);
      expect(p.absenceDeduction, 1523.81);
      expect(p.net, 32000 - 750 - 1523.81);
    });

    test('overtime pay uses the amounts fixed at approval', () {
      store.requests.add(
        WorkRequest(
          'ot-1',
          'DH-002',
          'Overtime',
          'Overtime',
          DateTime(2026, 11, 10, 18),
          DateTime(2026, 11, 10, 20),
          'Release',
          status: 'Approved',
          overtimePay: 1000,
          overtimeMultiplier: 2,
        ),
      );
      final p = store.calculate('DH-002', '2026-11');
      expect(p.hours, 2);
      expect(p.overtime, 1000);
      expect(p.gross, 33000);
    });

    test('a published payslip keeps its amounts after rates change', () {
      final draft = store.calculate('DH-002', '2026-11');
      store.saveDraft(draft);
      store.publish(draft);
      store.employee('DH-002').base = 50000;
      expect(draft.base, 32000);
      expect(draft.net, 31250);
    });
  });

  group('payroll through Supabase', () {
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
        clock: () => DateTime(2026, 11, 28),
      );
      expect(await store.signIn(who, 'pw'), isNull);
      return store;
    }

    setUp(() => backend = FakeBackend());

    test(
      'HR prepares, checks and publishes; amounts come from Supabase',
      () async {
        final hr = await signedIn('arun');
        expect(hr.deductAbsences, isTrue);
        final result = await hr.preparePayslip('DH-001', '2026-11');
        final draft = result.payslip!;
        expect(draft.published, isFalse);
        expect(hr.payrollStatus(hr.employee('DH-001'), '2026-11'), 'Draft');
        expect(draft.absentDays, 2);
        expect(draft.absenceDeduction, 2857.14); // 30,000 × 2 ÷ 21
        expect(draft.net, 30000 - 750 - 2857.14);
        expect(await hr.publishPayslip(draft), isNull);
        expect(hr.payrollStatus(hr.employee('DH-001'), '2026-11'), 'Published');
        expect(await hr.publishPayslip(draft), contains('already published'));
        expect(
          (await hr.preparePayslip('DH-001', '2026-11')).error,
          contains('already published'),
        );
      },
    );

    test('publishing refuses a draft whose pay data changed', () async {
      final hr = await signedIn('arun');
      final draft = (await hr.preparePayslip('DH-001', '2026-11')).payslip!;
      backend.payDataChanged = true;
      expect(await hr.publishPayslip(draft), contains('Calculate and review'));
      expect(draft.published, isFalse);
    });

    test('employees see only their own published payslips', () async {
      final hr = await signedIn('arun');
      await hr.preparePayslip('DH-001', '2026-11');
      final maya = await signedIn('maya');
      expect(maya.visiblePayslips(), isEmpty);
      final hr2 = await signedIn('arun');
      await hr2.publishPayslip(
        hr2.payslips.firstWhere((p) => p.id == 'DH-001/2026-11'),
      );
      final maya2 = await signedIn('maya');
      expect(maya2.visiblePayslips().single.month, '2026-11');
    });
  });
}

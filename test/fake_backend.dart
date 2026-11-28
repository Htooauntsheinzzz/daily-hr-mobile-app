import 'dart:math';

import 'package:daily_hr_mobile_application/src/backend.dart';

/// In-memory stand-in for the Supabase employee tables.
class FakeBackend implements HrBackend {
  FakeBackend({List<Map<String, dynamic>>? rows})
    : rows = {
        for (final row
            in rows ??
                [
                  {
                    'id': 'DH-001',
                    'name': 'Maya Chen',
                    'email': 'maya@dailyhr.example',
                    'mobile': '081 555 0124',
                    'position': 'People Coordinator',
                    'department': 'People Operations',
                    'personal_email': 'maya@example.com',
                    'active': true,
                    'base_salary': 30000,
                    'overtime_rate': 250,
                    'insurance': 750,
                    'advance': 0,
                    'user_id': 'u-maya',
                  },
                ])
          row['id'] as String: Map<String, dynamic>.from(row),
      };

  final Map<String, Map<String, dynamic>> rows;
  final departmentNames = {'People Operations', 'Product Design', 'Finance'};
  final positionNames = {'People Coordinator', 'Design Associate', 'Analyst'};
  final logins = <String, String>{};
  String? failWith;
  int next = 10;

  void _check() {
    if (failWith != null) throw BackendFailure(failWith!);
  }

  @override
  Future<List<Map<String, dynamic>>> employees() async {
    _check();
    return [for (final row in rows.values) Map.of(row)];
  }

  @override
  Future<List<String>> departments() async => departmentNames.toList()..sort();

  @override
  Future<List<String>> positions() async => positionNames.toList()..sort();

  @override
  Future<Map<String, dynamic>> insertEmployee(
    Map<String, dynamic> values,
  ) async {
    _check();
    if (rows.values.any((r) => r['email'] == values['email'])) {
      throw const BackendFailure('An employee already uses this work email.');
    }
    final row = {
      ...values,
      'id': 'DH-0${next++}',
      'active': true,
      'personal_email': '',
      'base_salary': 30000,
      'overtime_rate': 250,
      'insurance': 750,
      'advance': 0,
      'user_id': null,
    };
    rows[row['id'] as String] = row;
    return Map.of(row);
  }

  @override
  Future<void> updateEmployee(String id, Map<String, dynamic> values) async {
    _check();
    rows[id]!.addAll(values);
  }

  @override
  Future<void> addDepartment(String name) async {
    _check();
    departmentNames.add(name);
  }

  @override
  Future<void> addPosition(String name) async {
    _check();
    positionNames.add(name);
  }

  @override
  Future<void> createLogin(String employeeId, String password) async {
    _check();
    logins[employeeId] = password;
    rows[employeeId]?['user_id'] = 'u-$employeeId';
  }

  // Attendance, following the rules in the attendance migration.
  final shiftRows = <Map<String, dynamic>>[];

  /// The signed-in employee, as `current_employee_id()` would return it.
  String? me;

  /// The database clock (UTC).
  DateTime now = DateTime.utc(2026, 11, 24, 2);

  static const rangsit = (lat: 13.9648750, lng: 100.5864611, radius: 500.0);

  /// Minutes after midnight in Bangkok, from the database clock.
  int get bangkokMinutes {
    final local = now.add(const Duration(hours: 7));
    return local.hour * 60 + local.minute;
  }

  @override
  Future<Map<String, dynamic>?> workHours() async => {
    'check_in_from': '09:00:00',
    'check_in_until': '09:30:00',
    'check_out_from': '18:00:00',
    'check_out_until': '20:00:00',
  };

  static double distance(double lat1, double lon1, double lat2, double lon2) {
    double rad(double d) => d * pi / 180;
    final a =
        pow(sin(rad(lat2 - lat1) / 2), 2) +
        cos(rad(lat1)) * cos(rad(lat2)) * pow(sin(rad(lon2 - lon1) / 2), 2);
    return 2 * 6371000 * asin(sqrt(a));
  }

  @override
  Future<List<Map<String, dynamic>>> shifts(DateTime since) async {
    _check();
    return [for (final row in shiftRows) Map.of(row)];
  }

  @override
  Future<Map<String, dynamic>> checkIn(
    double latitude,
    double longitude,
    double? accuracy,
  ) async {
    _check();
    if (me == null) {
      throw const BackendFailure('Only active employees can check in.');
    }
    if (accuracy != null && accuracy > 150) {
      throw const BackendFailure('Your location isn’t accurate enough yet.');
    }
    if (bangkokMinutes < 540 || bangkokMinutes > 570) {
      throw const BackendFailure('Check-in is open from 9:00 AM to 9:30 AM.');
    }
    final d = distance(latitude, longitude, rangsit.lat, rangsit.lng);
    if (d > rangsit.radius) {
      throw BackendFailure(
        'Check in at Rangsit University. You’re about ${(d / 1000).toStringAsFixed(1)} km away.',
      );
    }
    if (shiftRows.any((r) => r['employee_id'] == me && r['end_at'] == null)) {
      throw const BackendFailure('You’re already checked in.');
    }
    final row = <String, dynamic>{
      'id': 'shift-${shiftRows.length + 1}',
      'employee_id': me,
      'start_at': now.toIso8601String(),
      'end_at': null,
    };
    shiftRows.add(row);
    return Map.of(row);
  }

  @override
  Future<Map<String, dynamic>> checkOut() async {
    _check();
    final row = shiftRows
        .where((r) => r['employee_id'] == me && r['end_at'] == null)
        .firstOrNull;
    if (row == null) throw const BackendFailure('You’re not checked in.');
    if (bangkokMinutes < 1080) {
      throw const BackendFailure('Check-out opens at 6:00 PM.');
    }
    if (bangkokMinutes > 1200) {
      throw const BackendFailure(
        'Check-out closed at 8:00 PM. Ask HR to record your check-out.',
      );
    }
    row['end_at'] = now.toIso8601String();
    return Map.of(row);
  }

  // Leave, following the rules in the leave migration.
  final leaveRows = <Map<String, dynamic>>[];
  final leaveTypeRows = [
    {
      'code': 'annual',
      'name': 'Annual Leave',
      'allowance_days': 6,
      'resets': 'year',
      'paid': true,
      'needs_other_leave_used': false,
    },
    {
      'code': 'monthly',
      'name': 'Monthly Leave',
      'allowance_days': 2,
      'resets': 'month',
      'paid': true,
      'needs_other_leave_used': false,
    },
    {
      'code': 'partial',
      'name': 'Partial Leave',
      'allowance_days': null,
      'resets': null,
      'paid': false,
      'needs_other_leave_used': true,
    },
  ];

  /// Whether the signed-in user is HR, as `is_hr()` would return it.
  bool hr = false;
  int leaveCalls = 0;

  /// Days deducted per employee and leave type, as `leave_balances` holds.
  final deducted = <String, double>{};

  static String _iso(DateTime d) => DateTime.utc(
    d.year,
    d.month,
    d.day,
  ).subtract(const Duration(hours: 7)).toIso8601String();

  @override
  Future<List<Map<String, dynamic>>> leaveTypes() async => leaveTypeRows;

  @override
  Future<List<Map<String, dynamic>>> leaveRequests() async {
    _check();
    return [for (final row in leaveRows) Map.of(row)];
  }

  @override
  Future<Map<String, dynamic>> requestLeave(
    String typeCode,
    DateTime start,
    DateTime end,
    String reason,
  ) async {
    _check();
    leaveCalls++;
    if (me == null) {
      throw const BackendFailure('Only active employees can request leave.');
    }
    final type = leaveTypeRows.firstWhere((t) => t['code'] == typeCode);
    final row = <String, dynamic>{
      'id': 'leave-${leaveRows.length + 1}',
      'employee_id': me,
      'kind': 'Leave',
      'type': type['name'],
      'leave_type': typeCode,
      'start_at': _iso(start),
      'end_at': _iso(end),
      'reason': reason,
      'status': 'Pending',
      'unpaid': type['paid'] == false,
    };
    leaveRows.add(row);
    return Map.of(row);
  }

  @override
  Future<Map<String, dynamic>> decideLeave(
    String requestId,
    String decision,
  ) async {
    _check();
    leaveCalls++;
    if (!hr) throw const BackendFailure('HR access required.');
    final row = leaveRows.firstWhere((r) => r['id'] == requestId);
    if (row['status'] != 'Pending') {
      throw const BackendFailure('This request has already been resolved.');
    }
    if (decision == 'Approved') {
      final key = '${row['employee_id']}/${row['leave_type']}';
      deducted[key] = (deducted[key] ?? 0) + 1;
    }
    row['status'] = decision;
    return Map.of(row);
  }

  @override
  Future<Map<String, dynamic>> cancelLeave(String requestId) async {
    _check();
    leaveCalls++;
    final row = leaveRows.firstWhere((r) => r['id'] == requestId);
    if (row['employee_id'] != me || row['status'] != 'Pending') {
      throw const BackendFailure(
        'Only your own pending requests can be cancelled.',
      );
    }
    row['status'] = 'Cancelled';
    return Map.of(row);
  }

  // Overtime, following the rules in the overtime migration.
  final overtimeRows = <Map<String, dynamic>>[];
  double multiplier = 1.5;
  int overtimeCalls = 0;

  @override
  Future<double?> overtimeMultiplier() async => multiplier;

  @override
  Future<List<Map<String, dynamic>>> overtimeRequests() async {
    _check();
    return [for (final row in overtimeRows) Map.of(row)];
  }

  static String _utc(DateTime local) => DateTime.utc(
    local.year,
    local.month,
    local.day,
    local.hour,
    local.minute,
  ).subtract(const Duration(hours: 7)).toIso8601String();

  @override
  Future<Map<String, dynamic>> requestOvertime(
    DateTime start,
    DateTime end,
    String reason,
  ) async {
    _check();
    overtimeCalls++;
    if (me == null) {
      throw const BackendFailure('Only active employees can request overtime.');
    }
    if (!end.isAfter(start)) {
      throw const BackendFailure(
        'End time must be after start time on the same day.',
      );
    }
    final row = <String, dynamic>{
      'id': 'ot-${overtimeRows.length + 1}',
      'employee_id': me,
      'kind': 'Overtime',
      'type': 'Overtime',
      'start_at': _utc(start),
      'end_at': _utc(end),
      'reason': reason,
      'status': 'Pending',
      'hours': end.difference(start).inMinutes / 60,
    };
    overtimeRows.add(row);
    return Map.of(row);
  }

  @override
  Future<Map<String, dynamic>> decideOvertime(
    String requestId,
    String decision,
  ) async {
    _check();
    overtimeCalls++;
    if (!hr) throw const BackendFailure('HR access required.');
    final row = overtimeRows.firstWhere((r) => r['id'] == requestId);
    if (row['status'] != 'Pending') {
      throw const BackendFailure('This request has already been resolved.');
    }
    row['status'] = decision;
    if (decision == 'Approved') {
      final rate =
          (rows[row['employee_id']]?['overtime_rate'] as num?)?.toDouble() ??
          250;
      row['hourly_rate'] = rate;
      row['multiplier'] = multiplier;
      row['overtime_pay'] = rate * multiplier * (row['hours'] as num);
    }
    return Map.of(row);
  }

  @override
  Future<Map<String, dynamic>> cancelOvertime(String requestId) async {
    _check();
    final row = overtimeRows.firstWhere((r) => r['id'] == requestId);
    if (row['employee_id'] != me || row['status'] != 'Pending') {
      throw const BackendFailure(
        'Only your own pending requests can be cancelled.',
      );
    }
    row['status'] = 'Cancelled';
    return Map.of(row);
  }

  // Payroll, a simplified stand-in for payroll_calculation.
  final payslipRows = <String, Map<String, dynamic>>{};
  bool deductAbsences = true;
  int payrollCalls = 0;

  /// When set, publish refuses as if pay data changed after the draft.
  bool payDataChanged = false;

  @override
  Future<List<Map<String, dynamic>>> payslips() async {
    _check();
    return [
      for (final row in payslipRows.values)
        if (hr || (row['employee_id'] == me && row['published'] == true))
          Map.of(row),
    ];
  }

  @override
  Future<Map<String, dynamic>?> payrollSettings() async => {
    'deduct_absences': deductAbsences,
    'absences_from': '2026-11-01',
  };

  @override
  Future<Map<String, dynamic>> preparePayslip(
    String employeeId,
    String month,
  ) async {
    _check();
    payrollCalls++;
    if (!hr) throw const BackendFailure('HR access required.');
    final key = '$employeeId/$month';
    if (payslipRows[key]?['published'] == true) {
      throw const BackendFailure('This payslip is already published.');
    }
    final e = rows[employeeId]!;
    final entries = overtimeRows.where(
      (r) =>
          r['employee_id'] == employeeId &&
          r['status'] == 'Approved' &&
          (r['start_at'] as String).startsWith(month),
    );
    final row = <String, dynamic>{
      'employee_id': employeeId,
      'month': month,
      'base_salary': e['base_salary'],
      'overtime_rate': e['overtime_rate'],
      'multiplier': multiplier,
      'overtime_hours': entries.fold<num>(0, (n, r) => n + (r['hours'] as num)),
      'overtime_pay': entries.fold<num>(
        0,
        (n, r) => n + (r['overtime_pay'] as num),
      ),
      'overtime_request_ids': [for (final r in entries) r['id']],
      'insurance': e['insurance'],
      'advance': e['advance'],
      'working_days': 21,
      'unpaid_leave_days': 0,
      'unpaid_leave_deduction': 0,
      'absent_days': deductAbsences ? 2 : 0,
      'absence_deduction': deductAbsences
          ? ((e['base_salary'] as num) * 2 / 21 * 100).round() / 100
          : 0,
      'published': false,
    };
    payslipRows[key] = row;
    return Map.of(row);
  }

  @override
  Future<Map<String, dynamic>> publishPayslip(
    String employeeId,
    String month,
  ) async {
    _check();
    payrollCalls++;
    final row = payslipRows['$employeeId/$month'];
    if (row == null) throw const BackendFailure('Prepare the draft first.');
    if (row['published'] == true) {
      throw const BackendFailure('This payslip is already published.');
    }
    if (payDataChanged) {
      throw const BackendFailure(
        'Pay data changed since this draft was prepared. Calculate and review again.',
      );
    }
    row['published'] = true;
    return Map.of(row);
  }

  // Dashboards: tests set what Supabase would return.
  Map<String, dynamic> employeeSummary = {
    'state': 'Ready to check in',
    'hours_today': 0,
    'hours_this_month': 0,
    'days_worked_this_month': 0,
    'pending_requests': 0,
  };
  Map<String, dynamic> hrSummary = {
    'active_employees': 3,
    'checked_in': 0,
    'working_now': 0,
    'on_leave': 0,
    'not_checked_in': 3,
    'missed_check_outs': 0,
    'hours_worked': 0,
    'pending_leave': 0,
    'pending_overtime': 0,
  };
  int dashboardCalls = 0;

  @override
  Future<Map<String, dynamic>> employeeDashboard() async {
    _check();
    dashboardCalls++;
    if (me == null) {
      throw const BackendFailure(
        'Only active employees have an employee dashboard.',
      );
    }
    return Map.of(employeeSummary);
  }

  @override
  Future<Map<String, dynamic>> hrDashboard() async {
    _check();
    dashboardCalls++;
    if (!hr) throw const BackendFailure('HR access required.');
    return Map.of(hrSummary);
  }
}

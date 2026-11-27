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
}

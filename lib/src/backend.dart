import 'dart:async';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

/// A save or load that Supabase refused, with a message for the person.
class BackendFailure implements Exception {
  const BackendFailure(this.message);
  final String message;
  @override
  String toString() => 'BackendFailure($message)';
}

/// Employee information stored in Supabase. Row-level security decides what
/// each signed-in person can read and change.
abstract class HrBackend {
  /// Employee rows: every employee for HR, only their own for employees.
  Future<List<Map<String, dynamic>>> employees();

  /// Active department and position names, sorted.
  Future<List<String>> departments();
  Future<List<String>> positions();

  /// Adds an employee and returns the saved row (with its generated id).
  Future<Map<String, dynamic>> insertEmployee(Map<String, dynamic> values);

  Future<void> updateEmployee(String id, Map<String, dynamic> values);

  Future<void> addDepartment(String name);
  Future<void> addPosition(String name);

  /// Creates a Supabase Auth login for an employee (HR only).
  Future<void> createLogin(String employeeId, String password);

  /// Shift rows that started on or after [since]: every employee's for HR,
  /// only their own for employees.
  Future<List<Map<String, dynamic>>> shifts(DateTime since);

  /// Checks in at the database's time. The database refuses locations
  /// outside an active workplace. Returns the saved shift row.
  Future<Map<String, dynamic>> checkIn(
    double latitude,
    double longitude,
    double? accuracy,
  );

  /// Checks out at the database's time, from any location.
  Future<Map<String, dynamic>> checkOut();

  /// The active workplace's check-in and check-out hours, or null.
  Future<Map<String, dynamic>?> workHours();

  /// Active leave types, in display order.
  Future<List<Map<String, dynamic>>> leaveTypes();

  /// Leave requests: everyone's for HR, only their own for employees.
  Future<List<Map<String, dynamic>>> leaveRequests();

  /// Submits leave. Supabase counts the days and checks the balance.
  Future<Map<String, dynamic>> requestLeave(
    String typeCode,
    DateTime start,
    DateTime end,
    String reason,
  );

  /// HR approves or rejects; the balance changes in the same step.
  Future<Map<String, dynamic>> decideLeave(String requestId, String decision);

  /// The employee cancels their own pending request.
  Future<Map<String, dynamic>> cancelLeave(String requestId);

  /// The overtime multiplier from `overtime_settings`, or null.
  Future<double?> overtimeMultiplier();

  /// Overtime requests: everyone's for HR, only their own for employees.
  Future<List<Map<String, dynamic>>> overtimeRequests();

  /// Saves overtime. Supabase calculates the hours.
  Future<Map<String, dynamic>> requestOvertime(
    DateTime start,
    DateTime end,
    String reason,
  );

  /// HR approves or rejects; approval fixes rate, multiplier and pay.
  Future<Map<String, dynamic>> decideOvertime(
    String requestId,
    String decision,
  );

  Future<Map<String, dynamic>> cancelOvertime(String requestId);

  /// Payslips: all for HR, only own published ones for employees.
  Future<List<Map<String, dynamic>>> payslips();

  /// `payroll_settings` (absence deduction), or null.
  Future<Map<String, dynamic>?> payrollSettings();

  /// HR prepares or recalculates a draft; returns the saved payslip row.
  Future<Map<String, dynamic>> preparePayslip(String employeeId, String month);

  /// HR publishes a checked draft; returns the saved payslip row.
  Future<Map<String, dynamic>> publishPayslip(String employeeId, String month);

  /// The signed-in employee's home summary.
  Future<Map<String, dynamic>> employeeDashboard();

  /// HR's attendance totals and pending approvals for today.
  Future<Map<String, dynamic>> hrDashboard();
}

class SupabaseHrBackend implements HrBackend {
  SupabaseHrBackend(this.client);
  final SupabaseClient client;

  static const connectionMessage =
      'Couldn’t connect. Check your internet connection and try again.';

  Future<T> _run<T>(
    Future<T> Function() call, {
    String duplicate = 'An employee already uses this work email.',
  }) async {
    try {
      return await call();
    } on PostgrestException catch (e) {
      if (e.code == '23505') throw BackendFailure(duplicate);
      if (e.code == '23503') {
        throw const BackendFailure(
          'Choose a department and position from the list.',
        );
      }
      if (e.code == '42501') {
        throw const BackendFailure(
          'You don’t have permission to make this change.',
        );
      }
      // Messages raised by the database rules are written for people.
      throw BackendFailure(e.message);
    } on FunctionException catch (e) {
      final details = e.details;
      final message = details is Map ? details['error'] as String? : null;
      throw BackendFailure(message ?? 'The login could not be created.');
    } on SocketException {
      throw const BackendFailure(connectionMessage);
    } on TimeoutException {
      throw const BackendFailure(connectionMessage);
    } on AuthException {
      throw const BackendFailure('Your session has ended. Sign in again.');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> employees() => _run(() async {
    final rows = await client.from('employees').select().order('id');
    return List<Map<String, dynamic>>.from(rows);
  });

  Future<List<String>> _names(String table) => _run(() async {
    final rows = await client
        .from(table)
        .select('name')
        .eq('active', true)
        .order('name');
    return [for (final row in rows) row['name'] as String];
  });

  @override
  Future<List<String>> departments() => _names('departments');

  @override
  Future<List<String>> positions() => _names('positions');

  @override
  Future<Map<String, dynamic>> insertEmployee(Map<String, dynamic> values) =>
      _run(() async {
        final row = await client
            .from('employees')
            .insert(values)
            .select()
            .single();
        return Map<String, dynamic>.from(row);
      });

  @override
  Future<void> updateEmployee(String id, Map<String, dynamic> values) =>
      _run(() async {
        final rows = await client
            .from('employees')
            .update(values)
            .eq('id', id)
            .select('id');
        if (rows.isEmpty) {
          throw const BackendFailure(
            'You don’t have permission to make this change.',
          );
        }
      });

  @override
  Future<void> addDepartment(String name) => _run(
    () => client.from('departments').insert({'name': name}),
    duplicate: 'This department already exists.',
  );

  @override
  Future<void> addPosition(String name) => _run(
    () => client.from('positions').insert({'name': name}),
    duplicate: 'This position already exists.',
  );

  @override
  Future<List<Map<String, dynamic>>> shifts(DateTime since) => _run(() async {
    final rows = await client
        .from('shifts')
        .select(
          'id, employee_id, start_at, end_at, work_date, hours, '
          'missed_check_out',
        )
        .gte('start_at', since.toUtc().toIso8601String())
        .order('start_at');
    return List<Map<String, dynamic>>.from(rows);
  });

  @override
  Future<Map<String, dynamic>> checkIn(
    double latitude,
    double longitude,
    double? accuracy,
  ) => _run(() async {
    final row = await client.rpc(
      'check_in',
      params: {'lat': latitude, 'lng': longitude, 'accuracy': accuracy},
    );
    return Map<String, dynamic>.from(row as Map);
  });

  @override
  Future<Map<String, dynamic>> checkOut() => _run(() async {
    final row = await client.rpc('check_out');
    return Map<String, dynamic>.from(row as Map);
  });

  @override
  Future<Map<String, dynamic>?> workHours() => _run(
    () => client
        .from('workplaces')
        .select(
          'check_in_from, check_in_until, check_out_from, check_out_until',
        )
        .eq('active', true)
        .order('id')
        .limit(1)
        .maybeSingle(),
  );

  @override
  Future<List<Map<String, dynamic>>> leaveTypes() => _run(() async {
    final rows = await client
        .from('leave_types')
        .select()
        .eq('active', true)
        .order('sort_order');
    return List<Map<String, dynamic>>.from(rows);
  });

  @override
  Future<List<Map<String, dynamic>>> leaveRequests() => _run(() async {
    final rows = await client
        .from('work_requests')
        .select()
        .eq('kind', 'Leave')
        .order('created_at');
    return List<Map<String, dynamic>>.from(rows);
  });

  static String _date(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  Future<Map<String, dynamic>> _rpcRow(
    String function,
    Map<String, dynamic> params,
  ) => _run(() async {
    final row = await client.rpc(function, params: params);
    return Map<String, dynamic>.from(row as Map);
  });

  @override
  Future<Map<String, dynamic>> requestLeave(
    String typeCode,
    DateTime start,
    DateTime end,
    String reason,
  ) => _rpcRow('request_leave', {
    'type_code': typeCode,
    'start_date': _date(start),
    'end_date': _date(end),
    'reason': reason,
  });

  @override
  Future<Map<String, dynamic>> decideLeave(String requestId, String decision) =>
      _rpcRow('decide_leave', {'request_id': requestId, 'decision': decision});

  @override
  Future<Map<String, dynamic>> cancelLeave(String requestId) =>
      _rpcRow('cancel_leave', {'request_id': requestId});

  @override
  Future<double?> overtimeMultiplier() => _run(() async {
    final row = await client
        .from('overtime_settings')
        .select('multiplier')
        .maybeSingle();
    return (row?['multiplier'] as num?)?.toDouble();
  });

  @override
  Future<List<Map<String, dynamic>>> overtimeRequests() => _run(() async {
    final rows = await client
        .from('work_requests')
        .select()
        .eq('kind', 'Overtime')
        .order('created_at');
    return List<Map<String, dynamic>>.from(rows);
  });

  static String _time(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

  @override
  Future<Map<String, dynamic>> requestOvertime(
    DateTime start,
    DateTime end,
    String reason,
  ) => _rpcRow('request_overtime', {
    'work_date': _date(start),
    'start_time': _time(start),
    'end_time': _time(end),
    'reason': reason,
  });

  @override
  Future<Map<String, dynamic>> decideOvertime(
    String requestId,
    String decision,
  ) => _rpcRow('decide_overtime', {
    'request_id': requestId,
    'decision': decision,
  });

  @override
  Future<Map<String, dynamic>> cancelOvertime(String requestId) =>
      _rpcRow('cancel_overtime', {'request_id': requestId});

  @override
  Future<List<Map<String, dynamic>>> payslips() => _run(() async {
    final rows = await client.from('payslips').select().order('month');
    return List<Map<String, dynamic>>.from(rows);
  });

  @override
  Future<Map<String, dynamic>?> payrollSettings() =>
      _run(() => client.from('payroll_settings').select().maybeSingle());

  @override
  Future<Map<String, dynamic>> preparePayslip(
    String employeeId,
    String month,
  ) => _rpcRow('prepare_payslip', {'employee': employeeId, 'pay_month': month});

  @override
  Future<Map<String, dynamic>> publishPayslip(
    String employeeId,
    String month,
  ) => _rpcRow('publish_payslip', {'employee': employeeId, 'pay_month': month});

  @override
  Future<Map<String, dynamic>> employeeDashboard() =>
      _rpcRow('employee_dashboard', {});

  @override
  Future<Map<String, dynamic>> hrDashboard() => _rpcRow('hr_dashboard', {});

  @override
  Future<void> createLogin(String employeeId, String password) => _run(
    () => client.functions.invoke(
      'create-employee-login',
      body: {'employee_id': employeeId, 'password': password},
    ),
  );
}

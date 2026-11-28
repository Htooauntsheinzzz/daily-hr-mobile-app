import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.dart';
import 'backend.dart';
import 'location.dart';

DateTime bangkokNow() => DateTime.now().toUtc().add(const Duration(hours: 7));
DateTime dayOnly(DateTime d) => DateTime(d.year, d.month, d.day);
String dayKey(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
String monthKey(DateTime d) => dayKey(d).substring(0, 7);
const monthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];
String dateLabel(DateTime d) => '${d.day} ${monthNames[d.month - 1]} ${d.year}';
String monthLabel(DateTime d) => '${monthNames[d.month - 1]} ${d.year}';

/// `24 Nov 2026`, the compact date used on Figma request rows and forms.
String shortDateLabel(DateTime d) =>
    '${d.day} ${monthNames[d.month - 1].substring(0, 3)} ${d.year}';

/// `23 Nov`, used for request list titles.
String dayMonthLabel(DateTime d) =>
    '${d.day} ${monthNames[d.month - 1].substring(0, 3)}';

/// `0 hours`, `1 hour`, `1.5 hours`: whole or minimal-decimal hour counts.
String hoursLabel(double hours) {
  final rounded = (hours * 100).round() / 100;
  final text = rounded == rounded.roundToDouble()
      ? rounded.toStringAsFixed(0)
      : rounded
            .toStringAsFixed(2)
            .replaceFirst(RegExp(r'0+$'), '')
            .replaceFirst(RegExp(r'\.$'), '');
  return '$text ${rounded == 1 ? 'hour' : 'hours'}';
}

String timeLabel(DateTime? d) => d == null
    ? '—'
    : '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
String money(double v) {
  final formatted = v
      .toStringAsFixed(2)
      .replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+\.)'), (m) => '${m[1]},');
  return '฿${formatted.endsWith('.00') ? formatted.substring(0, formatted.length - 3) : formatted}';
}

bool validEmail(String s) => RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(s);
int workingDays(DateTime start, DateTime end) {
  var count = 0;
  for (
    var d = dayOnly(start);
    !d.isAfter(dayOnly(end));
    d = d.add(const Duration(days: 1))
  ) {
    if (d.weekday <= 5) count++;
  }
  return count;
}

class Employee {
  Employee(
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.position,
    this.department, {
    this.personalEmail = '',
    this.active = true,
    this.base = 30000,
    this.rate = 250,
    this.insurance = 750,
    this.advance = 0,
    this.hasLogin = false,
  });
  final String id;
  String name, email, mobile, position, department, personalEmail;
  bool active;

  /// Whether a Supabase login is linked to this employee.
  bool hasLogin;
  double base, rate, insurance, advance;
  String get initials => name
      .split(' ')
      .where((s) => s.isNotEmpty)
      .take(2)
      .map((s) => s[0])
      .join();
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'mobile': mobile,
    'position': position,
    'department': department,
    'personalEmail': personalEmail,
    'active': active,
    'base': base,
    'rate': rate,
    'insurance': insurance,
    'advance': advance,
    'hasLogin': hasLogin,
  };

  /// A row from the Supabase `employees` table.
  factory Employee.fromRow(Map<String, dynamic> row) =>
      Employee(row['id'] as String, '', '', '', '', '')..applyRow(row);

  void applyRow(Map<String, dynamic> row) {
    double amount(String key, double fallback) =>
        (row[key] as num?)?.toDouble() ?? fallback;
    name = row['name'] as String? ?? name;
    email = row['email'] as String? ?? email;
    mobile = row['mobile'] as String? ?? mobile;
    position = row['position'] as String? ?? position;
    department = row['department'] as String? ?? department;
    personalEmail = row['personal_email'] as String? ?? personalEmail;
    active = row['active'] as bool? ?? active;
    base = amount('base_salary', base);
    rate = amount('overtime_rate', rate);
    insurance = amount('insurance', insurance);
    advance = amount('advance', advance);
    if (row.containsKey('user_id')) hasLogin = row['user_id'] != null;
  }

  factory Employee.fromJson(Map<String, dynamic> j) => Employee(
    j['id'],
    j['name'],
    j['email'],
    j['mobile'],
    j['position'],
    j['department'],
    personalEmail: j['personalEmail'],
    active: j['active'],
    base: (j['base'] as num).toDouble(),
    rate: (j['rate'] as num).toDouble(),
    insurance: (j['insurance'] as num).toDouble(),
    advance: (j['advance'] as num).toDouble(),
    hasLogin: j['hasLogin'] as bool? ?? false,
  );
}

/// A kind of leave and its allowance.
class LeaveType {
  const LeaveType(
    this.code,
    this.name, {
    this.allowance,
    this.resets,
    this.paid = true,
    this.needsOtherLeaveUsed = false,
  });

  final String code, name;

  /// Days per period, or null for leave without a limit.
  final double? allowance;

  /// 'year' or 'month', or null for leave without a limit.
  final String? resets;
  final bool paid;

  /// Only available once every leave type with an allowance is used up.
  final bool needsOtherLeaveUsed;

  factory LeaveType.fromRow(Map<String, dynamic> row) => LeaveType(
    row['code'] as String,
    row['name'] as String,
    allowance: (row['allowance_days'] as num?)?.toDouble(),
    resets: row['resets'] as String?,
    paid: row['paid'] as bool? ?? true,
    needsOtherLeaveUsed: row['needs_other_leave_used'] as bool? ?? false,
  );

  /// The first day of the balance period that [day] falls in.
  DateTime periodStart(DateTime day) =>
      resets == 'month' ? DateTime(day.year, day.month) : DateTime(day.year);

  bool samePeriod(DateTime a, DateTime b) =>
      resets == null ||
      (a.year == b.year && (resets != 'month' || a.month == b.month));

  static const defaults = [
    LeaveType('annual', 'Annual Leave', allowance: 6, resets: 'year'),
    LeaveType('monthly', 'Monthly Leave', allowance: 2, resets: 'month'),
    LeaveType(
      'partial',
      'Partial Leave',
      paid: false,
      needsOtherLeaveUsed: true,
    ),
  ];
}

/// Shows whole days without a decimal point: 2 days, 1.5 days.
String daysLabel(num days) {
  final text = days == days.roundToDouble()
      ? days.round().toString()
      : days.toStringAsFixed(1);
  return '$text ${days == 1 ? 'day' : 'days'}';
}

class WorkRequest {
  WorkRequest(
    this.id,
    this.employeeId,
    this.kind,
    this.type,
    this.start,
    this.end,
    this.reason, {
    this.status = 'Pending',
    this.unpaid = false,
    this.overtimePay,
    this.overtimeMultiplier,
  });
  final String id, employeeId, kind, type, reason;
  final DateTime start, end;
  String status;

  /// Partial Leave: these days reduce salary.
  final bool unpaid;

  /// Approved overtime: pay and multiplier fixed by Supabase at approval.
  double? overtimePay, overtimeMultiplier;
  double get hours => end.difference(start).inMinutes / 60;
  int get days => workingDays(start, end);
  Map<String, dynamic> toJson() => {
    'id': id,
    'employeeId': employeeId,
    'kind': kind,
    'type': type,
    'start': start.toIso8601String(),
    'end': end.toIso8601String(),
    'reason': reason,
    'status': status,
    'unpaid': unpaid,
  };

  /// Leave names before the Annual/Monthly/Partial leave types.
  static String _currentLeaveName(String type) => switch (type) {
    'Annual leave' => 'Annual Leave',
    'Sick leave' || 'Personal leave' => 'Monthly Leave',
    _ => type,
  };

  factory WorkRequest.fromJson(Map<String, dynamic> j) => WorkRequest(
    j['id'],
    j['employeeId'],
    j['kind'],
    _currentLeaveName(j['type']),
    DateTime.parse(j['start']),
    DateTime.parse(j['end']),
    j['reason'],
    status: j['status'],
    unpaid: j['unpaid'] as bool? ?? false,
  );

  /// A row from the Supabase `work_requests` table.
  factory WorkRequest.fromRow(Map<String, dynamic> row) => WorkRequest(
    row['id'] as String,
    row['employee_id'] as String,
    row['kind'] as String,
    row['type'] as String,
    bangkokTime(row['start_at'] as String),
    bangkokTime(row['end_at'] as String),
    row['reason'] as String? ?? '',
    status: row['status'] as String,
    unpaid: row['unpaid'] as bool? ?? false,
    overtimePay: (row['overtime_pay'] as num?)?.toDouble(),
    overtimeMultiplier: (row['multiplier'] as num?)?.toDouble(),
  );
}

/// A Supabase timestamp as Bangkok wall-clock time, the same form as
/// [bangkokNow].
DateTime bangkokTime(String value) =>
    DateTime.parse(value).toUtc().add(const Duration(hours: 7));

/// When check-in and check-out are accepted, in minutes after midnight
/// (Bangkok time).
class WorkHours {
  const WorkHours(
    this.checkInFrom,
    this.checkInUntil,
    this.checkOutFrom,
    this.checkOutUntil,
  );
  final int checkInFrom, checkInUntil, checkOutFrom, checkOutUntil;

  static int _minutes(Object? value) {
    final parts = (value as String).split(':');
    return int.parse(parts[0]) * 60 + int.parse(parts[1]);
  }

  factory WorkHours.fromRow(Map<String, dynamic> row) => WorkHours(
    _minutes(row['check_in_from']),
    _minutes(row['check_in_until']),
    _minutes(row['check_out_from']),
    _minutes(row['check_out_until']),
  );

  /// 9:00 AM style label.
  static String label(int minutes) {
    final h = minutes ~/ 60, m = minutes % 60;
    final hour = h % 12 == 0 ? 12 : h % 12;
    return '$hour:${m.toString().padLeft(2, '0')} ${h < 12 ? 'AM' : 'PM'}';
  }

  String get checkInLabel => '${label(checkInFrom)}–${label(checkInUntil)}';
  String get checkOutLabel => '${label(checkOutFrom)}–${label(checkOutUntil)}';
}

class Shift {
  Shift(
    this.employeeId,
    this.start, {
    this.end,
    this.id,
    this.missedCheckOut = false,
  });
  final String employeeId;
  final DateTime start;
  DateTime? end;

  /// The Supabase row id, when the shift came from Supabase.
  final String? id;

  /// The employee didn't check out before the deadline.
  bool missedCheckOut;

  /// A row from the Supabase `shifts` table.
  factory Shift.fromRow(Map<String, dynamic> row) => Shift(
    row['employee_id'] as String,
    bangkokTime(row['start_at'] as String),
    end: row['end_at'] == null ? null : bangkokTime(row['end_at'] as String),
    id: row['id'] as String?,
    missedCheckOut: row['missed_check_out'] as bool? ?? false,
  );
  double hours(DateTime now) => (end ?? now).difference(start).inMinutes / 60;
  Map<String, dynamic> toJson() => {
    'employeeId': employeeId,
    'start': start.toIso8601String(),
    'end': end?.toIso8601String(),
  };
  factory Shift.fromJson(Map<String, dynamic> j) => Shift(
    j['employeeId'],
    DateTime.parse(j['start']),
    end: j['end'] == null ? null : DateTime.parse(j['end']),
  );
}

double _round2(double v) => (v * 100).round() / 100;

class Payslip {
  Payslip(
    this.employeeId,
    this.month,
    this.base,
    this.rate,
    this.hours,
    this.insurance,
    this.advance,
    this.entryIds, {
    this.published = false,
    this.multiplier = 1,
    this.fixedOvertimePay,
    this.workingDays = 0,
    this.unpaidLeaveDays = 0,
    this.absentDays = 0,
    this.fixedUnpaidLeaveDeduction,
    this.fixedAbsenceDeduction,
  });
  final String employeeId, month;
  final double base, rate, hours, insurance, advance;

  /// Overtime multiplier used for this payslip.
  final double multiplier;
  final List<String> entryIds;
  bool published;

  /// Overtime pay saved by Supabase (the sum of approved entries).
  final double? fixedOvertimePay;

  /// Monday-to-Friday days in the month; the daily rate divides by this.
  final int workingDays;

  /// Approved Partial Leave days in the month (unpaid).
  final double unpaidLeaveDays;

  /// Working days with no check-in and no approved leave.
  final int absentDays;

  /// Deductions saved by Supabase when it prepared the payslip.
  final double? fixedUnpaidLeaveDeduction, fixedAbsenceDeduction;

  /// Overtime Pay = Hourly Rate × Overtime Multiplier × Overtime Hours.
  double get overtime => fixedOvertimePay ?? _round2(hours * rate * multiplier);

  /// Base salary ÷ working days.
  double get dailyRate => workingDays == 0 ? 0 : _round2(base / workingDays);
  double get unpaidLeaveDeduction =>
      fixedUnpaidLeaveDeduction ??
      (workingDays == 0 ? 0 : _round2(base * unpaidLeaveDays / workingDays));
  double get absenceDeduction =>
      fixedAbsenceDeduction ??
      (workingDays == 0 ? 0 : _round2(base * absentDays / workingDays));
  double get gross => _round2(base + overtime);
  double get deductions =>
      _round2(insurance + advance + unpaidLeaveDeduction + absenceDeduction);
  double get net => _round2(gross - deductions);
  String get id => '$employeeId/$month';
  Map<String, dynamic> toJson() => {
    'employeeId': employeeId,
    'month': month,
    'base': base,
    'rate': rate,
    'hours': hours,
    'insurance': insurance,
    'advance': advance,
    'entryIds': entryIds,
    'published': published,
    'multiplier': multiplier,
    'fixedOvertimePay': fixedOvertimePay,
    'workingDays': workingDays,
    'unpaidLeaveDays': unpaidLeaveDays,
    'absentDays': absentDays,
    'fixedUnpaidLeaveDeduction': fixedUnpaidLeaveDeduction,
    'fixedAbsenceDeduction': fixedAbsenceDeduction,
  };
  static double? _num(Object? v) => (v as num?)?.toDouble();
  factory Payslip.fromJson(Map<String, dynamic> j) => Payslip(
    j['employeeId'],
    j['month'],
    (j['base'] as num).toDouble(),
    (j['rate'] as num).toDouble(),
    (j['hours'] as num).toDouble(),
    (j['insurance'] as num).toDouble(),
    (j['advance'] as num).toDouble(),
    List<String>.from(j['entryIds']),
    published: j['published'],
    multiplier: _num(j['multiplier']) ?? 1,
    fixedOvertimePay: _num(j['fixedOvertimePay']),
    workingDays: j['workingDays'] as int? ?? 0,
    unpaidLeaveDays: _num(j['unpaidLeaveDays']) ?? 0,
    absentDays: j['absentDays'] as int? ?? 0,
    fixedUnpaidLeaveDeduction: _num(j['fixedUnpaidLeaveDeduction']),
    fixedAbsenceDeduction: _num(j['fixedAbsenceDeduction']),
  );

  /// A row from the Supabase `payslips` table: every amount as saved.
  factory Payslip.fromRow(Map<String, dynamic> row) => Payslip(
    row['employee_id'] as String,
    row['month'] as String,
    _num(row['base_salary']) ?? 0,
    _num(row['overtime_rate']) ?? 0,
    _num(row['overtime_hours']) ?? 0,
    _num(row['insurance']) ?? 0,
    _num(row['advance']) ?? 0,
    List<String>.from(row['overtime_request_ids'] as List? ?? const []),
    published: row['published'] as bool? ?? false,
    multiplier: _num(row['multiplier']) ?? 1,
    fixedOvertimePay: _num(row['overtime_pay']),
    workingDays: (row['working_days'] as num?)?.toInt() ?? 0,
    unpaidLeaveDays: _num(row['unpaid_leave_days']) ?? 0,
    absentDays: (row['absent_days'] as num?)?.toInt() ?? 0,
    fixedUnpaidLeaveDeduction: _num(row['unpaid_leave_deduction']),
    fixedAbsenceDeduction: _num(row['absence_deduction']),
  );
}

class HrNotice {
  HrNotice(this.employeeId, this.title, this.kind, this.target);
  final String employeeId, title, kind, target;
  Map<String, dynamic> toJson() => {
    'employeeId': employeeId,
    'title': title,
    'kind': kind,
    'target': target,
  };
  factory HrNotice.fromJson(Map<String, dynamic> j) =>
      HrNotice(j['employeeId'], j['title'], j['kind'], j['target']);
}

/// Fictional local repository; production authorization belongs in the backend.
/// HR overview numbers for today.
class HrSummary {
  const HrSummary({
    required this.employees,
    required this.checkedIn,
    required this.workingNow,
    required this.onLeave,
    required this.notCheckedIn,
    required this.missedCheckOuts,
    required this.hoursWorked,
    required this.pendingLeave,
    required this.pendingOvertime,
  });
  final int employees, checkedIn, workingNow, onLeave, notCheckedIn;
  final int missedCheckOuts, pendingLeave, pendingOvertime;
  final double hoursWorked;

  static int _int(Object? v) => (v as num?)?.toInt() ?? 0;
  factory HrSummary.fromRow(Map<String, dynamic> row) => HrSummary(
    employees: _int(row['active_employees']),
    checkedIn: _int(row['checked_in']),
    workingNow: _int(row['working_now']),
    onLeave: _int(row['on_leave']),
    notCheckedIn: _int(row['not_checked_in']),
    missedCheckOuts: _int(row['missed_check_outs']),
    hoursWorked: (row['hours_worked'] as num?)?.toDouble() ?? 0,
    pendingLeave: _int(row['pending_leave']),
    pendingOvertime: _int(row['pending_overtime']),
  );
}

/// The employee's home numbers for today.
class EmployeeSummary {
  const EmployeeSummary({
    required this.state,
    required this.hoursToday,
    required this.hoursThisMonth,
    required this.daysWorkedThisMonth,
    required this.pendingRequests,
    this.latestLeaveStatus,
    this.latestOvertimeStatus,
  });
  final String state;
  final double hoursToday, hoursThisMonth;
  final int daysWorkedThisMonth, pendingRequests;
  final String? latestLeaveStatus, latestOvertimeStatus;

  factory EmployeeSummary.fromRow(Map<String, dynamic> row) => EmployeeSummary(
    state: row['state'] as String? ?? 'Ready to check in',
    hoursToday: (row['hours_today'] as num?)?.toDouble() ?? 0,
    hoursThisMonth: (row['hours_this_month'] as num?)?.toDouble() ?? 0,
    daysWorkedThisMonth: (row['days_worked_this_month'] as num?)?.toInt() ?? 0,
    pendingRequests: (row['pending_requests'] as num?)?.toInt() ?? 0,
    latestLeaveStatus: (row['latest_leave'] as Map?)?['status'] as String?,
    latestOvertimeStatus:
        (row['latest_overtime'] as Map?)?['status'] as String?,
  );
}

class HrStore extends ChangeNotifier {
  ValueChanged<int>? navigateWorkspace;
  HrStore({
    this.preferences,
    this.auth,
    this.backend,
    this.location,
    DateTime Function()? clock,
  }) : clock = clock ?? bangkokNow {
    _seed();
  }
  final SharedPreferences? preferences;

  /// Supabase sign-in. Without it (as in most tests) nobody can sign in.
  final AuthGateway? auth;

  /// Supabase employee information. Without it, changes stay on the device.
  final HrBackend? backend;

  /// Device location for check-in. Only used with a Supabase backend.
  final LocationSource? location;

  /// Active departments and positions HR can assign.
  List<String> departments = [
    'Business Operations',
    'People Operations',
    'Product Design',
  ];
  List<String> positions = [
    'Design Associate',
    'HR Administrator',
    'People Coordinator',
    'Team Lead',
  ];
  final DateTime Function() clock;
  final List<Employee> employees = [];
  final List<WorkRequest> requests = [];
  final List<Shift> shifts = [];
  final List<Payslip> payslips = [];
  final List<HrNotice> notices = [];

  /// The open workspace: `'hr'` or the employee id.
  String? session;

  /// Whether the signed-in person is an HR administrator.
  bool canUseHr = false;

  /// The signed-in person's own employee id, also for HR administrators who
  /// work at the company.
  String? ownEmployeeId;
  bool offline = false;
  String? persistenceError;
  Future<void> _pendingSave = Future.value();
  bool get isHr => session == 'hr';
  Employee get me => employee(session!);
  Employee employee(String id) => employees.firstWhere((e) => e.id == id);
  void _seed() {
    employees.addAll([
      Employee(
        'DH-001',
        'Maya Chen',
        'maya@dailyhr.example',
        '081 555 0124',
        'People Coordinator',
        'People Operations',
        personalEmail: 'maya@example.com',
      ),
      Employee(
        'DH-002',
        'Nina Park',
        'nina@dailyhr.example',
        '082 555 0138',
        'Design Associate',
        'Product Design',
        personalEmail: 'nina@example.com',
        base: 32000,
      ),
    ]);
    requests.add(
      WorkRequest(
        'leave-example',
        'DH-001',
        'Leave',
        'Annual Leave',
        DateTime(2026, 11, 23),
        DateTime(2026, 11, 23),
        'Family visit',
      ),
    );
    for (final e in employees) {
      payslips.add(
        Payslip(
          e.id,
          '2026-10',
          e.base,
          e.rate,
          // Figma October payslips: Maya has 1.5 approved hours (฿29,625 net).
          e.id == 'DH-001' ? 1.5 : 0,
          e.insurance,
          0,
          [],
          published: true,
        ),
      );
    }
  }

  static Future<HrStore> load({
    AuthGateway? auth,
    HrBackend? backend,
    LocationSource? location,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final s = HrStore(
      preferences: prefs,
      auth: auth,
      backend: backend,
      location: location,
    );
    final raw = prefs.getString('dailyhr.demo.v1');
    if (raw != null) {
      try {
        final j = jsonDecode(raw) as Map<String, dynamic>;
        final people = (j['employees'] as List)
            .map((v) => Employee.fromJson(v))
            .toList();
        final reqs = (j['requests'] as List)
            .map((v) => WorkRequest.fromJson(v))
            .toList();
        final attendance = (j['shifts'] as List)
            .map((v) => Shift.fromJson(v))
            .toList();
        final pay = (j['payslips'] as List)
            .map((v) => Payslip.fromJson(v))
            .toList();
        final alerts = (j['notices'] as List)
            .map((v) => HrNotice.fromJson(v))
            .toList();
        s.employees
          ..clear()
          ..addAll(people);
        s.requests
          ..clear()
          ..addAll(reqs);
        s.shifts
          ..clear()
          ..addAll(attendance);
        s.payslips
          ..clear()
          ..addAll(pay);
        s.notices
          ..clear()
          ..addAll(alerts);
      } catch (_) {
        s.persistenceError =
            'Saved demo data could not be read. Using sample records.';
      }
    }
    // The signed-in account comes from Supabase, not from saved local data.
    await s._restore();
    return s;
  }

  Future<void> changed() {
    // Records changed (a check-in, a request, a decision): refresh the
    // dashboard numbers from Supabase in the background.
    if (backend != null && session != null) unawaited(refreshDashboard());
    final snapshot = jsonEncode({
      'employees': employees,
      'requests': requests,
      'shifts': shifts,
      'payslips': payslips,
      'notices': notices,
    });
    notifyListeners();
    _pendingSave = _pendingSave.then((_) async {
      try {
        if (preferences != null &&
            !await preferences!.setString('dailyhr.demo.v1', snapshot)) {
          throw StateError('Save failed');
        }
      } catch (_) {
        persistenceError = 'Changes could not be saved on this device.';
        notifyListeners();
      }
    });
    return _pendingSave;
  }

  static const offlineMessage =
      'ⓘ  Couldn’t connect. Check your internet connection and try again.';
  static const authMessages = {
    AuthError.invalidCredentials:
        'ⓘ  The email or password is incorrect. Try again.',
    AuthError.offline: offlineMessage,
    AuthError.noAccess: 'ⓘ  This account doesn’t have access to DailyHR. Contact your HR administrator.',
    AuthError.inactive:
        'ⓘ  Your account is inactive. Contact your HR administrator.',
    AuthError.unavailable:
        'ⓘ  Sign-in isn’t available right now. Try again later.',
  };

  /// Email of the signed-in account, shown on the HR profile.
  String get accountEmail => auth?.currentEmail ?? '';

  /// Why the last session was closed by the app (shown on sign-in), or null.
  String? signedOutReason;

  /// Copies a new Supabase employee record into the local data, then works
  /// out which workspaces the person may open. Returns the reason they are
  /// blocked, or null.
  AuthError? _apply(AuthRoles roles) {
    final row = roles.employee;
    final id = roles.employeeId;
    if (row != null &&
        id != null &&
        roles.employeeActive &&
        !employees.any((e) => e.id == id)) {
      employees.add(Employee.fromRow(row));
    }
    final own =
        roles.employeeActive &&
            id != null &&
            employees.any((e) => e.id == id && e.active)
        ? id
        : null;
    if (!roles.hrActive && own == null) {
      final inactive = roles.inactive || (id != null && own == null);
      return inactive ? AuthError.inactive : AuthError.noAccess;
    }
    canUseHr = roles.hrActive;
    ownEmployeeId = own;
    return null;
  }

  /// Opens the HR workspace for HR administrators, otherwise the employee
  /// workspace.
  AuthError? _open(AuthRoles roles) {
    final error = _apply(roles);
    if (error == null) session = canUseHr ? 'hr' : ownEmployeeId;
    return error;
  }

  Future<void> _restore() async {
    final gateway = auth;
    if (gateway == null) return;
    final AuthRoles? roles;
    try {
      roles = await gateway.currentRoles();
    } on AuthFailure {
      return; // Offline or unavailable: show sign-in, keep the session.
    }
    if (roles == null) return;
    final error = _open(roles);
    if (error != null) {
      await gateway.signOut();
      signedOutReason = authMessages[error];
      return;
    }
    await syncEmployees();
  }

  /// Re-reads the roles from Supabase while signed in, so a deactivated or
  /// removed account is signed out without waiting for a restart.
  Future<void> refreshAccess() async {
    final gateway = auth;
    if (gateway == null || session == null) return;
    final AuthRoles? roles;
    try {
      roles = await gateway.currentRoles();
    } on AuthFailure {
      return; // Try again later; don't sign out because of a network blip.
    }
    if (session == null) return;
    final error = roles == null ? AuthError.noAccess : _apply(roles);
    if (error != null) {
      await _endSession(authMessages[error]);
      return;
    }
    final allowed = session == 'hr' ? canUseHr : session == ownEmployeeId;
    if (!allowed) session = canUseHr ? 'hr' : ownEmployeeId;
    await changed();
  }

  Future<void> _endSession(String? reason) async {
    session = null;
    canUseHr = false;
    ownEmployeeId = null;
    signedOutReason = reason;
    await auth?.signOut();
    await changed();
  }

  /// HR administrators who also work at the company can switch views.
  bool get canSwitchWorkspace => canUseHr && ownEmployeeId != null;

  Future<void> switchWorkspace() {
    if (!canSwitchWorkspace) throw StateError('Only one workspace available.');
    session = isHr ? ownEmployeeId : 'hr';
    return changed();
  }

  /// Signs in with Supabase. Returns an error message, or null on success.
  Future<String?> signIn(String email, String password) async {
    if (offline) return offlineMessage;
    final gateway = auth;
    if (gateway == null) return authMessages[AuthError.unavailable];
    try {
      final roles = await gateway.signIn(email.trim().toLowerCase(), password);
      final error = _open(roles);
      if (error != null) {
        await gateway.signOut();
        return authMessages[error];
      }
      signedOutReason = null;
      await syncEmployees();
      await changed();
      return null;
    } on AuthFailure catch (e) {
      return authMessages[e.error];
    }
  }

  Future<void> signOut() => _endSession(null);

  // ---------------------------------------------------------------------------
  // Employee information (saved to Supabase when a backend is connected)
  // ---------------------------------------------------------------------------

  /// Set when employee information couldn't be loaded from Supabase.
  String? syncError;

  /// Loads employee records, departments and positions from Supabase.
  /// Records are added or updated, never removed, because local requests and
  /// payslips still refer to them.
  Future<void> syncEmployees() async {
    final remote = backend;
    if (remote == null || session == null) return;
    try {
      final rows = await remote.employees();
      for (final row in rows) {
        final id = row['id'] as String;
        final local = employees.where((e) => e.id == id).firstOrNull;
        if (local == null) {
          employees.add(Employee.fromRow(row));
        } else {
          local.applyRow(row);
        }
      }
      if (canUseHr) {
        departments = await remote.departments();
        positions = await remote.positions();
      }
      await _syncShifts(remote);
      await _syncLeave(remote);
      syncError = null;
      await refreshDashboard();
    } on BackendFailure catch (e) {
      syncError = e.message;
    }
    notifyListeners();
  }

  /// How far back attendance history is loaded from Supabase.
  static const attendanceHistory = Duration(days: 120);

  /// Replaces local attendance with Supabase's: attendance lives there now.
  Future<void> _syncShifts(HrBackend remote) async {
    final rows = await remote.shifts(clock().subtract(attendanceHistory));
    shifts
      ..clear()
      ..addAll(rows.map(Shift.fromRow));
    _markMissedCheckOuts();
    final hours = await remote.workHours();
    workHours = hours == null ? null : WorkHours.fromRow(hours);
  }

  /// Check-in and check-out hours from Supabase, or null in demo mode.
  WorkHours? workHours;

  /// With Supabase, a shift still open from an earlier day can no longer be
  /// checked out, so it shows as a missed check-out.
  void _markMissedCheckOuts() {
    if (backend == null) return;
    final today = dayKey(clock());
    for (final shift in shifts) {
      if (shift.end == null && dayKey(shift.start) != today) {
        shift.missedCheckOut = true;
      }
    }
  }

  /// Reloads attendance, for example when HR opens the daily review.
  Future<void> refreshAttendance() async {
    final remote = backend;
    if (remote == null || session == null) return;
    try {
      await _syncShifts(remote);
      syncError = null;
    } on BackendFailure catch (e) {
      syncError = e.message;
    }
    notifyListeners();
  }

  void _putShift(Shift shift) {
    shifts.removeWhere(
      (s) =>
          (shift.id != null && s.id == shift.id) ||
          (s.employeeId == shift.employeeId &&
              dayKey(s.start) == dayKey(shift.start)),
    );
    shifts.add(shift);
  }

  /// Checks in with the device's live location. Supabase only accepts it at
  /// Rangsit University and records its own time. Returns an error message,
  /// or null on success. [onLocationProblem] receives location failures so
  /// the screen can offer the right fix.
  Future<String?> checkInHere({
    void Function(LocationFailure failure)? onLocationProblem,
  }) async {
    if (session == null || isHr) {
      return 'Switch to your employee view to check in.';
    }
    final remote = backend;
    if (remote == null) {
      try {
        checkIn();
        return null;
      } on StateError catch (e) {
        return e.message;
      }
    }
    if (openShift != null) return 'You’re already checked in.';
    final source = location;
    if (source == null) return 'Location isn’t available on this device.';
    final DeviceLocation here;
    try {
      here = await source.current();
    } on LocationFailure catch (failure) {
      onLocationProblem?.call(failure);
      return failure.message;
    }
    try {
      final row = await remote.checkIn(
        here.latitude,
        here.longitude,
        here.accuracy,
      );
      _putShift(Shift.fromRow(row));
    } on BackendFailure catch (e) {
      return e.message;
    }
    await changed();
    return null;
  }

  /// Checks out from any location. Supabase records its own time.
  Future<String?> checkOutNow() async {
    final remote = backend;
    if (remote == null) {
      try {
        checkOut();
        return null;
      } on StateError catch (e) {
        return e.message;
      }
    }
    if (openShift == null) return 'You’re not checked in.';
    try {
      _putShift(Shift.fromRow(await remote.checkOut()));
    } on BackendFailure catch (e) {
      return e.message;
    }
    await changed();
    return null;
  }

  /// Runs [save] against Supabase (if connected), then [apply] locally.
  /// Returns an error message, or null when it worked.
  Future<String?> _save(
    Future<void> Function(HrBackend remote) save,
    void Function() apply,
  ) async {
    final remote = backend;
    if (remote != null) {
      try {
        await save(remote);
      } on BackendFailure catch (e) {
        return e.message;
      }
    }
    apply();
    await changed();
    return null;
  }

  /// HR adds an employee ([existing] is null) or edits one.
  Future<String?> saveEmployee({
    Employee? existing,
    required String name,
    required String email,
    required String mobile,
    required String position,
    required String department,
  }) async {
    requireHr();
    final values = {
      'name': name.trim(),
      'email': email.trim().toLowerCase(),
      'mobile': mobile.trim(),
      'position': position,
      'department': department,
    };
    if (employees.any(
      (e) => e.id != existing?.id && e.email.toLowerCase() == values['email'],
    )) {
      return 'An employee already uses this work email.';
    }
    if (existing != null) {
      return _save(
        (remote) => remote.updateEmployee(existing.id, values),
        () => existing.applyRow(values),
      );
    }
    final remote = backend;
    if (remote == null) {
      final next =
          employees
              .map((e) => int.tryParse(e.id.substring(3)) ?? 0)
              .fold<int>(0, (a, b) => a > b ? a : b) +
          1;
      employees.add(
        Employee('DH-${next.toString().padLeft(3, '0')}', '', '', '', '', '')
          ..applyRow(values),
      );
      await changed();
      return null;
    }
    try {
      employees.add(Employee.fromRow(await remote.insertEmployee(values)));
    } on BackendFailure catch (e) {
      return e.message;
    }
    await changed();
    return null;
  }

  /// An employee updates their own contact details.
  Future<String?> saveContact(Employee e, String mobile, String personal) {
    requireOwner(e.id);
    final values = {'mobile': mobile.trim(), 'personal_email': personal.trim()};
    return _save(
      (remote) => remote.updateEmployee(e.id, values),
      () => e.applyRow(values),
    );
  }

  /// HR activates or deactivates an employee. HR can't change their own.
  Future<String?> setEmployeeActive(Employee e, bool active) {
    requireHr();
    if (e.id == ownEmployeeId) {
      return Future.value('You can’t change your own status.');
    }
    return _save(
      (remote) => remote.updateEmployee(e.id, {'active': active}),
      () => e.active = active,
    );
  }

  static const payColumns = [
    'base_salary',
    'overtime_rate',
    'insurance',
    'advance',
  ];

  /// HR changes one pay setting (index into [payColumns]). HR can't change
  /// their own pay.
  Future<String?> savePay(Employee e, int field, double value) {
    requireHr();
    if (e.id == ownEmployeeId) {
      return Future.value('You can’t change your own pay.');
    }
    if (value < 0) return Future.value('Enter an amount of 0 or more.');
    return _save(
      (remote) => remote.updateEmployee(e.id, {payColumns[field]: value}),
      () => e.applyRow({payColumns[field]: value}),
    );
  }

  Future<String?> addDepartment(String name) {
    requireHr();
    final value = name.trim();
    if (value.isEmpty) return Future.value('Enter a department name.');
    if (departments.any((d) => d.toLowerCase() == value.toLowerCase())) {
      return Future.value('This department already exists.');
    }
    return _save(
      (remote) => remote.addDepartment(value),
      () => departments = [...departments, value]..sort(),
    );
  }

  Future<String?> addPosition(String name) {
    requireHr();
    final value = name.trim();
    if (value.isEmpty) return Future.value('Enter a position name.');
    if (positions.any((p) => p.toLowerCase() == value.toLowerCase())) {
      return Future.value('This position already exists.');
    }
    return _save(
      (remote) => remote.addPosition(value),
      () => positions = [...positions, value]..sort(),
    );
  }

  /// HR creates a Supabase login with a temporary password.
  Future<String?> createLogin(Employee e, String password) async {
    requireHr();
    final remote = backend;
    if (remote == null) return 'Logins need a Supabase connection.';
    if (!e.active) return 'This employee is inactive.';
    if (password.length < 8) {
      return 'Use a temporary password of at least 8 characters.';
    }
    try {
      await remote.createLogin(e.id, password);
    } on BackendFailure catch (failure) {
      return failure.message;
    }
    e.hasLogin = true;
    await changed();
    return null;
  }

  // ---------------------------------------------------------------------------
  // Leave (saved to Supabase when a backend is connected)
  // ---------------------------------------------------------------------------

  /// Leave lives in Supabase; overtime requests stay on the device for now.
  Future<void> _syncLeave(HrBackend remote) async {
    final types = await remote.leaveTypes();
    if (types.isNotEmpty) leaveTypes = types.map(LeaveType.fromRow).toList();
    final rows = await remote.leaveRequests();
    requests
      ..removeWhere((r) => r.kind == 'Leave')
      ..addAll(rows.map(WorkRequest.fromRow));
    await _syncOvertime(remote);
    await _syncPayslips(remote);
  }

  /// Overtime Multiplier in: Hourly Rate × Overtime Multiplier × Hours.
  double overtimeMultiplier = 1.5;

  Future<void> _syncOvertime(HrBackend remote) async {
    overtimeMultiplier =
        await remote.overtimeMultiplier() ?? overtimeMultiplier;
    final rows = await remote.overtimeRequests();
    requests
      ..removeWhere((r) => r.kind == 'Overtime')
      ..addAll(rows.map(WorkRequest.fromRow));
  }

  /// Overtime pay for a request: fixed by Supabase once approved, otherwise
  /// estimated with the employee's hourly rate and the current multiplier.
  double overtimePay(WorkRequest r) =>
      r.overtimePay ??
      (employee(r.employeeId).rate * overtimeMultiplier * r.hours * 100)
              .round() /
          100;

  /// An employee saves overtime. Supabase calculates the hours.
  Future<({WorkRequest? request, String? error})> submitOvertime(
    DateTime start,
    DateTime end,
    String reason,
  ) async {
    final remote = backend;
    if (remote == null) {
      try {
        return (
          request: submit('Overtime', 'Overtime', start, end, reason),
          error: null,
        );
      } on StateError catch (e) {
        return (request: null, error: e.message);
      }
    }
    if (session == null || isHr) {
      return (request: null, error: 'Switch to your employee view first.');
    }
    try {
      final row = await remote.requestOvertime(start, end, reason);
      final request = WorkRequest.fromRow(row);
      requests.add(request);
      await changed();
      return (request: request, error: null);
    } on BackendFailure catch (e) {
      return (request: null, error: e.message);
    }
  }

  /// Reloads leave requests, for example when HR opens the review queue.
  Future<void> refreshLeave() async {
    final remote = backend;
    if (remote == null || session == null) return;
    try {
      await _syncLeave(remote);
      syncError = null;
    } on BackendFailure catch (e) {
      syncError = e.message;
    }
    notifyListeners();
  }

  /// An employee asks for leave. Returns the saved request, or an error.
  Future<({WorkRequest? request, String? error})> submitLeave(
    String typeName,
    DateTime start,
    DateTime end,
    String reason,
  ) async {
    final remote = backend;
    final LeaveType type;
    try {
      if (session == null || isHr) {
        throw StateError('Switch to your employee view to request leave.');
      }
      if (reason.trim().isEmpty) {
        throw StateError('Choose dates and enter a reason to submit.');
      }
      type = leaveType(typeName);
      // The same checks run in Supabase; checking here gives a quick answer.
      _checkLeave(session!, type, start, end);
      if (remote == null) {
        return (
          request: submit('Leave', typeName, start, end, reason),
          error: null,
        );
      }
    } on StateError catch (e) {
      return (request: null, error: e.message);
    }
    try {
      final row = await remote.requestLeave(type.code, start, end, reason);
      final request = WorkRequest.fromRow(row);
      requests.add(request);
      await changed();
      return (request: request, error: null);
    } on BackendFailure catch (e) {
      return (request: null, error: e.message);
    }
  }

  /// Approves, rejects or cancels a request. Leave goes through Supabase,
  /// which deducts the balance in the same step as the approval. Returns an
  /// error message, or null when it worked.
  Future<String?> decideRequest(WorkRequest r, String status) async {
    final remote = backend;
    if (remote == null) {
      try {
        decide(r, status);
        return null;
      } on StateError catch (e) {
        return e.message;
      }
    }
    final leave = r.kind == 'Leave';
    try {
      final row = status == 'Cancelled'
          ? await (leave
                ? remote.cancelLeave(r.id)
                : remote.cancelOvertime(r.id))
          : await (leave
                ? remote.decideLeave(r.id, status)
                : remote.decideOvertime(r.id, status));
      r.status = row['status'] as String;
      r.overtimePay = (row['overtime_pay'] as num?)?.toDouble();
      r.overtimeMultiplier = (row['multiplier'] as num?)?.toDouble();
    } on BackendFailure catch (e) {
      return e.message;
    }
    if (r.status != 'Cancelled') {
      notices.add(
        HrNotice(
          r.employeeId,
          '${r.kind} ${r.status.toLowerCase()} · ${dateLabel(r.start)}',
          'request',
          r.id,
        ),
      );
    }
    await changed();
    return null;
  }

  // ---------------------------------------------------------------------------
  // Dashboards (from Supabase when connected, otherwise worked out here)
  // ---------------------------------------------------------------------------

  HrSummary? _hrSummary;
  EmployeeSummary? _employeeSummary;

  /// Reloads the dashboard numbers for the open workspace.
  Future<void> refreshDashboard() async {
    final remote = backend;
    if (remote == null || session == null) return;
    try {
      if (isHr) {
        _hrSummary = HrSummary.fromRow(await remote.hrDashboard());
      } else {
        _employeeSummary = EmployeeSummary.fromRow(
          await remote.employeeDashboard(),
        );
      }
    } on BackendFailure {
      return; // Keep showing the numbers worked out from loaded records.
    }
    notifyListeners();
  }

  HrSummary hrSummary() {
    if (backend != null && _hrSummary != null) return _hrSummary!;
    final today = clock();
    final active = employees.where((e) => e.active).map((e) => e.id).toSet();
    final todays = shifts.where(
      (s) => active.contains(s.employeeId) && dayKey(s.start) == dayKey(today),
    );
    final checkedIn = todays.map((s) => s.employeeId).toSet();
    final onLeave = requests
        .where(
          (r) =>
              r.kind == 'Leave' &&
              r.status == 'Approved' &&
              active.contains(r.employeeId) &&
              !checkedIn.contains(r.employeeId) &&
              !dayOnly(today).isBefore(dayOnly(r.start)) &&
              !dayOnly(today).isAfter(dayOnly(r.end)),
        )
        .map((r) => r.employeeId)
        .toSet();
    final weekday = today.weekday <= 5;
    return HrSummary(
      employees: active.length,
      checkedIn: checkedIn.length,
      workingNow: todays
          .where((s) => s.end == null && !s.missedCheckOut)
          .length,
      onLeave: onLeave.length,
      notCheckedIn: weekday
          ? (active.length - checkedIn.length - onLeave.length).clamp(
              0,
              1 << 30,
            )
          : 0,
      missedCheckOuts: todays.where((s) => s.missedCheckOut).length,
      hoursWorked: todays
          .where((s) => s.end != null)
          .fold<double>(0, (n, s) => n + s.hours(today)),
      pendingLeave: requests
          .where((r) => r.kind == 'Leave' && r.status == 'Pending')
          .length,
      pendingOvertime: requests
          .where((r) => r.kind == 'Overtime' && r.status == 'Pending')
          .length,
    );
  }

  EmployeeSummary employeeSummary() {
    if (backend != null && _employeeSummary != null) return _employeeSummary!;
    final now = clock();
    final id = session!;
    final shift = openShift ?? shiftFor(id, now);
    final mine = shifts.where(
      (s) =>
          s.employeeId == id &&
          s.start.year == now.year &&
          s.start.month == now.month,
    );
    String? latest(String kind) => requests
        .where((r) => r.employeeId == id && r.kind == kind)
        .lastOrNull
        ?.status;
    return EmployeeSummary(
      state: shift == null
          ? 'Ready to check in'
          : shift.end == null
          ? 'Working'
          : 'Shift complete',
      hoursToday: shift == null ? 0 : shift.hours(now),
      hoursThisMonth: mine
          .where((s) => s.end != null)
          .fold<double>(0, (n, s) => n + s.hours(now)),
      daysWorkedThisMonth: mine.length,
      pendingRequests: requests
          .where((r) => r.employeeId == id && r.status == 'Pending')
          .length,
      latestLeaveStatus: latest('Leave'),
      latestOvertimeStatus: latest('Overtime'),
    );
  }

  /// HR administrators can't approve or reject their own requests.
  bool isOwnRequest(WorkRequest r) =>
      ownEmployeeId != null && r.employeeId == ownEmployeeId;

  void requireHr() {
    if (!isHr) throw StateError('HR access required.');
  }

  void requireOwner(String id) {
    if (session != id && !isHr) throw StateError('Access denied.');
  }

  List<WorkRequest> visibleRequests(String kind) => requests
      .where((r) => r.kind == kind && (isHr || r.employeeId == session))
      .toList()
      .reversed
      .toList();
  Shift? shiftFor(String id, DateTime day) => shifts
      .where((s) => s.employeeId == id && dayKey(s.start) == dayKey(day))
      .firstOrNull;
  Shift? get openShift {
    _markMissedCheckOuts();
    return shifts
        .where(
          (s) => s.employeeId == session && s.end == null && !s.missedCheckOut,
        )
        .firstOrNull;
  }

  void checkIn() {
    if (session == null || isHr) throw StateError('Employee access required.');
    if (openShift != null || shiftFor(session!, clock()) != null) {
      throw StateError('A shift already exists for this workday.');
    }
    shifts.add(Shift(session!, clock()));
    changed();
  }

  void checkOut() {
    final shift = openShift;
    if (shift == null) throw StateError('No open shift.');
    shift.end = clock();
    changed();
  }

  /// Leave types employees can request.
  List<LeaveType> leaveTypes = LeaveType.defaults;

  LeaveType leaveType(String name) => leaveTypes.firstWhere(
    (t) => t.name == name,
    orElse: () => throw StateError('Choose a leave type.'),
  );

  /// Approved (and optionally pending) days of [type] in the period that
  /// [on] falls in.
  double leaveTaken(
    String id,
    LeaveType type,
    DateTime on, {
    bool includePending = false,
  }) => requests
      .where(
        (r) =>
            r.employeeId == id &&
            r.kind == 'Leave' &&
            r.type == type.name &&
            (r.status == 'Approved' ||
                (includePending && r.status == 'Pending')) &&
            type.samePeriod(r.start, on),
      )
      .fold<double>(0, (n, r) => n + r.days);

  /// Days of [type] left in the period that [on] falls in, or null for leave
  /// without an allowance. Pending requests are subtracted when
  /// [includePending] is true.
  double? leaveLeft(
    String id,
    LeaveType type,
    DateTime on, {
    bool includePending = false,
  }) {
    final allowance = type.allowance;
    if (allowance == null) return null;
    return allowance - leaveTaken(id, type, on, includePending: includePending);
  }

  /// The first leave type with days still left, which must be used before
  /// [type] can be taken; null when [type] may be used.
  ({LeaveType type, double left})? _unusedLeave(
    String id,
    LeaveType type,
    DateTime on, {
    required bool includePending,
  }) {
    if (!type.needsOtherLeaveUsed) return null;
    for (final other in leaveTypes) {
      final left = leaveLeft(id, other, on, includePending: includePending);
      if (left != null && left > 0) return (type: other, left: left);
    }
    return null;
  }

  /// Checks a new leave request against the same rules as Supabase.
  void _checkLeave(String id, LeaveType type, DateTime start, DateTime end) {
    if (!type.samePeriod(start, end)) {
      throw StateError(
        '${type.name} must start and end in the same '
        '${type.resets == 'month' ? 'month' : 'year'}.',
      );
    }
    final days = workingDays(start, end);
    if (days == 0) {
      throw StateError('Choose at least one working day (Monday to Friday).');
    }
    if (requests.any(
      (r) =>
          r.employeeId == id &&
          r.kind == 'Leave' &&
          (r.status == 'Pending' || r.status == 'Approved') &&
          !dayOnly(r.start).isAfter(dayOnly(end)) &&
          !dayOnly(r.end).isBefore(dayOnly(start)),
    )) {
      throw StateError('You already have leave on some of these dates.');
    }
    final left = leaveLeft(id, type, start, includePending: true);
    if (left != null && left < days) {
      throw StateError(
        'You have ${daysLabel(left)} of ${type.name} left for this period.',
      );
    }
    final unused = _unusedLeave(id, type, start, includePending: true);
    if (unused != null) {
      throw StateError(
        'Use your ${unused.type.name} first. '
        'You have ${daysLabel(unused.left)} left.',
      );
    }
  }

  WorkRequest submit(
    String kind,
    String type,
    DateTime start,
    DateTime end,
    String reason,
  ) {
    if (session == null || isHr) throw StateError('Employee access required.');
    if (reason.trim().isEmpty ||
        end.isBefore(start) ||
        (kind == 'Overtime' && !end.isAfter(start))) {
      throw StateError('Enter valid dates, times and a reason.');
    }
    final leave = kind == 'Leave' ? leaveType(type) : null;
    if (leave != null) _checkLeave(session!, leave, start, end);
    final r = WorkRequest(
      'request-${DateTime.now().microsecondsSinceEpoch}-${requests.length}',
      session!,
      kind,
      type,
      start,
      end,
      reason.trim(),
      unpaid: leave != null && !leave.paid,
    );
    requests.add(r);
    changed();
    return r;
  }

  void decide(WorkRequest r, String status) {
    if (r.status != 'Pending') {
      throw StateError('This request has already been resolved.');
    }
    if (status == 'Cancelled') {
      if (isHr || session != r.employeeId) {
        throw StateError('Only the owner can cancel.');
      }
    } else {
      requireHr();
      if (!['Approved', 'Rejected'].contains(status)) {
        throw StateError('Invalid decision.');
      }
      if (isOwnRequest(r)) {
        throw StateError('Another HR administrator must decide this request.');
      }
    }
    if (status == 'Approved' && r.kind == 'Leave') {
      final type = leaveType(r.type);
      final left = leaveLeft(r.employeeId, type, r.start);
      if (left != null && left < r.days) {
        throw StateError(
          'Not enough ${type.name} left to approve this request.',
        );
      }
      final unused = _unusedLeave(
        r.employeeId,
        type,
        r.start,
        includePending: false,
      );
      if (unused != null) {
        throw StateError(
          'The employee still has ${daysLabel(unused.left)} of '
          '${unused.type.name}. Partial Leave needs it used first.',
        );
      }
    }
    r.status = status;
    if (status != 'Cancelled') {
      notices.add(
        HrNotice(
          r.employeeId,
          '${r.kind} ${status.toLowerCase()} · ${dateLabel(r.start)}',
          'request',
          r.id,
        ),
      );
    }
    changed();
  }

  List<WorkRequest> approvedEntries(String id, String month) => requests
      .where(
        (r) =>
            r.employeeId == id &&
            r.kind == 'Overtime' &&
            r.status == 'Approved' &&
            monthKey(r.start) == month,
      )
      .toList();

  /// Deduct working days with no check-in and no approved leave. Off in
  /// demo mode (the sample data has no attendance); Supabase sets it.
  bool deductAbsences = false;

  /// Days before this never count as absences.
  DateTime? absencesFrom;

  /// The same calculation Supabase runs in `payroll_calculation`.
  Payslip calculate(String id, String month) {
    requireHr();
    final e = employee(id);
    final first = DateTime.parse('$month-01');
    final last = DateTime(first.year, first.month + 1, 0);
    final entries = approvedEntries(id, month);
    final fixed = entries.any((r) => r.overtimePay != null)
        ? _round2(
            entries.fold<double>(
              0,
              (n, r) =>
                  n + (r.overtimePay ?? r.hours * e.rate * overtimeMultiplier),
            ),
          )
        : null;
    final leave = requests.where(
      (r) =>
          r.employeeId == id &&
          r.kind == 'Leave' &&
          r.status == 'Approved' &&
          !dayOnly(r.start).isAfter(last) &&
          !dayOnly(r.end).isBefore(first),
    );
    final unpaidDays = leave
        .where((r) => r.unpaid)
        .fold<int>(
          0,
          (n, r) =>
              n +
              workingDays(
                dayOnly(r.start).isBefore(first) ? first : dayOnly(r.start),
                dayOnly(r.end).isAfter(last) ? last : dayOnly(r.end),
              ),
        );
    var absent = 0;
    if (deductAbsences) {
      var day = first;
      final from = absencesFrom;
      if (from != null && dayOnly(from).isAfter(day)) day = dayOnly(from);
      final yesterday = dayOnly(clock()).subtract(const Duration(days: 1));
      final end = yesterday.isBefore(last) ? yesterday : last;
      for (; !day.isAfter(end); day = day.add(const Duration(days: 1))) {
        if (day.weekday > 5) continue;
        final d = day;
        if (shiftFor(id, d) != null) continue;
        if (leave.any(
          (r) => !d.isBefore(dayOnly(r.start)) && !d.isAfter(dayOnly(r.end)),
        )) {
          continue;
        }
        absent++;
      }
    }
    return Payslip(
      id,
      month,
      e.base,
      e.rate,
      entries.fold<double>(0, (n, r) => n + r.hours),
      e.insurance,
      e.advance,
      entries.map((r) => r.id).toList(),
      multiplier: overtimeMultiplier,
      fixedOvertimePay: fixed,
      workingDays: workingDays(first, last),
      unpaidLeaveDays: unpaidDays.toDouble(),
      absentDays: absent,
    );
  }

  /// HR prepares a draft. With Supabase, it calculates and saves the draft
  /// and its line items. Returns the draft, or an error message.
  Future<({Payslip? payslip, String? error})> preparePayslip(
    String id,
    String month,
  ) async {
    final remote = backend;
    if (remote == null) {
      try {
        final draft = calculate(id, month);
        saveDraft(draft);
        return (payslip: draft, error: null);
      } on StateError catch (e) {
        return (payslip: null, error: e.message);
      }
    }
    if (id == ownEmployeeId) {
      return (
        payslip: null,
        error: 'Another HR administrator must prepare your payslip.',
      );
    }
    try {
      final draft = Payslip.fromRow(await remote.preparePayslip(id, month));
      payslips.removeWhere((p) => p.id == draft.id);
      payslips.add(draft);
      await changed();
      return (payslip: draft, error: null);
    } on BackendFailure catch (e) {
      return (payslip: null, error: e.message);
    }
  }

  /// HR publishes a checked draft. Supabase recalculates and refuses if
  /// anything changed since the draft. Returns an error message, or null.
  Future<String?> publishPayslip(Payslip draft) async {
    final remote = backend;
    if (remote == null) {
      try {
        publish(draft);
        return null;
      } on StateError catch (e) {
        return e.message;
      }
    }
    try {
      final saved = Payslip.fromRow(
        await remote.publishPayslip(draft.employeeId, draft.month),
      );
      draft.published = true;
      payslips.removeWhere((p) => p.id == saved.id);
      payslips.add(saved);
    } on BackendFailure catch (e) {
      return e.message;
    }
    notices.add(
      HrNotice(
        draft.employeeId,
        'Payslip published · ${monthLabel(DateTime.parse('${draft.month}-01'))}',
        'payslip',
        draft.id,
      ),
    );
    await changed();
    return null;
  }

  /// Payslips live in Supabase: all for HR, own published ones for employees.
  Future<void> _syncPayslips(HrBackend remote) async {
    final settings = await remote.payrollSettings();
    if (settings != null) {
      deductAbsences = settings['deduct_absences'] as bool? ?? true;
      final from = settings['absences_from'] as String?;
      absencesFrom = from == null ? null : DateTime.parse(from);
    }
    final rows = await remote.payslips();
    payslips
      ..clear()
      ..addAll(rows.map(Payslip.fromRow));
  }

  /// Stores the reviewed draft so the monthly register can show `Draft`.
  void saveDraft(Payslip draft) {
    requireHr();
    if (payslips.any((p) => p.id == draft.id && p.published)) {
      throw StateError('This payslip is already published.');
    }
    payslips.removeWhere((p) => p.id == draft.id);
    payslips.add(draft);
    changed();
  }

  /// Register status for one employee and pay period, as shown in Figma.
  String payrollStatus(Employee e, String month) {
    final slip = payslips
        .where((p) => p.employeeId == e.id && p.month == month)
        .firstOrNull;
    if (slip != null) return slip.published ? 'Published' : 'Draft';
    return e.active ? 'Not prepared' : 'Inactive';
  }

  void publish(Payslip draft) {
    requireHr();
    if (payslips.any((p) => p.id == draft.id && p.published)) {
      throw StateError('This payslip is already published.');
    }
    final current = calculate(draft.employeeId, draft.month);
    if (jsonEncode(current.toJson()) != jsonEncode(draft.toJson())) {
      throw StateError('Payroll changed. Calculate and review again.');
    }
    if (draft.net < 0) {
      throw StateError('Deductions cannot exceed total earnings.');
    }
    draft.published = true;
    payslips.removeWhere((p) => p.id == draft.id);
    payslips.add(draft);
    notices.add(
      HrNotice(
        draft.employeeId,
        'Payslip published · ${monthLabel(DateTime.parse('${draft.month}-01'))}',
        'payslip',
        draft.id,
      ),
    );
    changed();
  }

  List<Payslip> visiblePayslips() => payslips
      .where((p) => isHr || (p.employeeId == session && p.published))
      .toList();
}

String durationLabel(double hours) {
  final minutes = (hours * 60).round();
  return '${minutes ~/ 60}h ${(minutes % 60).toString().padLeft(2, '0')}m';
}

String fullDateLabel(DateTime d) =>
    '${['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'][d.weekday - 1]}, ${dateLabel(d)}';

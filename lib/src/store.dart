import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  });
  final String id;
  String name, email, mobile, position, department, personalEmail;
  bool active;
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
  };
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
  );
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
  });
  final String id, employeeId, kind, type, reason;
  final DateTime start, end;
  String status;
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
  };
  factory WorkRequest.fromJson(Map<String, dynamic> j) => WorkRequest(
    j['id'],
    j['employeeId'],
    j['kind'],
    j['type'],
    DateTime.parse(j['start']),
    DateTime.parse(j['end']),
    j['reason'],
    status: j['status'],
  );
}

class Shift {
  Shift(this.employeeId, this.start, {this.end});
  final String employeeId;
  final DateTime start;
  DateTime? end;
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
  });
  final String employeeId, month;
  final double base, rate, hours, insurance, advance;
  final List<String> entryIds;
  bool published;
  double get overtime => (hours * rate * 100).round() / 100;
  double get net =>
      (100 * (base + overtime - insurance - advance)).round() / 100;
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
  };
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
class HrStore extends ChangeNotifier {
  ValueChanged<int>? navigateWorkspace;
  HrStore({this.preferences, DateTime Function()? clock})
    : clock = clock ?? bangkokNow {
    _seed();
  }
  final SharedPreferences? preferences;
  final DateTime Function() clock;
  final List<Employee> employees = [];
  final List<WorkRequest> requests = [];
  final List<Shift> shifts = [];
  final List<Payslip> payslips = [];
  final List<HrNotice> notices = [];
  String? session;
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
        'Annual leave',
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

  static Future<HrStore> load() async {
    final prefs = await SharedPreferences.getInstance();
    final s = HrStore(preferences: prefs);
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
        final savedSession = j['session'] as String?;
        if (savedSession == 'hr' ||
            people.any((e) => e.id == savedSession && e.active)) {
          s.session = savedSession;
        }
      } catch (_) {
        s.persistenceError =
            'Saved demo data could not be read. Using sample records.';
      }
    }
    return s;
  }

  Future<void> changed() {
    final snapshot = jsonEncode({
      'session': session,
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

  String? signIn(String email, String password, bool hr) {
    if (offline) {
      return 'ⓘ  Couldn’t connect. Check your internet connection and try again.';
    }
    if (password != 'DailyHR123!' && password != 'DemoPass42') {
      return 'ⓘ  The email or password is incorrect. Try again.';
    }
    if (email == 'unassigned@dailyhr.example') {
      return 'ⓘ  Your account needs a role before you can continue. Contact HR.';
    }
    if (hr &&
        (email == 'hr@dailyhr.example' || email == 'arun@dailyhr.example')) {
      session = 'hr';
      changed();
      return null;
    }
    final matches = employees.where(
      (e) => e.email.toLowerCase() == email.toLowerCase() && e.active,
    );
    if (!hr && matches.isNotEmpty) {
      session = matches.first.id;
      changed();
      return null;
    }
    return 'ⓘ  The email or password is incorrect. Try again.';
  }

  Future<void> signOut() {
    session = null;
    return changed();
  }

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
  Shift? get openShift =>
      shifts.where((s) => s.employeeId == session && s.end == null).firstOrNull;
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

  int balance(String id, String type, int year) {
    final allowance = type == 'Annual leave'
        ? 10
        : type == 'Sick leave'
        ? 6
        : 6;
    return allowance -
        requests
            .where(
              (r) =>
                  r.employeeId == id &&
                  r.type == type &&
                  r.status == 'Approved',
            )
            .fold<int>(0, (n, r) {
              final start = r.start.isBefore(DateTime(year))
                  ? DateTime(year)
                  : r.start;
              final end = r.end.isAfter(DateTime(year, 12, 31))
                  ? DateTime(year, 12, 31)
                  : r.end;
              return n + workingDays(start, end);
            });
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
    if (kind == 'Leave' && workingDays(start, end) == 0) {
      throw StateError('Select at least one working day.');
    }
    final r = WorkRequest(
      'request-${DateTime.now().microsecondsSinceEpoch}-${requests.length}',
      session!,
      kind,
      type,
      start,
      end,
      reason.trim(),
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
    }
    if (status == 'Approved' && r.kind == 'Leave') {
      for (var year = r.start.year; year <= r.end.year; year++) {
        final start = r.start.isBefore(DateTime(year))
            ? DateTime(year)
            : r.start;
        final end = r.end.isAfter(DateTime(year, 12, 31))
            ? DateTime(year, 12, 31)
            : r.end;
        if (workingDays(start, end) > balance(r.employeeId, r.type, year)) {
          throw StateError('Insufficient leave balance.');
        }
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
  Payslip calculate(String id, String month) {
    requireHr();
    final e = employee(id);
    final entries = approvedEntries(id, month);
    return Payslip(
      id,
      month,
      e.base,
      e.rate,
      entries.fold<double>(0, (n, r) => n + r.hours),
      e.insurance,
      e.advance,
      entries.map((r) => r.id).toList(),
    );
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

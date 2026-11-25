import 'dart:async';

import 'package:flutter/material.dart';

import 'store.dart';
import 'ui.dart';

class AttendanceBody extends StatefulWidget {
  const AttendanceBody({
    super.key,
    required this.store,
    required this.onCalendar,
  });
  final HrStore store;
  final VoidCallback onCalendar;
  @override
  State<AttendanceBody> createState() => _AttendanceBodyState();
}

class _AttendanceBodyState extends State<AttendanceBody> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.store, now = s.clock();
    final shift = s.openShift ?? s.shiftFor(s.session!, now);
    return ScreenBody(
      children: [
        WorkspaceBack(store: s, label: 'Home', tab: 0),
        const Heading('My attendance', size: 32),
        const SizedBox(height: 12),
        Text(fullDateLabel(shift?.start ?? now)),
        const SizedBox(height: 36),
        Surface(
          color: forest,
          padding: 22,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shift == null
                          ? 'Ready to check in'
                          : shift.end == null
                          ? 'Checked in'
                          : 'Shift complete',
                      style: const TextStyle(color: cream, fontSize: 17),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      shift == null
                          ? timeLabel(now)
                          : shift.end == null
                          ? timeLabel(shift.start)
                          : durationLabel(shift.hours(now)),
                      style: const TextStyle(
                        color: cream,
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      shift == null
                          ? 'Current time · Bangkok'
                          : shift.end == null
                          ? 'Check-in time · Bangkok'
                          : 'Total working time',
                      style: const TextStyle(color: mist, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const AssetIcon('d6db0', size: 72),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const SectionHeading('Daily record', 'clock'),
        const SizedBox(height: 16),
        ShiftSummary(shift: shift, now: now),
        const SizedBox(height: 30),
        if (shift == null)
          ActionButton(
            'Check in',
            () => openPage(context, LocationPage(store: s)),
          )
        else if (shift.end == null)
          ActionButton('Check out', () async {
            if (await openPage<bool>(
                  context,
                  DecisionPage(
                    store: s,
                    title: 'Check out?',
                    back: 'Attendance',
                    heading: 'Your shift today',
                    details: '${timeLabel(shift.start)} – ${timeLabel(now)}',
                    message: 'Working time: ${durationLabel(shift.hours(now))}',
                    action: 'Confirm check-out',
                    cancel: 'Keep working',
                  ),
                ) ==
                true) {
              if (context.mounted) guarded(context, s.checkOut);
            }
          }),
        ActionButton(
          'Attendance calendar ›',
          widget.onCalendar,
          secondary: true,
        ),
      ],
    );
  }
}

class ShiftSummary extends StatelessWidget {
  const ShiftSummary({
    super.key,
    required this.shift,
    required this.now,
    this.compact = false,
  });
  final Shift? shift;
  final DateTime now;
  final bool compact;
  @override
  Widget build(BuildContext context) {
    final row = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in [
          (compact ? 'In' : 'Check-in', timeLabel(shift?.start)),
          (compact ? 'Out' : 'Check-out', timeLabel(shift?.end)),
          (
            compact ? 'Hours' : 'Working hours',
            shift == null
                ? '—'
                : shift!.end == null
                ? 'In progress'
                : durationLabel(shift!.hours(now)),
          ),
        ])
          Expanded(
            child: Column(
              crossAxisAlignment: compact
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Text(
                  entry.$1,
                  textAlign: compact ? TextAlign.left : TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: forest),
                ),
                SizedBox(height: compact ? 8 : 16),
                Text(
                  entry.$2,
                  textAlign: compact ? TextAlign.left : TextAlign.center,
                  style: TextStyle(
                    fontSize: compact ? 16 : 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
    return compact ? row : Surface(child: row);
  }
}

class LocationPage extends StatefulWidget {
  const LocationPage({super.key, required this.store});
  final HrStore store;
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  bool unavailable = false;
  @override
  Widget build(BuildContext context) => HrPage(
    store: widget.store,
    title: unavailable ? 'Location unavailable' : 'Check-in location',
    back: 'Attendance',
    builder: (context) => [
      const SizedBox(height: 24),
      if (unavailable)
        const Text(
          'Location access is needed for GPS check-in. Allow access and try again.',
          style: TextStyle(fontSize: 16, height: 1.5),
        )
      else
        Surface(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading(
                unavailable ? 'Location is unavailable' : 'Bangkok office',
                size: 24,
              ),
              const SizedBox(height: 20),
              Text(
                unavailable
                    ? 'Location access is needed for GPS check-in. Allow access and try again.'
                    : 'Record your current location with today’s check-in.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Demo location: no device GPS is collected.',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      const SizedBox(height: 44),
      ActionButton(unavailable ? 'Try again' : 'Use location and check in', () {
        if (unavailable) {
          setState(() => unavailable = false);
        } else {
          guarded(context, () {
            widget.store.checkIn();
            Navigator.pop(context);
          });
        }
      }),
      ActionButton(
        unavailable ? 'Back to attendance' : 'Skip location access',
        () {
          if (unavailable) {
            Navigator.pop(context);
          } else {
            setState(() => unavailable = true);
          }
        },
        secondary: true,
      ),
    ],
  );
}

class CalendarBody extends StatefulWidget {
  const CalendarBody({super.key, required this.store});
  final HrStore store;
  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  late DateTime selected = dayOnly(widget.store.clock());
  @override
  Widget build(BuildContext context) => ScreenBody(
    children: [
      WorkspaceBack(store: widget.store, label: 'Attendance', tab: 1),
      const Heading('Attendance history', size: 30),
      const SizedBox(height: 22),
      MonthGrid(
        store: widget.store,
        selected: selected,
        onChanged: (v) => setState(() => selected = v),
      ),
      const SizedBox(height: 24),
      Heading(
        fullDateLabel(selected).replaceFirst(' ${selected.year}', ''),
        size: 22,
      ),
      const SizedBox(height: 12),
      Text(
        switch (attendanceStatus(widget.store, widget.store.me, selected)) {
          'Absent' => 'No check-in',
          final v => v,
        },
        style: const TextStyle(color: forest, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 22),
      ShiftSummary(
        shift: widget.store.shiftFor(widget.store.session!, selected),
        now: widget.store.clock(),
      ),
    ],
  );
}

class MonthGrid extends StatefulWidget {
  const MonthGrid({
    super.key,
    required this.store,
    required this.selected,
    required this.onChanged,
  });
  final HrStore store;
  final DateTime selected;
  final ValueChanged<DateTime> onChanged;
  @override
  State<MonthGrid> createState() => _MonthGridState();
}

class _MonthGridState extends State<MonthGrid> {
  late DateTime month = DateTime(widget.selected.year, widget.selected.month);
  @override
  Widget build(BuildContext context) {
    final offset = month.weekday - 1,
        count = DateTime(month.year, month.month + 1, 0).day;
    final rows = ((offset + count) / 7).ceil();
    return Surface(
      padding: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(monthLabel(month), size: 18),
          const SizedBox(height: 16),
          Row(
            children: [
              for (final name in ['M', 'T', 'W', 'T', 'F', 'S', 'S'])
                Expanded(
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        color: forest,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          for (var row = 0; row < rows; row++)
            Row(
              children: [
                for (var col = 0; col < 7; col++)
                  Expanded(child: cell(row * 7 + col - offset + 1, count)),
              ],
            ),
        ],
      ),
    );
  }

  Widget cell(int day, int count) {
    if (day < 1 || day > count) return const SizedBox(height: 36);
    final date = DateTime(month.year, month.month, day),
        selected =
            dayKey(widget.selected) ==
            dayKey(DateTime(month.year, month.month, day));
    final recorded = widget.store.shiftFor(widget.store.session!, date) != null;
    return Semantics(
      label: dateLabel(date),
      selected: selected,
      button: true,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Material(
          color: selected
              ? forest
              : recorded
              ? mist
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => widget.onChanged(date),
            child: SizedBox(
              height: 32,
              child: Center(
                child: Text(
                  '$day',
                  style: TextStyle(
                    color: selected ? Colors.white : charcoal,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AttendanceReviewBody extends StatefulWidget {
  const AttendanceReviewBody({super.key, required this.store});
  final HrStore store;
  @override
  State<AttendanceReviewBody> createState() => _AttendanceReviewBodyState();
}

class _AttendanceReviewBodyState extends State<AttendanceReviewBody> {
  late DateTime selected = dayOnly(widget.store.clock());
  @override
  Widget build(BuildContext context) => ScreenBody(
    children: [
      WorkspaceBack(store: widget.store, label: 'HR overview', tab: 0),
      const Heading('Daily attendance'),
      const SizedBox(height: 24),
      Heading(monthLabel(selected), size: 17),
      const SizedBox(height: 16),
      Row(
        children: [
          for (var i = 2; i >= 0; i--) ...[
            if (i < 2) const SizedBox(width: 9),
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor:
                      dayKey(selected) ==
                          dayKey(
                            dayOnly(widget.store.clock())
                                .subtract(Duration(days: i)),
                          )
                      ? forest
                      : mist,
                  foregroundColor:
                      dayKey(selected) ==
                          dayKey(
                            dayOnly(widget.store.clock())
                                .subtract(Duration(days: i)),
                          )
                      ? Colors.white
                      : forest,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: () => setState(
                  () =>
                      selected = dayOnly(widget.store.clock())
                          .subtract(Duration(days: i)),
                ),
                child: Text(
                  shortDay(
                    dayOnly(widget.store.clock()).subtract(Duration(days: i)),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
      const SizedBox(height: 38),
      const SectionHeading('Attendance by employee', 'team'),
      const SizedBox(height: 22),
      for (final e in widget.store.employees) ...[
        Surface(
          onTap: () => openPage(
            context,
            HrPage(
              store: widget.store,
              title: 'Attendance record',
              back: 'Daily review',
              builder: (_) => [
                Surface(
                  color: sage,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Heading(e.name, size: 22),
                      const SizedBox(height: 10),
                      Text('${e.id} · ${e.department}'),
                      const SizedBox(height: 14),
                      Text(status(e)),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Heading(
                  fullDateLabel(selected).replaceFirst(' ${selected.year}', ''),
                  size: 18,
                ),
                const SizedBox(height: 20),
                ShiftSummary(
                  shift: widget.store.shiftFor(e.id, selected),
                  now: widget.store.clock(),
                ),
                const SizedBox(height: 28),
                const Text('Times shown in Bangkok local time.'),
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Heading(e.name, size: 18)),
                  Text(
                    '${status(e)}  ›',
                    style: const TextStyle(color: forest, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              ShiftSummary(
                shift: widget.store.shiftFor(e.id, selected),
                now: widget.store.clock(),
                compact: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    ],
  );
  String status(Employee e) => attendanceStatus(widget.store, e, selected);
}

String shortDay(DateTime d) =>
    '${['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][d.weekday - 1]} ${d.day}';

String attendanceStatus(HrStore store, Employee employee, DateTime date) {
  final shift = store.shiftFor(employee.id, date);
  if (shift == null) {
    final onLeave = store.requests.any(
      (r) =>
          r.employeeId == employee.id &&
          r.kind == 'Leave' &&
          r.status == 'Approved' &&
          !dayOnly(date).isBefore(dayOnly(r.start)) &&
          !dayOnly(date).isAfter(dayOnly(r.end)),
    );
    return onLeave ? 'On leave' : 'Absent';
  }
  if (shift.end == null) return 'Checked in';
  return shift.start.hour > 9 ||
          (shift.start.hour == 9 && shift.start.minute > 0)
      ? 'Late'
      : 'Present';
}

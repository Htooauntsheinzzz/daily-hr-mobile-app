import 'package:flutter/material.dart';

import 'store.dart';
import 'ui.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key, required this.store, required this.kind});
  final HrStore store;
  final String kind;
  bool get leave => kind == 'Leave';

  Widget tile(BuildContext context, WorkRequest r) => EntryTile(
    leave
        ? '${r.type} · ${dayMonthLabel(r.start)}'
        : '${store.isHr ? '${store.employee(r.employeeId).name} · ' : ''}${hoursLabel(r.hours)} · ${dayMonthLabel(r.start)}',
    r.status,
    icon: leave ? 'calendar' : 'clock',
    onTap: () => openPage(context, RequestDetail(store: store, request: r)),
  );

  Widget summary(String label, String value, {double size = 36}) => Surface(
    color: forest,
    padding: 20,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: mist,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: size,
            color: cream,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) => HrPage(
    store: store,
    title: store.isHr
        ? (leave ? 'Leave requests' : 'Overtime requests')
        : leave
        ? 'My leave'
        : 'My overtime',
    back: store.isHr ? 'HR overview' : 'Home',
    navigation: true,
    builder: (context) {
      final list = store.visibleRequests(kind);
      final ordered = [
        ...list.where((r) => r.status == 'Pending'),
        ...list.where((r) => r.status != 'Pending'),
      ];
      if (store.isHr) {
        final pending = list.where((r) => r.status == 'Pending').length;
        return [
          if (!leave) ...[
            summary(
              'Review queue',
              pending == 0 ? 'No pending overtime' : '$pending pending',
              size: 25,
            ),
            const SizedBox(height: 36),
            const Heading('Employee requests', size: 20),
            const SizedBox(height: 24),
            if (list.isEmpty) const Text('No overtime requests submitted yet.'),
            for (final r in ordered) tile(context, r),
          ] else ...[
            if (list.isEmpty) const Text('No leave requests to review.'),
            for (final e in store.employees)
              if (ordered.any((r) => r.employeeId == e.id)) ...[
                Text(
                  e.name,
                  style: const TextStyle(
                    color: forest,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(e.department, style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 22),
                for (final r in ordered.where((r) => r.employeeId == e.id))
                  tile(context, r),
                const SizedBox(height: 16),
              ],
          ],
        ];
      }
      return [
        if (!leave) ...[
          summary(
            'Approved hours · ${monthNames[store.clock().month - 1]}',
            hoursLabel(
              store
                  .approvedEntries(store.session!, monthKey(store.clock()))
                  .fold<double>(0, (n, r) => n + r.hours),
            ),
          ),
          const SizedBox(height: 32),
        ],
        if (leave) ...[
          const Text(
            'Available balances',
            style: TextStyle(
              color: forest,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              for (final (i, type)
                  in store.leaveTypes
                      .where((t) => t.allowance != null)
                      .take(2)
                      .indexed) ...[
                if (i > 0) const SizedBox(width: 12),
                Expanded(
                  child: Surface(
                    color: mist,
                    padding: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                type.name,
                                style: const TextStyle(
                                  color: forest,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            AssetIcon(i == 0 ? 'calendar' : 'heart'),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Heading(
                          daysLabel(
                            store.leaveLeft(
                              store.session!,
                              type,
                              store.clock(),
                              includePending: true,
                            )!,
                          ),
                          size: 28,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'left of ${daysLabel(type.allowance!)} · resets '
                          '${type.resets == 'month' ? 'monthly' : '1 January'}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        if (store.leaveTaken(
                                  store.session!,
                                  type,
                                  store.clock(),
                                  includePending: true,
                                ) -
                                store.leaveTaken(
                                  store.session!,
                                  type,
                                  store.clock(),
                                )
                            case final pending when pending > 0)
                          Text(
                            '${daysLabel(pending)} waiting for approval',
                            style: const TextStyle(fontSize: 12),
                          ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
          if (store.leaveTypes.where((t) => !t.paid).firstOrNull
              case final unpaid?) ...[
            const SizedBox(height: 14),
            Text(
              '${unpaid.name} is unpaid and opens once your other leave '
              'is used up. Its days are deducted from salary.',
              style: const TextStyle(fontSize: 13),
            ),
          ],
          const SizedBox(height: 22),
        ],
        ActionButton(
          'Request ${kind.toLowerCase()}',
          () => openPage(context, RequestForm(store: store, kind: kind)),
        ),
        SizedBox(height: leave ? 26 : 48),
        Heading(leave ? 'My requests' : 'Request history', size: 21),
        SizedBox(height: leave ? 20 : 34),
        if (list.isEmpty)
          Text(
            leave
                ? 'No leave requests yet.'
                : 'Your submitted requests will appear here.',
          ),
        for (final r in ordered) tile(context, r),
      ];
    },
  );
}

class RequestDetail extends StatelessWidget {
  const RequestDetail({super.key, required this.store, required this.request});
  final HrStore store;
  final WorkRequest request;
  Future<void> decision(BuildContext context, String status) async {
    final r = request;
    final verb = status == 'Approved'
        ? 'Approve'
        : status == 'Rejected'
        ? 'Reject'
        : 'Cancel';
    final leave = r.kind == 'Leave';
    final when = leave
        ? '${dayKey(r.start) == dayKey(r.end) ? '${r.start.day} ${monthNames[r.start.month - 1]}' : '${dayMonthLabel(r.start)} – ${dayMonthLabel(r.end)}'} · ${r.days} working ${r.days == 1 ? 'day' : 'days'}'
        : '${shortDateLabel(r.start)} · ${hoursLabel(r.hours)}';
    final message = switch (status) {
      'Cancelled' => 'The request will be marked as cancelled.',
      'Rejected' => 'The employee will see this request as rejected.',
      _ =>
        leave
            ? r.unpaid
                  ? '${r.type} is unpaid: ${daysLabel(r.days)} will be deducted from salary.'
                  : 'Approval deducts ${r.days == 1 ? 'one day' : '${r.days} days'} from the selected leave balance.'
            : 'Approved hours are included in this month’s payroll.',
    };
    if (await openPage<bool>(
          context,
          DecisionPage(
            store: store,
            title: '$verb request?',
            heading: store.employee(r.employeeId).name,
            subheading: leave ? r.type : 'Overtime',
            details: when,
            message: message,
            action: switch (status) {
              'Cancelled' => 'Confirm cancellation',
              'Rejected' => 'Confirm rejection',
              _ => 'Confirm approval',
            },
          ),
        ) ==
        true) {
      final error = await store.decideRequest(r, status);
      if (error != null && context.mounted) toast(context, error);
    }
  }

  @override
  Widget build(BuildContext context) {
    store.requireOwner(request.employeeId);
    if (request.kind != 'Leave') return overtime(context);
    return HrPage(
      store: store,
      title: 'Request details',
      back: store.isHr ? 'Requests' : 'My leave',
      builder: (context) {
        final r = request;
        return [
          Surface(
            color: r.kind == 'Leave' ? sage : forest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  r.kind == 'Leave' ? r.type : 'Requested hours',
                  style: TextStyle(
                    color: r.kind == 'Leave' ? forest : mist,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  r.kind == 'Leave'
                      ? fullDateLabel(r.start)
                      : '${r.hours.toStringAsFixed(2)} hours',
                  style: TextStyle(
                    color: r.kind == 'Leave' ? charcoal : Colors.white,
                    fontSize: r.kind == 'Leave' ? 16 : 20,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  r.status,
                  style: TextStyle(
                    color: r.kind == 'Leave' ? forest : mist,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Surface(
            child: Column(
              children: [
                DetailRow('Employee', store.employee(r.employeeId).name),
                if (r.kind == 'Leave') ...[
                  if (dayKey(r.start) != dayKey(r.end))
                    DetailRow(
                      'Dates',
                      '${dateLabel(r.start)} – ${dateLabel(r.end)}',
                    ),
                  DetailRow(
                    'Duration',
                    '${r.days} working ${r.days == 1 ? 'day' : 'days'}',
                  ),
                  if (r.unpaid) const DetailRow('Pay', 'Unpaid'),
                ] else ...[
                  DetailRow('Work date', dateLabel(r.start)),
                  DetailRow('Start time', timeLabel(r.start)),
                  DetailRow('End time', timeLabel(r.end)),
                ],
                DetailRow('Reason', r.reason),
                if (r.kind != 'Leave') DetailRow('Status', r.status),
              ],
            ),
          ),
          const SizedBox(height: 30),
          if (r.status == 'Pending') ...[
            if (store.isHr && store.isOwnRequest(r))
              const Text('Another HR administrator must decide your request.')
            else if (store.isHr) ...[
              ActionButton(
                'Approve request',
                () => decision(context, 'Approved'),
              ),
              ActionButton(
                'Reject request',
                () => decision(context, 'Rejected'),
                secondary: true,
              ),
            ] else if (r.kind == 'Leave')
              ActionButton(
                'Cancel request',
                () => decision(context, 'Cancelled'),
                secondary: true,
              ),
          ] else
            Text(
              r.status == 'Cancelled'
                  ? 'You cancelled this request.'
                  : 'HR has ${r.status.toLowerCase()} this request.',
            ),
        ];
      },
    );
  }

  /// Figma `Paydesk / Second employee|pending|resolved` overtime detail.
  Widget overtime(BuildContext context) => HrPage(
    store: store,
    title: 'Overtime details',
    back: 'Overtime',
    builder: (context) {
      final r = request;
      return [
        Text(
          '${store.employee(r.employeeId).name} · ${shortDateLabel(r.start)}',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 34),
        Surface(
          padding: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DetailRow('Shift', '${timeLabel(r.start)} – ${timeLabel(r.end)}'),
              DetailRow('Overtime', hoursLabel(r.hours)),
              DetailRow(
                r.status == 'Approved' ? 'Overtime pay' : 'Estimated pay',
                '${money(store.employee(r.employeeId).rate)} × '
                '${r.overtimeMultiplier ?? store.overtimeMultiplier} × '
                '${hoursLabel(r.hours)} = ${money(store.overtimePay(r))}',
              ),
              DetailRow('Status', r.status),
              const SizedBox(height: 14),
              Text(r.reason, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 12),
            ],
          ),
        ),
        const SizedBox(height: 50),
        if (r.status == 'Pending' && store.isHr && store.isOwnRequest(r))
          const Text('Another HR administrator must decide your request.')
        else if (r.status == 'Pending' && store.isHr) ...[
          ActionButton(
            'Approve ${hoursLabel(r.hours)}',
            () => decision(context, 'Approved'),
          ),
          const SizedBox(height: 8),
          ActionButton(
            'Reject request',
            () => decision(context, 'Rejected'),
            secondary: true,
          ),
        ] else if (r.status != 'Pending')
          Text('HR has ${r.status.toLowerCase()} this request.'),
      ];
    },
  );
}

class RequestForm extends StatefulWidget {
  const RequestForm({super.key, required this.store, required this.kind});
  final HrStore store;
  final String kind;
  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  late String type = widget.store.leaveTypes.first.name;
  String reason = '';
  bool submitting = false;
  DateTime? startDate, endDate;
  TimeOfDay? startTime, endTime;
  String? error;
  bool get leave => widget.kind == 'Leave';
  DateTime? at(TimeOfDay? t) => startDate == null || t == null
      ? null
      : DateTime(
          startDate!.year,
          startDate!.month,
          startDate!.day,
          t.hour,
          t.minute,
        );
  double? get hours => at(startTime) == null || at(endTime) == null
      ? null
      : at(endTime)!.difference(at(startTime)!).inMinutes / 60;

  /// The last date the chosen leave type allows in one request: the end of
  /// the month for Monthly Leave and the end of the year for Annual Leave.
  DateTime leaveLastDate(DateTime from) =>
      switch (widget.store.leaveType(type).resets) {
        'month' => DateTime(from.year, from.month + 1, 0),
        'year' => DateTime(from.year, 12, 31),
        _ => DateTime(from.year + 1, from.month, from.day),
      };

  /// Keeps the end date on or after the start and inside the leave period.
  void fitEndDate() {
    final from = startDate;
    if (from == null) return;
    final to = endDate;
    if (to == null || to.isBefore(from) || to.isAfter(leaveLastDate(from))) {
      endDate = from;
    }
  }

  Future<void> chooseLeaveDate({required bool start}) async {
    final today = dayOnly(widget.store.clock());
    if (!start && startDate == null) return chooseLeaveDate(start: true);
    final first = start ? DateTime(today.year - 1) : startDate!;
    final last = start
        ? DateTime(today.year + 1, 12, 31)
        : leaveLastDate(startDate!);
    var initial = (start ? startDate : endDate) ?? (start ? today : startDate!);
    if (initial.isBefore(first)) initial = first;
    if (initial.isAfter(last)) initial = last;
    final picked = await showDatePicker(
      context: context,
      helpText: start ? 'First day of leave' : 'Last day of leave',
      firstDate: first,
      lastDate: last,
      initialDate: initial,
    );
    if (picked == null || !mounted) return;
    setState(() {
      if (start) {
        startDate = picked;
      } else {
        endDate = picked;
      }
      fitEndDate();
    });
  }

  Future<void> chooseDates() async {
    if (leave) {
      await chooseLeaveDate(start: true);
    } else {
      final today = dayOnly(widget.store.clock());
      final d = await showDatePicker(
        context: context,
        helpText: 'Overtime work date',
        firstDate: today.subtract(const Duration(days: 60)),
        lastDate: today.add(const Duration(days: 30)),
        initialDate: startDate ?? today,
      );
      if (d != null && mounted) setState(() => startDate = d);
    }
  }

  String hhmm(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  Future<void> chooseTime(bool start) async {
    final initial = start
        ? startTime ?? const TimeOfDay(hour: 18, minute: 0)
        : endTime ??
              (startTime == null
                  ? const TimeOfDay(hour: 20, minute: 0)
                  : TimeOfDay(
                      hour: (startTime!.hour + 2).clamp(0, 23),
                      minute: startTime!.minute,
                    ));
    final t = await showTimePicker(
      context: context,
      helpText: start ? 'Overtime start time' : 'Overtime end time',
      initialTime: initial,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      ),
    );
    if (t != null && mounted) {
      setState(() {
        if (start) {
          startTime = t;
        } else {
          endTime = t;
        }
      });
    }
  }

  Future<void> editReason() async {
    final result = await openPage<String>(
      context,
      ReasonEditor(initial: reason),
    );
    if (result != null && mounted) setState(() => reason = result);
  }

  Future<void> submit() async {
    if (startDate == null ||
        (leave && endDate == null) ||
        (!leave && (startTime == null || endTime == null)) ||
        reason.trim().isEmpty) {
      setState(
        () => error = leave
            ? 'Choose dates and enter a reason to submit.'
            : 'Complete all four fields before submitting.',
      );
      return;
    }
    if (!leave && (hours ?? 0) <= 0) {
      setState(
        () => error = 'End time must be after start time on the same day.',
      );
      return;
    }
    if (submitting) return;
    WorkRequest? r;
    if (leave) {
      setState(() => submitting = true);
      final result = await widget.store.submitLeave(
        type,
        startDate!,
        endDate!,
        reason,
      );
      if (!mounted) return;
      setState(() {
        submitting = false;
        error = result.error;
      });
      r = result.request;
    } else {
      setState(() => submitting = true);
      final result = await widget.store.submitOvertime(
        at(startTime)!,
        at(endTime)!,
        reason,
      );
      if (!mounted) return;
      setState(() {
        submitting = false;
        error = result.error;
      });
      r = result.request;
    }
    if (r == null || !mounted) return;
    final saved = r;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => RequestDetail(store: widget.store, request: saved),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => HrPage(
    store: widget.store,
    title: 'Request ${widget.kind.toLowerCase()}',
    back: leave ? 'My leave' : 'My overtime',
    builder: (context) => [
      if (leave) ...[
        EntryTile(
          'Leave type',
          type,
          icon: 'file',
          onTap: () async {
            final value = await openPage<String>(
              context,
              ChoicePage<String>(
                store: widget.store,
                title: 'Choose leave type',
                back: 'Request',
                selected: type,
                options: {
                  for (final t in widget.store.leaveTypes) t.name: t.name,
                },
              ),
            );
            if (value != null && mounted) {
              setState(() {
                type = value;
                fitEndDate();
              });
            }
          },
        ),
        if (widget.store.leaveLeft(
              widget.store.session!,
              widget.store.leaveType(type),
              startDate ?? widget.store.clock(),
              includePending: true,
            )
            case final left?)
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 4),
            child: Text(
              'You can take ${daysLabel(left)} of $type'
              '${widget.store.leaveType(type).resets == 'month' ? ' this month' : ' this year'}.',
              style: const TextStyle(fontSize: 13),
            ),
          ),
        if (!widget.store.leaveType(type).paid)
          const Padding(
            padding: EdgeInsets.only(top: 6, bottom: 4),
            child: Text(
              'Unpaid leave: these days are deducted from your salary. '
              'Available once your other leave is used up.',
              style: TextStyle(fontSize: 13),
            ),
          ),
        const SizedBox(height: 10),
      ],
      if (leave) ...[
        EntryTile(
          'Start date',
          startDate == null ? 'Choose start date' : shortDateLabel(startDate!),
          icon: 'calendar',
          onTap: () => chooseLeaveDate(start: true),
        ),
        EntryTile(
          'End date',
          startDate == null
              ? 'Same as start date'
              : '${shortDateLabel(endDate!)} · '
                    '${workingDays(startDate!, endDate!)} working '
                    '${workingDays(startDate!, endDate!) == 1 ? 'day' : 'days'}',
          icon: 'calendar',
          onTap: () => chooseLeaveDate(start: false),
        ),
      ] else
        EntryTile(
          'Work date',
          startDate == null ? 'Choose date' : shortDateLabel(startDate!),
          icon: 'calendar',
          onTap: chooseDates,
        ),
      if (!leave) ...[
        EntryTile(
          'Start time',
          startTime == null ? 'Choose start time' : hhmm(startTime!),
          icon: 'clock',
          onTap: () => chooseTime(true),
        ),
        EntryTile(
          'End time',
          endTime == null ? 'Choose end time' : hhmm(endTime!),
          icon: 'clock',
          onTap: () => chooseTime(false),
        ),
      ],
      if (leave) const SizedBox(height: 10),
      EntryTile(
        'Reason',
        reason.isEmpty ? (leave ? 'Add a reason' : 'Add reason') : reason,
        icon: '900e2',
        onTap: editReason,
      ),
      const SizedBox(height: 22),
      if (!leave)
        Surface(
          color: mist,
          child: DetailRow(
            'Calculated hours',
            hours == null ? '—' : hoursLabel(hours!),
          ),
        ),
      if (leave && error == null) const SizedBox(height: 46),
      if (error != null)
        Padding(
          padding: EdgeInsets.only(top: leave ? 14 : 20, bottom: 6),
          child: Text(
            error!,
            style: const TextStyle(
              color: forest,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      const SizedBox(height: 32),
      ActionButton(submitting ? 'Submitting…' : 'Submit request', submit),
      if (leave)
        ActionButton('Cancel', () => Navigator.pop(context), secondary: true),
    ],
  );
}

class ReasonEditor extends StatefulWidget {
  const ReasonEditor({super.key, required this.initial});
  final String initial;
  @override
  State<ReasonEditor> createState() => _ReasonEditorState();
}

class _ReasonEditorState extends State<ReasonEditor> {
  late final controller = TextEditingController(text: widget.initial);
  final form = GlobalKey<FormState>();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Reason')),
    body: SafeArea(
      child: ScreenBody(
        children: [
          Form(
            key: form,
            child: LabeledField(
              'Reason',
              controller,
              validator: requiredText,
              maxLines: 5,
            ),
          ),
          ActionButton('Save reason', () {
            if (form.currentState!.validate()) {
              Navigator.pop(context, controller.text.trim());
            }
          }),
          ActionButton('Cancel', () => Navigator.pop(context), secondary: true),
        ],
      ),
    ),
  );
}

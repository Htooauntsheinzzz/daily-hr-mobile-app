import 'package:flutter/material.dart';

import 'store.dart';
import 'ui.dart';
import 'requests.dart';

class PayrollPage extends StatefulWidget {
  const PayrollPage({super.key, required this.store});
  final HrStore store;
  @override
  State<PayrollPage> createState() => _PayrollPageState();
}

class _PayrollPageState extends State<PayrollPage> {
  late DateTime month = DateTime(
    widget.store.clock().year,
    widget.store.clock().month,
  );
  Future<void> chooseMonth(BuildContext context) async {
    final s = widget.store;
    final result = await openPage<DateTime>(
      context,
      ChoicePage<DateTime>(
        store: s,
        title: 'Choose pay period',
        back: 'Payroll',
        selected: month,
        options: {
          for (var i = 0; i < 12; i++)
            DateTime(s.clock().year, s.clock().month - i): monthLabel(
              DateTime(s.clock().year, s.clock().month - i),
            ),
        },
      ),
    );
    if (result != null && mounted) setState(() => month = result);
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.store;
    return HrPage(
      store: s,
      title: s.isHr ? 'Monthly payroll' : 'My payslips',
      back: s.isHr ? 'HR overview' : 'Home',
      navigation: true,
      builder: (context) {
        if (s.isHr) {
          final key = monthKey(month);
          return [
            const SizedBox(height: 6),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: mist,
                foregroundColor: forest,
              ),
              onPressed: () => chooseMonth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(monthLabel(month)),
                  const SizedBox(width: 6),
                  const Icon(Icons.arrow_drop_down, size: 20),
                ],
              ),
            ),
            const SizedBox(height: 40),
            for (final e in s.employees)
              EntryTile(
                '${e.name} · ${e.id}',
                s.payrollStatus(e, key),
                icon: 'person',
                onTap: switch (s.payrollStatus(e, key)) {
                  'Published' => () => openPage(
                    context,
                    PayslipPage(
                      store: s,
                      payslip: s.payslips.firstWhere(
                        (p) => p.employeeId == e.id && p.month == key,
                      ),
                    ),
                  ),
                  'Inactive' => null,
                  _ => () => openPage(
                    context,
                    PreparePage(store: s, employee: e, month: key),
                  ),
                },
              ),
          ];
        }
        final slips = s.visiblePayslips()
          ..sort((a, b) => b.month.compareTo(a.month));
        return [
          Text(
            '${s.me.name}  ·  ${s.me.id}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 46),
          const Heading('Published payslips', size: 21),
          const SizedBox(height: 34),
          if (slips.isEmpty) const Text('No payslips have been published yet.'),
          for (final p in slips)
            EntryTile(
              monthLabel(DateTime.parse('${p.month}-01')),
              '${money(p.net)} net pay',
              icon: 'file',
              onTap: () => openPage(context, PayslipPage(store: s, payslip: p)),
            ),
        ];
      },
    );
  }
}

class PreparePage extends StatelessWidget {
  const PreparePage({
    super.key,
    required this.store,
    required this.employee,
    required this.month,
  });
  final HrStore store;
  final Employee employee;
  final String month;
  @override
  Widget build(BuildContext context) => HrPage(
    store: store,
    title: 'Prepare payslip',
    back: 'Payroll',
    builder: (context) {
      final e = employee, entries = store.approvedEntries(employee.id, month);
      return [
        Text('${e.name} · ${monthLabel(DateTime.parse('$month-01'))}'),
        const SizedBox(height: 28),
        EntryTile(
          'Monthly base salary',
          money(e.base),
          onTap: () => editPayAmount(context, store, e, 0),
        ),
        EntryTile(
          'Overtime rate per hour',
          money(e.rate),
          onTap: () => editPayAmount(context, store, e, 1),
        ),
        EntryTile(
          'Approved overtime entries',
          hoursLabel(entries.fold<double>(0, (n, r) => n + r.hours)),
          onTap: () => openPage(
            context,
            EntriesPage(store: store, employee: e, month: month),
          ),
        ),
        const SizedBox(height: 20),
        const Heading('Itemized deductions', size: 20),
        const SizedBox(height: 18),
        EntryTile(
          'Employee insurance',
          money(e.insurance),
          onTap: () => editPayAmount(context, store, e, 2),
        ),
        EntryTile(
          'Salary advance',
          money(e.advance),
          onTap: () => editPayAmount(context, store, e, 3),
        ),
        const SizedBox(height: 28),
        ActionButton(
          'Calculate and review',
          () => guarded(context, () {
            final draft = store.calculate(e.id, month);
            store.saveDraft(draft);
            openPage(
              context,
              CalculatingPage(
                next: PayslipPage(store: store, payslip: draft),
              ),
            );
          }),
        ),
      ];
    },
  );
  void settings(BuildContext context) =>
      openPage(context, PaySettingsPage(store: store, employee: employee));
}

class EntriesPage extends StatelessWidget {
  const EntriesPage({
    super.key,
    required this.store,
    required this.employee,
    required this.month,
    this.ids,
  });
  final HrStore store;
  final Employee employee;
  final String month;
  final List<String>? ids;
  @override
  Widget build(BuildContext context) => HrPage(
    store: store,
    title: 'Approved overtime',
    back: ids == null ? 'Prepare' : 'Payslip',
    builder: (context) {
      final entries = ids == null
          ? store.approvedEntries(employee.id, month)
          : store.requests
                .where(
                  (r) => ids!.contains(r.id) && r.employeeId == employee.id,
                )
                .toList();
      final total = entries.fold<double>(0, (n, r) => n + r.hours);
      return [
        Text(
          '${employee.name} · ${monthLabel(DateTime.parse('$month-01'))}',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 32),
        Text(
          entries.isEmpty
              ? 'No approved entries for ${employee.name.split(' ').first} this month.'
              : 'Approved entries included in this pay period',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 24),
        for (final r in entries)
          EntryTile(
            shortDateLabel(r.start),
            '${timeLabel(r.start)} – ${timeLabel(r.end)} · ${hoursLabel(r.hours)}',
            icon: 'clock',
            onTap: () =>
                openPage(context, RequestDetail(store: store, request: r)),
          ),
        const SizedBox(height: 24),
        Row(
          children: [
            const Expanded(
              child: Text(
                'Total approved hours',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              hoursLabel(total),
              style: const TextStyle(
                color: forest,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ];
    },
  );
}

/// Figma `Work / Calculation …` interstitial shown before the draft review.
class CalculatingPage extends StatefulWidget {
  const CalculatingPage({
    super.key,
    required this.next,
    this.delay = const Duration(milliseconds: 600),
  });
  final Widget next;
  final Duration delay;
  @override
  State<CalculatingPage> createState() => _CalculatingPageState();
}

class _CalculatingPageState extends State<CalculatingPage> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(widget.delay, () {
      if (mounted) {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute<void>(builder: (_) => widget.next));
      }
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Align(
          alignment: Alignment(0, -0.1),
          child: Text(
            'Calculating net pay…',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: forest,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  );
}

class PayslipPage extends StatelessWidget {
  const PayslipPage({super.key, required this.store, required this.payslip});
  final HrStore store;
  final Payslip payslip;
  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: store,
    builder: (context, _) => buildPage(context),
  );
  Widget buildPage(BuildContext context) {
    store.requireOwner(payslip.employeeId);
    if (!store.isHr && !payslip.published) {
      return const Scaffold(
        body: Center(child: Text('Payslip is not published.')),
      );
    }
    return HrPage(
      store: store,
      title: payslip.published ? 'Monthly payslip' : 'Review draft',
      back: store.isHr ? 'Payroll' : 'My payslips',
      builder: (context) {
        final p = payslip;
        return [
          Text(
            '${store.employee(p.employeeId).name} · ${monthLabel(DateTime.parse('${p.month}-01'))}',
          ),
          const SizedBox(height: 26),
          Surface(
            color: forest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Net pay',
                  style: TextStyle(color: mist, fontSize: 16),
                ),
                const SizedBox(height: 14),
                Text(
                  money(p.net),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Surface(
            child: Column(
              children: [
                DetailRow('Base salary', money(p.base)),
                InkWell(
                  onTap: () => openPage(
                    context,
                    EntriesPage(
                      store: store,
                      employee: store.employee(p.employeeId),
                      month: p.month,
                      ids: p.entryIds,
                    ),
                  ),
                  child: DetailRow(
                    'Approved hours',
                    '${hoursLabel(p.hours)}  ›',
                  ),
                ),
                DetailRow('Overtime rate', money(p.rate)),
                DetailRow('Overtime pay', money(p.overtime)),
                DetailRow('Employee insurance', money(p.insurance)),
                DetailRow('Salary advance', money(p.advance)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (p.published)
            const Text(
              'Published',
              style: TextStyle(color: forest, fontWeight: FontWeight.w600),
            ),
          if (!p.published && store.isHr) ...[
            const SizedBox(height: 16),
            ActionButton('Publish payslip', () async {
              if (await confirm(
                context,
                'Publish payslip?',
                '${store.employee(p.employeeId).name} will be able to view ${money(p.net)} for ${monthLabel(DateTime.parse('${p.month}-01'))}.',
                action: 'Publish',
              )) {
                if (context.mounted) guarded(context, () => store.publish(p));
              }
            }),
            ActionButton(
              'Edit draft',
              () => Navigator.pop(context),
              secondary: true,
            ),
          ],
        ];
      },
    );
  }
}

class PaySettingsPage extends StatelessWidget {
  const PaySettingsPage({
    super.key,
    required this.store,
    required this.employee,
  });
  final HrStore store;
  final Employee employee;
  @override
  Widget build(BuildContext context) => HrPage(
    store: store,
    title: 'Pay settings',
    back: 'Record',
    builder: (context) => [
      Text('${employee.name} · ${employee.id}'),
      const SizedBox(height: 40),
      EntryTile(
        'Monthly base salary · THB',
        money(employee.base),
        onTap: () => editPayAmount(context, store, employee, 0),
      ),
      const SizedBox(height: 10),
      EntryTile(
        'Overtime rate · THB/hour',
        money(employee.rate),
        onTap: () => editPayAmount(context, store, employee, 1),
      ),
    ],
  );
}

Future<void> editPayAmount(
  BuildContext context,
  HrStore store,
  Employee e,
  int field,
) async {
  final current = [e.base, e.rate, e.insurance, e.advance][field];
  final amounts = <List<double>>[
    [30000, 32000],
    [250, 300],
    [500, 750],
    [0, 250],
  ][field];
  final result = await openPage<double>(
    context,
    ChoicePage<double>(
      store: store,
      title: [
        'Monthly base salary',
        'Hourly overtime rate',
        'Insurance deduction',
        'Salary advance',
      ][field],
      back: 'Back',
      subtitle: e.name,
      selected: current,
      options: {
        for (final value in {...amounts, current}) value: money(value),
      },
    ),
  );
  if (result == null) return;
  store.requireHr();
  switch (field) {
    case 0:
      e.base = result;
    case 1:
      e.rate = result;
    case 2:
      e.insurance = result;
    case 3:
      e.advance = result;
  }
  store.changed();
}

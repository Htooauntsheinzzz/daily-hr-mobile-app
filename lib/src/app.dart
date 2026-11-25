import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'store.dart';
import 'ui.dart';
import 'people.dart';
import 'attendance.dart';
import 'requests.dart';
import 'payroll.dart';

class DailyHrApp extends StatefulWidget {
  const DailyHrApp({super.key, required this.store, this.showSplash = true});
  final HrStore store;
  final bool showSplash;
  @override
  State<DailyHrApp> createState() => _DailyHrAppState();
}

class _DailyHrAppState extends State<DailyHrApp> {
  bool ready = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    ready = !widget.showSplash;
    if (!ready) {
      timer = Timer(const Duration(milliseconds: 1400), () {
        if (mounted) setState(() => ready = true);
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: widget.store,
    builder: (context, _) => MaterialApp(
      key: ValueKey(widget.store.session),
      debugShowCheckedModeBanner: false,
      title: 'DailyHR',
      theme: appTheme(),
      home: !ready
          ? const SplashScreen()
          : widget.store.session == null
          ? SignInScreen(store: widget.store)
          : Workspace(store: widget.store),
    ),
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: forest,
    body: Stack(
      children: [
        for (final layer in [('far', 273.0), ('sage', 224.0), ('front', 161.0)])
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/splash_${layer.$1}.svg',
              height: MediaQuery.sizeOf(context).height * layer.$2 / 874,
              fit: BoxFit.fill,
            ),
          ),
        Align(
          alignment: const Alignment(0, -0.08),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 900),
            builder: (context, v, child) => Opacity(
              opacity: v,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - v)),
                child: child,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/logos/app_reverse.svg',
                  width: 96,
                  height: 96,
                ),
                const SizedBox(height: 20),
                const Text(
                  'DailyHR',
                  style: TextStyle(
                    color: cream,
                    fontSize: 52,
                    letterSpacing: -2.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.store});
  final HrStore store;
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final form = GlobalKey<FormState>();
  final email = TextEditingController(), password = TextEditingController();
  bool hr = false, visible = false, loading = false;
  String? error;
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (!form.currentState!.validate()) return;
    setState(() {
      loading = true;
      error = null;
    });
    await Future<void>.delayed(const Duration(milliseconds: 450));
    if (!mounted) return;
    final result = widget.store.signIn(email.text.trim(), password.text, hr);
    if (mounted) {
      setState(() {
        loading = false;
        error = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: forest,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: 181,
                child: Stack(
                  children: [
                    Center(
                      child: Transform.translate(
                        offset: const Offset(0, -16),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/logos/app_reverse.svg',
                                width: 96,
                                height: 96,
                              ),
                              const SizedBox(width: 16),
                              const Text(
                                'DailyHR',
                                style: TextStyle(
                                  fontSize: 39,
                                  fontWeight: FontWeight.bold,
                                  color: cream,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        'assets/icons/horizon.svg',
                        height: 67,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 48, 30, 24),
              child: Form(
                key: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Heading('Welcome back', size: 36),
                    const SizedBox(height: 10),
                    Text('Sign in to DailyHR with your work email.'),
                    const SizedBox(height: 44),
                    const Text(
                      'Work email',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 9),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.username],
                      validator: (v) => (v ?? '').trim().isEmpty
                          ? 'ⓘ  Enter your work email.'
                          : validEmail(v!.trim())
                          ? null
                          : 'ⓘ  Enter a valid email address.',
                      decoration: const InputDecoration(
                        hintText: 'name@company.com',
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(16),
                          child: AssetIcon('mail'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Password',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 9),
                    TextFormField(
                      controller: password,
                      obscureText: !visible,
                      autofillHints: const [AutofillHints.password],
                      validator: (v) =>
                          (v ?? '').isEmpty ? 'ⓘ  Enter your password.' : null,
                      onFieldSubmitted: (_) => loading ? null : submit(),
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(16),
                          child: AssetIcon('lock'),
                        ),
                        suffixIcon: IconButton(
                          tooltip: visible ? 'Hide password' : 'Show password',
                          onPressed: () => setState(() => visible = !visible),
                          icon: const AssetIcon('visibility'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 44),
                    ActionButton(
                      loading
                          ? 'Signing in…'
                          : (error?.contains('needs a role') ?? false)
                          ? 'Sign out'
                          : 'Sign in',
                      loading
                          ? null
                          : (error?.contains('needs a role') ?? false)
                          ? () => setState(() {
                              error = null;
                              email.clear();
                              password.clear();
                            })
                          : submit,
                    ),
                    if (error != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(error!, style: TextStyle(color: charcoal)),
                      ),
                    const SizedBox(height: 85),
                    ActionButton(
                      hr ? 'Try Employee demo' : 'Try HR Admin demo',
                      loading
                          ? null
                          : () => setState(() {
                              hr = !hr;
                              error = null;
                              email.clear();
                              password.clear();
                            }),
                      secondary: true,
                    ),
                    ExpansionTile(
                      title: const Text(
                        'Local demo accounts',
                        style: TextStyle(fontSize: 14),
                      ),
                      tilePadding: EdgeInsets.zero,
                      children: [
                        Text(
                          'Fictional data saved on this device.\n${hr ? 'arun@dailyhr.example' : 'maya@dailyhr.example or nina@dailyhr.example'}\nPassword: DemoPass42',
                        ),
                        TextButton(
                          onPressed: () => setState(() {
                            email.text = hr
                                ? 'arun@dailyhr.example'
                                : 'maya@dailyhr.example';
                            password.text = 'DemoPass42';
                          }),
                          child: const Text('Fill demo credentials'),
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Simulate offline'),
                          value: widget.store.offline,
                          onChanged: (v) =>
                              setState(() => widget.store.offline = v),
                        ),
                      ],
                    ),
                    if (widget.store.persistenceError != null)
                      Text(widget.store.persistenceError!),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class Workspace extends StatefulWidget {
  const Workspace({super.key, required this.store});
  final HrStore store;
  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  int tab = 0;
  @override
  void initState() {
    super.initState();
    widget.store.navigateWorkspace = (i) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      select(i);
    };
  }

  @override
  void dispose() {
    widget.store.navigateWorkspace = null;
    super.dispose();
  }

  HrStore get s => widget.store;
  void select(int i) => setState(() => tab = i);
  Future<void> signOut() async {
    if (await confirm(
      context,
      'Sign out of DailyHR?',
      'You can sign back in with your work email.',
      action: 'Sign out',
      cancel: 'Stay signed in',
    )) {
      await s.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = s.isHr
        ? ['Overview', 'Employees', 'Attendance', 'Profile']
        : ['Home', 'Attendance', 'Calendar', 'Profile'];
    final icons = s.isHr
        ? ['home', 'team', 'attendance', 'profile']
        : ['home', 'attendance', '470f8', 'profile'];
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: switch (tab) {
          0 => dashboard(),
          1 =>
            s.isHr
                ? DirectoryBody(store: s)
                : AttendanceBody(store: s, onCalendar: () => select(2)),
          2 => s.isHr ? AttendanceReviewBody(store: s) : CalendarBody(store: s),
          _ => ProfileBody(store: s, onSignOut: signOut),
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: select,
        destinations: List.generate(
          4,
          (i) => NavigationDestination(
            icon: AssetIcon(icons[i]),
            label: labels[i],
          ),
        ),
      ),
    );
  }

  Widget dashboard() {
    final shift = s.isHr
        ? null
        : s.openShift ?? s.shiftFor(s.session!, s.clock());
    final state = shift == null
        ? 'Ready to check in'
        : shift.end == null
        ? 'Working'
        : 'Shift complete';
    String recent(String kind) {
      final r = s.visibleRequests(kind);
      final pending = r.where((r) => r.status == 'Pending').length;
      return s.isHr
          ? pending == 0
                ? 'No pending ${kind.toLowerCase()}'
                : '$pending pending'
          : r.isEmpty
          ? 'No request'
          : r.first.status;
    }

    void requests(String kind) =>
        openPage(context, RequestsPage(store: s, kind: kind));
    Widget quick(String title, String icon, VoidCallback action) => Surface(
      padding: 14,
      onTap: action,
      child: Row(
        children: [
          AssetIcon(icon),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: forest,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
    final actions = s.isHr
        ? [
            quick('Employees', 'team', () => select(1)),
            quick('Attendance', 'clock', () => select(2)),
            quick('Leave requests', 'calendar', () => requests('Leave')),
            quick('Overtime', 'clock', () => requests('Overtime')),
            quick(
              'Payroll',
              'file',
              () => openPage(context, PayrollPage(store: s)),
            ),
          ]
        : [
            quick('Attendance', 'clock', () => select(1)),
            quick('My leave', 'calendar', () => requests('Leave')),
            quick('Overtime', 'clock', () => requests('Overtime')),
            quick(
              'My payslips',
              'file',
              () => openPage(context, PayrollPage(store: s)),
            ),
          ];
    return ScreenBody(
      children: [
        Row(
          children: [
            const AssetIcon('logo', size: 40),
            const SizedBox(width: 10),
            const Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Heading('DailyHR', size: 24),
              ),
            ),
            if (s.isHr)
              PopupMenuButton<String>(
                tooltip: 'Account menu',
                icon: const AssetIcon('menu'),
                onSelected: (v) => v == 'profile' ? select(3) : signOut(),
                itemBuilder: (_) => const [
                  PopupMenuItem(value: 'profile', child: Text('Profile')),
                  PopupMenuItem(value: 'out', child: Text('Sign out')),
                ],
              )
            else
              FilledButton.tonal(
                style: FilledButton.styleFrom(
                  backgroundColor: mist,
                  foregroundColor: forest,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  minimumSize: const Size(0, 44),
                ),
                onPressed: () => select(3),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AssetIcon('person'),
                    SizedBox(width: 6),
                    Text('Profile'),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 15),
        Heading(
          s.isHr
              ? 'HR overview'
              : '${s.clock().hour < 12 ? 'Good morning' : 'Hello'}, ${s.me.name.split(' ').first}',
          size: 32,
        ),
        const SizedBox(height: 38),
        Surface(
          color: forest,
          onTap: () => select(s.isHr ? 2 : 1),
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.isHr ? 'Daily attendance' : 'Today’s attendance',
                  style: const TextStyle(color: mist, fontSize: 15),
                ),
                const SizedBox(height: 16),
                if (s.isHr)
                  Row(
                    children: [
                      stat(
                        '${s.shifts.where((r) => dayKey(r.start) == dayKey(s.clock())).length}',
                        'Checked in',
                      ),
                      stat(
                        '${s.requests.where((r) => r.kind == 'Leave' && r.status == 'Approved' && !dayOnly(s.clock()).isBefore(dayOnly(r.start)) && !dayOnly(s.clock()).isAfter(dayOnly(r.end))).map((r) => r.employeeId).toSet().length}',
                        'On leave',
                      ),
                      stat(
                        '${s.employees.where((e) => e.active).length}',
                        'Employees',
                      ),
                    ],
                  )
                else ...[
                  Text(
                    state,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Working hours     ${shift == null ? '—' : '${shift.hours(s.clock()).toStringAsFixed(2)} h'}',
                  ),
                  const SizedBox(height: 6),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 34),
        Heading(s.isHr ? 'Needs a decision' : 'Recent requests', size: 22),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final kind in ['Leave', 'Overtime']) ...[
              if (kind == 'Overtime') const SizedBox(width: 12),
              Expanded(
                child: Surface(
                  padding: 15,
                  onTap: () => requests(kind),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AssetIcon(kind == 'Leave' ? 'calendar' : 'clock'),
                          const SizedBox(width: 7),
                          Expanded(
                            child: Text(
                              s.isHr && kind == 'Leave' ? 'Leave queue' : kind,
                              style: const TextStyle(
                                color: forest,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        recent(kind),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 34),
        const Heading('Quick actions', size: 20),
        const SizedBox(height: 16),
        for (var i = 0; i < actions.length; i += 2)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Expanded(child: actions[i]),
                const SizedBox(width: 12),
                Expanded(
                  child: i + 1 < actions.length
                      ? actions[i + 1]
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        if (!s.isHr)
          ActionButton(
            'Notifications',
            () => openPage(context, NotificationsPage(store: s)),
            secondary: true,
          ),
        if (s.persistenceError != null) Text(s.persistenceError!),
      ],
    );
  }

  Widget stat(String value, String label) => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        Text(label, style: const TextStyle(fontSize: 12, color: mist)),
      ],
    ),
  );
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key, required this.store});
  final HrStore store;
  @override
  Widget build(BuildContext context) => HrPage(
    store: store,
    title: 'Notifications',
    back: 'Home',
    builder: (context) {
      final notices = store.notices
          .where((n) => n.employeeId == store.session)
          .toList()
          .reversed;
      return [
        const Text('Request decisions and published payslips'),
        const SizedBox(height: 36),
        if (notices.isEmpty) const Heading('You’re all caught up.', size: 18),
        for (final n in notices)
          EntryTile(
            n.title,
            'View details',
            icon: n.kind == 'request' ? 'calendar' : 'file',
            onTap: () {
              if (n.kind == 'request') {
                final r = store.requests
                    .where(
                      (r) => r.id == n.target && r.employeeId == store.session,
                    )
                    .firstOrNull;
                if (r != null) {
                  openPage(context, RequestDetail(store: store, request: r));
                }
              } else {
                final p = store
                    .visiblePayslips()
                    .where((p) => p.id == n.target)
                    .firstOrNull;
                if (p != null) {
                  openPage(context, PayslipPage(store: store, payslip: p));
                }
              }
            },
          ),
      ];
    },
  );
}

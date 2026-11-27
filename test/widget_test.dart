import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/app.dart';
import 'package:daily_hr_mobile_application/src/auth.dart';
import 'package:daily_hr_mobile_application/src/people.dart';
import 'package:daily_hr_mobile_application/src/payroll.dart';
import 'package:daily_hr_mobile_application/src/requests.dart';
import 'package:daily_hr_mobile_application/src/store.dart';

import 'fake_auth.dart';

import 'package:daily_hr_mobile_application/src/ui.dart';

void main() {
  Future<void> size(
    WidgetTester tester, {
    double width = 402,
    double height = 874,
  }) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(width, height);
    tester.view.padding = const FakeViewPadding(top: 35, bottom: 14);
    addTearDown(tester.view.resetPadding);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  Future<void> capture(WidgetTester tester, String name, GlobalKey key) async {
    await tester.pumpAndSettle();
    final boundary =
        key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    await tester.runAsync(() async {
      final image = await boundary.toImage();
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      await Directory('build/qa').create(recursive: true);
      await File('build/qa/$name.png')
          .writeAsBytes(bytes!.buffer.asUint8List());
      image.dispose();
    });
  }

  setUpAll(() async {
    final loader = FontLoader('Inter')
      ..addFont(rootBundle.load('assets/fonts/Inter.ttf'));
    await loader.load();
    await (FontLoader(
      'MaterialIcons',
    )..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'))).load();
  });
  testWidgets(
    'login validation, retry, sign out and back do not expose workspace',
    (tester) async {
      await size(tester);
      final store = HrStore(auth: FakeAuth());
      await tester.pumpWidget(DailyHrApp(store: store, showSplash: false));
      await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
      await tester.pumpAndSettle();
      expect(find.text('ⓘ  Enter your work email.'), findsOneWidget);
      expect(find.text('ⓘ  Enter your password.'), findsOneWidget);
      await tester.enterText(
        find.byType(TextFormField).at(0),
        'arun@gmail.com',
      );
      await tester.enterText(find.byType(TextFormField).at(1), 'wrong');
      await tester.ensureVisible(find.text('Sign in'));
      await tester.tap(find.text('Sign in'));
      await tester.pumpAndSettle();
      expect(
        find.textContaining('email or password is incorrect'),
        findsOneWidget,
      );
      expect(find.text('Try HR Admin demo'), findsNothing);
      await tester.enterText(find.byType(TextFormField).at(1), '123456');
      await tester.ensureVisible(find.text('Sign in'));
      await tester.tap(find.text('Sign in'));
      await tester.pumpAndSettle();
      expect(find.text('Quick actions'), findsOneWidget);
      await tester.tap(find.byType(NavigationDestination).last);
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Sign out'));
      await tester.tap(find.text('Sign out'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Stay signed in'));
      await tester.pumpAndSettle();
      expect(store.session, 'hr');
      await tester.tap(find.text('Sign out'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Sign out').last);
      await tester.pumpAndSettle();
      expect(store.session, isNull);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.text('Welcome back'), findsOneWidget);
    },
  );
  testWidgets('HR admin with an employee record switches views', (
    tester,
  ) async {
    await size(tester);
    final store = HrStore(
      auth: FakeAuth(
        accounts: {
          'arun@gmail.com/123456': const AuthRoles(
            hr: true,
            employee: {
              'id': 'DH-003',
              'name': 'Arun Patel',
              'email': 'arun@gmail.com',
              'position': 'HR Administrator',
              'department': 'People Operations',
            },
          ),
        },
      ),
    );
    expect(await store.signIn('arun@gmail.com', '123456'), isNull);
    await tester.pumpWidget(DailyHrApp(store: store, showSplash: false));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(NavigationDestination).last);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Switch to my employee view'));
    await tester.tap(find.text('Switch to my employee view'));
    await tester.pumpAndSettle();
    expect(store.session, 'DH-003');
    await tester.tap(find.byType(NavigationDestination).last);
    await tester.pumpAndSettle();
    expect(find.text('HR Administrator'), findsOneWidget);
    await tester.ensureVisible(find.text('Switch to HR view'));
    await tester.tap(find.text('Switch to HR view'));
    await tester.pumpAndSettle();
    expect(store.isHr, isTrue);
  });
  testWidgets('sign-in screen explains why the app signed someone out', (
    tester,
  ) async {
    await size(tester);
    final auth = FakeAuth();
    final store = HrStore(auth: auth);
    expect(await store.signIn('maya@dailyhr.example', '123456'), isNull);
    await tester.pumpWidget(DailyHrApp(store: store, showSplash: false));
    await tester.pumpAndSettle();
    auth.signedInAs = const AuthRoles(
      employee: {'id': 'DH-001', 'active': false},
    );
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(store.session, isNull);
    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.textContaining('Your account is inactive'), findsOneWidget);
  });
  testWidgets('department-only edits preserve position', (tester) async {
    await size(tester);
    final store = HrStore()..session = 'hr';
    final e = store.employees.first;
    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme(),
        home: EmployeeForm(store: store, employee: e),
      ),
    );
    await tester.tap(find.text('People Operations'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Business Operations').last);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Save changes'));
    await tester.tap(find.text('Save changes'));
    await tester.pumpAndSettle();
    expect(e.department, 'Business Operations');
    expect(e.position, 'People Coordinator');
  });
  testWidgets(
    'approval updates only selected detail and removes pending actions',
    (tester) async {
      await size(tester);
      final store = HrStore()..session = 'DH-001';
      final second = store.submit(
        'Leave',
        'Annual Leave',
        DateTime(2026, 11, 25),
        DateTime(2026, 11, 25),
        'Appointment',
      );
      store.session = 'hr';
      await tester.pumpWidget(
        MaterialApp(
          theme: appTheme(),
          home: RequestDetail(store: store, request: second),
        ),
      );
      await tester.ensureVisible(find.text('Approve request'));
      await tester.tap(find.text('Approve request'));
      await tester.pumpAndSettle();
      await tester.tap(
        find.widgetWithText(FilledButton, 'Confirm approval').last,
      );
      await tester.pumpAndSettle();
      expect(second.status, 'Approved');
      expect(store.requests.first.status, 'Pending');
      expect(find.text('Approve request'), findsNothing);
      expect(find.text('Reject request'), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('reference-size screenshots for sign in, home, HR and payroll', (
    tester,
  ) async {
    await size(tester);
    final store = HrStore(clock: () => DateTime(2026, 11, 24, 9));
    for (final role in [null, 'DH-001', 'hr']) {
      store.session = role;
      final key = GlobalKey();
      await tester.pumpWidget(
        RepaintBoundary(
          key: key,
          child: DailyHrApp(store: store, showSplash: false),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await capture(
        tester,
        role == null
            ? 'sign-in'
            : role == 'hr'
            ? 'hr-overview'
            : 'employee-home',
        key,
      );
    }
    final key = GlobalKey();
    await tester.pumpWidget(
      RepaintBoundary(
        key: key,
        child: MaterialApp(
          theme: appTheme(),
          home: PreparePage(
            store: store,
            employee: store.employees.first,
            month: '2026-11',
          ),
        ),
      ),
    );
    await capture(tester, 'prepare-payslip', key);
    expect(tester.takeException(), isNull);
  });
  testWidgets('narrow phone with keyboard and large text has no overflow', (
    tester,
  ) async {
    await size(tester, width: 320, height: 700);
    final store = HrStore()..session = 'hr';
    for (final page in [
      EmployeeForm(store: store),
      RequestForm(store: store, kind: 'Overtime'),
      PreparePage(
        store: store,
        employee: store.employees.first,
        month: '2026-11',
      ),
    ]) {
      await tester.pumpWidget(
        MaterialApp(
          theme: appTheme(),
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.5),
              viewInsets: const EdgeInsets.only(bottom: 280),
            ),
            child: child!,
          ),
          home: page,
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    }
  });
  testWidgets(
    'checkout cancellation keeps shift open and calendar shows completed hours',
    (tester) async {
      await size(tester);
      var now = DateTime(2026, 11, 24, 9);
      final store = HrStore(clock: () => now)..session = 'DH-001';
      store.checkIn();
      now = DateTime(2026, 11, 24, 17);
      await tester.pumpWidget(DailyHrApp(store: store, showSplash: false));
      await tester.tap(find.byType(NavigationDestination).at(1));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Check out'));
      await tester.tap(find.text('Check out'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Keep working'));
      await tester.pumpAndSettle();
      expect(store.openShift, isNotNull);
      await tester.tap(find.text('Check out'));
      await tester.pumpAndSettle();
      await tester.tap(
        find.widgetWithText(FilledButton, 'Confirm check-out').last,
      );
      await tester.pumpAndSettle();
      expect(store.openShift, isNull);
      await tester.tap(find.byType(NavigationDestination).at(2));
      await tester.pumpAndSettle();
      expect(find.text('8h 00m'), findsOneWidget);
      expect(find.text('09:00'), findsOneWidget);
      expect(find.text('17:00'), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets(
    'notifications navigate to their own records and return to the list',
    (tester) async {
      await size(tester);
      final store = HrStore()..session = 'DH-001';
      final a = store.submit(
        'Leave',
        'Annual Leave',
        DateTime(2026, 11, 25),
        DateTime(2026, 11, 25),
        'First reason',
      );
      final b = store.submit(
        'Leave',
        'Annual Leave',
        DateTime(2026, 11, 26),
        DateTime(2026, 11, 26),
        'Second reason',
      );
      store.session = 'hr';
      store.decide(a, 'Approved');
      store.decide(b, 'Rejected');
      store.session = 'DH-001';
      await tester.pumpWidget(
        MaterialApp(
          theme: appTheme(),
          home: NotificationsPage(store: store),
        ),
      );
      await tester.tap(find.text(store.notices.first.title));
      await tester.pumpAndSettle();
      expect(find.text('First reason'), findsOneWidget);
      expect(find.text('Second reason'), findsNothing);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.text('Notifications'), findsOneWidget);
      await tester.tap(find.text(store.notices.last.title));
      await tester.pumpAndSettle();
      expect(find.text('Second reason'), findsOneWidget);
      expect(find.text('First reason'), findsNothing);
    },
  );
  testWidgets('cancelling contact edits preserves the saved profile', (
    tester,
  ) async {
    await size(tester);
    final store = HrStore()..session = 'DH-001';
    final old = store.me.mobile;
    await tester.pumpWidget(DailyHrApp(store: store, showSplash: false));
    await tester.tap(find.byType(NavigationDestination).last);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Edit contact details'));
    await tester.tap(find.text('Edit contact details'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).first, '089 777 6666');
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(store.me.mobile, old);
    expect(find.text(old), findsOneWidget);
  });
  testWidgets('request fields survive opening and dismissing pickers', (
    tester,
  ) async {
    await size(tester);
    final store = HrStore()..session = 'DH-001';
    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme(),
        home: RequestForm(store: store, kind: 'Leave'),
      ),
    );
    await tester.tap(find.text('Add a reason'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'Family visit');
    await tester.tap(find.text('Save reason'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Annual Leave'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Monthly Leave'));
    await tester.pumpAndSettle();
    expect(find.text('Family visit'), findsOneWidget);
    expect(find.text('Monthly Leave'), findsOneWidget);
    await tester.tap(find.text('Choose start date'));
    await tester.pumpAndSettle();
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.text('Family visit'), findsOneWidget);
    await tester.tap(find.text('Submit request'));
    await tester.pumpAndSettle();
    expect(
      find.text('Choose dates and enter a reason to submit.'),
      findsOneWidget,
    );
    expect(store.requests.length, 1);
  });
  testWidgets('publishing replaces draft actions with published detail', (
    tester,
  ) async {
    await size(tester);
    final store = HrStore()..session = 'hr';
    final draft = store.calculate('DH-001', '2026-11');
    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme(),
        home: PayslipPage(store: store, payslip: draft),
      ),
    );
    await tester.ensureVisible(find.text('Publish payslip'));
    await tester.tap(find.text('Publish payslip'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Publish'));
    await tester.pumpAndSettle();
    expect(find.text('Monthly payslip'), findsOneWidget);
    expect(find.text('Review draft'), findsNothing);
    expect(find.text('Publish payslip'), findsNothing);
    expect(store.notices.last.target, draft.id);
  });
}

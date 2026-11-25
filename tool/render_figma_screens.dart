import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/app.dart';
import 'package:daily_hr_mobile_application/src/attendance.dart';
import 'package:daily_hr_mobile_application/src/people.dart';
import 'package:daily_hr_mobile_application/src/payroll.dart';
import 'package:daily_hr_mobile_application/src/requests.dart';
import 'package:daily_hr_mobile_application/src/store.dart';
import 'package:daily_hr_mobile_application/src/ui.dart';

void main() {
  testWidgets('render source-sized screen families without overflow', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(402, 874);
    tester.view.padding = const FakeViewPadding(top: 35, bottom: 14);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);
    await (FontLoader(
      'Inter',
    )..addFont(rootBundle.load('assets/fonts/Inter.ttf'))).load();
    await (FontLoader(
      'MaterialIcons',
    )..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'))).load();
    final store = HrStore(clock: () => DateTime(2026, 11, 19, 17, 10))
      ..session = 'hr';
    final pages = <String, Widget>{
      'employee-record': EmployeeDetail(
        store: store,
        employee: store.employees.first,
      ),
      'employee-edit': EmployeeForm(
        store: store,
        employee: store.employees.first,
      ),
      'pay-settings': PaySettingsPage(
        store: store,
        employee: store.employees.first,
      ),
      'pay-draft': PayslipPage(
        store: store,
        payslip: store.calculate('DH-001', '2026-11'),
      ),
      'daily-review': Scaffold(
        body: SafeArea(child: AttendanceReviewBody(store: store)),
      ),
      'request-confirm': DecisionPage(
        store: store,
        title: 'Cancel request?',
        heading: 'Maya Chen',
        subheading: 'Annual leave',
        details: '23 November · 1 working day',
        message: 'The request will be marked as cancelled.',
        action: 'Confirm cancellation',
      ),
      'payroll-register': PayrollPage(store: store),
      'sign-in': SignInScreen(
        store: HrStore(clock: () => DateTime(2026, 11, 19, 17, 10)),
      ),
      'hr-overview': Workspace(store: store),
      'add-employee': EmployeeForm(store: store),
      'prepare-payslip': PreparePage(
        store: store,
        employee: store.employees.first,
        month: '2026-11',
      ),
      'payslip-october': PayslipPage(
        store: store,
        payslip: store.payslips.firstWhere(
          (p) => p.employeeId == 'DH-001' && p.month == '2026-10',
        ),
      ),
      'leave-detail-hr': RequestDetail(
        store: store,
        request: store.requests.firstWhere((r) => r.kind == 'Leave'),
      ),
      'directory': Scaffold(
        body: SafeArea(child: DirectoryBody(store: store)),
      ),
      'payroll-entries': EntriesPage(
        store: store,
        employee: store.employees.first,
        month: '2026-11',
      ),
      'payroll-calculating': const CalculatingPage(
        next: SizedBox(),
        delay: Duration.zero,
      ),
      'leave-review': RequestsPage(store: store, kind: 'Leave'),
      'overtime-review': RequestsPage(store: store, kind: 'Overtime'),
      'overtime-detail-hr': RequestDetail(
        store: store,
        request: WorkRequest(
          'render-ot',
          'DH-001',
          'Overtime',
          'Overtime',
          DateTime(2026, 11, 24, 18),
          DateTime(2026, 11, 24, 20),
          'Inventory reconciliation',
        ),
      ),
    };
    for (final entry in pages.entries) {
      final key = GlobalKey();
      await tester.pumpWidget(
        RepaintBoundary(
          key: key,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            home: entry.value,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: entry.key);
      await save(tester, key, entry.key);
    }
    store.session = 'DH-001';
    for (final entry in <String, Widget>{
      'my-leave': RequestsPage(store: store, kind: 'Leave'),
      'leave-detail': RequestDetail(
        store: store,
        request: store.requests.first,
      ),
      'overtime-form': RequestForm(store: store, kind: 'Overtime'),
      'leave-form': RequestForm(store: store, kind: 'Leave'),
      'employee-home': Workspace(store: store),
      'profile': Scaffold(
        body: SafeArea(
          child: ProfileBody(store: store, onSignOut: () {}),
        ),
      ),
      'my-overtime': RequestsPage(store: store, kind: 'Overtime'),
      'my-payslips': PayrollPage(store: store),
      'attendance-calendar': Scaffold(
        body: SafeArea(child: CalendarBody(store: store)),
      ),
      'attendance-ready': Scaffold(
        body: SafeArea(
          child: AttendanceBody(store: store, onCalendar: () {}),
        ),
      ),
    }.entries) {
      final key = GlobalKey();
      await tester.pumpWidget(
        RepaintBoundary(
          key: key,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            home: entry.value,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: entry.key);
      await save(tester, key, entry.key);
    }
    await tester.pumpWidget(const SizedBox());
  });
}

Future<void> save(WidgetTester tester, GlobalKey key, String name) async {
  final boundary =
      key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
  await tester.runAsync(() async {
    final image = await boundary.toImage();
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    await Directory('build/qa').create(recursive: true);
    await File('build/qa/$name.png').writeAsBytes(data!.buffer.asUint8List());
    image.dispose();
  });
}

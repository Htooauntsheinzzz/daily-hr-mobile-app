import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/app.dart';
import 'package:daily_hr_mobile_application/src/auth.dart';
import 'package:daily_hr_mobile_application/src/people.dart';
import 'package:daily_hr_mobile_application/src/store.dart';

import 'fake_auth.dart';
import 'fake_backend.dart';

void main() {
  late FakeBackend backend;
  late HrStore store;

  Future<HrStore> signedIn(String email, {AuthRoles? roles}) async {
    final auth = FakeAuth(
      accounts: {
        'arun@dailyhr.example/pw':
            roles ??
            const AuthRoles(
              hr: true,
              employee: {'id': 'DH-003', 'name': 'Arun Patel', 'active': true},
            ),
        'maya@dailyhr.example/pw': const AuthRoles(
          employee: {'id': 'DH-001', 'active': true},
        ),
      },
    );
    final s = HrStore(auth: auth, backend: backend);
    expect(await s.signIn(email, 'pw'), isNull);
    return s;
  }

  setUp(() {
    backend = FakeBackend();
    backend.rows['DH-001']!['mobile'] = '080 000 0000';
    backend.rows['DH-007'] = {
      'id': 'DH-007',
      'name': 'Lee Wong',
      'email': 'lee@dailyhr.example',
      'position': 'Analyst',
      'department': 'Finance',
      'active': true,
      'user_id': null,
    };
  });

  test('HR sign-in loads employees, departments and positions', () async {
    store = await signedIn('arun@dailyhr.example');
    expect(store.employee('DH-001').mobile, '080 000 0000');
    expect(store.employee('DH-001').hasLogin, isTrue);
    expect(store.employee('DH-007').name, 'Lee Wong');
    expect(store.employee('DH-007').hasLogin, isFalse);
    expect(store.departments, contains('Finance'));
    expect(store.positions, contains('Analyst'));
  });

  test('employees only sync their own data and keep local defaults', () async {
    backend.rows.remove('DH-007');
    store = await signedIn('maya@dailyhr.example');
    expect(store.me.mobile, '080 000 0000');
    expect(store.departments, isNot(contains('Finance')));
  });

  test('HR adds and edits employees through Supabase', () async {
    store = await signedIn('arun@dailyhr.example');
    expect(
      await store.saveEmployee(
        name: ' Kim Lee ',
        email: 'Kim@DailyHR.example',
        mobile: '089 000 1111',
        position: 'Analyst',
        department: 'Finance',
      ),
      isNull,
    );
    final kim = store.employees.last;
    expect(kim.id, 'DH-010');
    expect(kim.email, 'kim@dailyhr.example');
    expect(backend.rows['DH-010']!['name'], 'Kim Lee');
    expect(
      await store.saveEmployee(
        name: 'Copy',
        email: 'kim@dailyhr.example',
        mobile: '',
        position: 'Analyst',
        department: 'Finance',
      ),
      contains('already uses'),
    );
    expect(
      await store.saveEmployee(
        existing: kim,
        name: 'Kim Lee',
        email: kim.email,
        mobile: kim.mobile,
        position: 'Analyst',
        department: 'Product Design',
      ),
      isNull,
    );
    expect(backend.rows['DH-010']!['department'], 'Product Design');
  });

  test('a refused save leaves the record unchanged', () async {
    store = await signedIn('arun@dailyhr.example');
    backend.failWith = 'Choose an active department.';
    final lee = store.employee('DH-007');
    expect(
      await store.saveEmployee(
        existing: lee,
        name: 'Lee Wong',
        email: lee.email,
        mobile: '',
        position: 'Analyst',
        department: 'Old Team',
      ),
      'Choose an active department.',
    );
    expect(lee.department, 'Finance');
  });

  test('employees edit only their own contact details', () async {
    store = await signedIn('maya@dailyhr.example');
    expect(
      await store.saveContact(store.me, '081 222 3333', 'maya@home.example'),
      isNull,
    );
    expect(backend.rows['DH-001']!['personal_email'], 'maya@home.example');
    expect(
      () => store.saveContact(store.employee('DH-002'), '1', 'x@y.z'),
      throwsStateError,
    );
    expect(() => store.savePay(store.me, 0, 99999), throwsStateError);
    expect(() => store.setEmployeeActive(store.me, false), throwsStateError);
  });

  test('HR changes pay and status, but not their own', () async {
    store = await signedIn('arun@dailyhr.example');
    final maya = store.employee('DH-001');
    expect(await store.savePay(maya, 0, 31000), isNull);
    expect(backend.rows['DH-001']!['base_salary'], 31000);
    expect(maya.base, 31000);
    expect(await store.savePay(maya, 3, -5), contains('0 or more'));
    expect(await store.setEmployeeActive(maya, false), isNull);
    expect(backend.rows['DH-001']!['active'], isFalse);
    final arun = store.employee('DH-003');
    expect(await store.savePay(arun, 0, 90000), contains('your own pay'));
    expect(
      await store.setEmployeeActive(arun, false),
      contains('your own status'),
    );
    expect(arun.active, isTrue);
  });

  test('HR adds departments and positions', () async {
    store = await signedIn('arun@dailyhr.example');
    expect(await store.addDepartment(' Sales '), isNull);
    expect(backend.departmentNames, contains('Sales'));
    expect(store.departments, contains('Sales'));
    expect(await store.addDepartment('sales'), contains('already exists'));
    expect(await store.addPosition(''), contains('Enter a position'));
    expect(await store.addPosition('Sales Lead'), isNull);
    expect(store.positions, contains('Sales Lead'));
  });

  test('HR creates a login for an employee without one', () async {
    store = await signedIn('arun@dailyhr.example');
    final lee = store.employee('DH-007');
    expect(await store.createLogin(lee, 'short'), contains('8 characters'));
    expect(await store.createLogin(lee, 'Temp-pass-1'), isNull);
    expect(backend.logins['DH-007'], 'Temp-pass-1');
    expect(lee.hasLogin, isTrue);
    expect(
      await HrStore().let(
        (s) => (s..session = 'hr').createLogin(s.employee('DH-001'), 'x'),
      ),
      contains('Supabase'),
    );
  });

  testWidgets('HR adds a department from the employee directory', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(402, 874);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    store = await signedIn('arun@dailyhr.example');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: DirectoryBody(store: store)),
      ),
    );
    await tester.tap(find.text('Departments and positions'));
    await tester.pumpAndSettle();
    expect(find.text('Finance'), findsOneWidget);
    await tester.tap(find.text('+ Add department'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).last, 'Sales');
    await tester.tap(find.widgetWithText(FilledButton, 'Add'));
    await tester.pumpAndSettle();
    expect(find.text('Added Sales.'), findsOneWidget);
    expect(find.text('Sales', skipOffstage: false), findsOneWidget);
    expect(backend.departmentNames, contains('Sales'));
    expect(DailyHrApp, isNotNull);
  });
}

extension<T> on T {
  R let<R>(R Function(T) f) => f(this);
}

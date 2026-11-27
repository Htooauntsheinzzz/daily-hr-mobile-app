import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_hr_mobile_application/src/attendance.dart';
import 'package:daily_hr_mobile_application/src/auth.dart';
import 'package:daily_hr_mobile_application/src/location.dart';
import 'package:daily_hr_mobile_application/src/store.dart';

import 'fake_auth.dart';
import 'fake_backend.dart';

/// A device position that tests can move around.
class FakeLocation implements LocationSource {
  DeviceLocation here = const DeviceLocation(13.9650, 100.5866, accuracy: 12);
  LocationFailure? failWith;
  LocationProblem? openedSettings;

  @override
  Future<DeviceLocation> current() async {
    if (failWith != null) throw failWith!;
    return here;
  }

  @override
  Future<void> openSettings(LocationProblem problem) async =>
      openedSettings = problem;
}

void main() {
  late FakeBackend backend;
  late FakeLocation location;

  Future<HrStore> signedIn(String who) async {
    final auth = FakeAuth(
      accounts: {
        'maya/pw': const AuthRoles(employee: {'id': 'DH-001', 'active': true}),
        'arun/pw': const AuthRoles(hr: true),
      },
    );
    backend.me = who == 'maya' ? 'DH-001' : null;
    final store = HrStore(
      auth: auth,
      backend: backend,
      location: location,
      // The phone's time is wrong on purpose (11:59 PM): saved times must
      // come from Supabase. The date is used only to label past shifts.
      clock: () => DateTime.utc(2026, 11, 24, 23, 59),
    );
    expect(await store.signIn(who, 'pw'), isNull);
    return store;
  }

  setUp(() {
    backend = FakeBackend();
    location = FakeLocation();
  });

  test('check-in at Rangsit uses the server time', () async {
    final store = await signedIn('maya');
    expect(await store.checkInHere(), isNull);
    final shift = store.openShift!;
    // 02:00 UTC on the server is 09:00 in Bangkok.
    expect(shift.start, DateTime.utc(2026, 11, 24, 9));
    expect(shift.id, 'shift-1');
    expect(await store.checkInHere(), contains('already checked in'));
  });

  test('check-in away from Rangsit is refused', () async {
    final store = await signedIn('maya');
    location.here = const DeviceLocation(13.7563, 100.5018, accuracy: 10);
    final error = await store.checkInHere();
    expect(error, contains('Rangsit University'));
    expect(error, contains('km away'));
    expect(store.openShift, isNull);
    expect(backend.shiftRows, isEmpty);
  });

  test('location problems are reported with a fix', () async {
    final store = await signedIn('maya');
    location.failWith = const LocationFailure(LocationProblem.deniedForever);
    LocationFailure? seen;
    final error = await store.checkInHere(onLocationProblem: (f) => seen = f);
    expect(error, contains('Settings'));
    expect(seen?.needsSettings, isTrue);
    location.failWith = const LocationFailure(LocationProblem.mocked);
    expect(await store.checkInHere(), contains('simulated location'));
    expect(backend.shiftRows, isEmpty);
  });

  test('check-out works anywhere and hours come from saved times', () async {
    final store = await signedIn('maya');
    expect(await store.checkInHere(), isNull);
    location.here = const DeviceLocation(13.7563, 100.5018); // central Bangkok
    backend.now = DateTime.utc(2026, 11, 24, 10, 30); // 5:30 PM in Bangkok
    expect(await store.checkOutNow(), contains('opens at 6:00 PM'));
    backend.now = DateTime.utc(2026, 11, 24, 11, 30); // 6:30 PM in Bangkok
    expect(await store.checkOutNow(), isNull);
    final shift = store.shiftFor('DH-001', DateTime(2026, 11, 24))!;
    expect(shift.end, DateTime.utc(2026, 11, 24, 18, 30));
    expect(shift.hours(DateTime.utc(2030)), 9.5);
    expect(await store.checkOutNow(), contains('not checked in'));
  });

  test('check-in only between 9:00 and 9:30 AM Bangkok time', () async {
    final store = await signedIn('maya');
    backend.now = DateTime.utc(2026, 11, 24, 1, 50); // 8:50 AM
    expect(await store.checkInHere(), contains('9:00 AM to 9:30 AM'));
    backend.now = DateTime.utc(2026, 11, 24, 2, 31); // 9:31 AM
    expect(await store.checkInHere(), contains('9:00 AM to 9:30 AM'));
    backend.now = DateTime.utc(2026, 11, 24, 2, 30); // 9:30 AM
    expect(await store.checkInHere(), isNull);
    expect(store.workHours?.checkInLabel, '9:00 AM–9:30 AM');
    expect(store.workHours?.checkOutLabel, '6:00 PM–8:00 PM');
    expect(
      attendanceStatus(store, store.me, DateTime(2026, 11, 24)),
      'Checked in',
    );
  });

  test('check-out after 8:00 PM is refused', () async {
    final store = await signedIn('maya');
    expect(await store.checkInHere(), isNull);
    backend.now = DateTime.utc(2026, 11, 24, 13, 1); // 8:01 PM
    expect(await store.checkOutNow(), contains('closed at 8:00 PM'));
    expect(store.openShift, isNotNull);
  });

  test(
    'a shift left open from yesterday shows as a missed check-out',
    () async {
      backend.shiftRows.add({
        'id': 's-old',
        'employee_id': 'DH-001',
        'start_at': '2026-11-23T02:05:00Z',
        'end_at': null,
      });
      final auth = FakeAuth(
        accounts: {
          'maya/pw': const AuthRoles(
            employee: {'id': 'DH-001', 'active': true},
          ),
        },
      );
      backend.me = 'DH-001';
      final store = HrStore(
        auth: auth,
        backend: backend,
        location: location,
        clock: () => DateTime.utc(2026, 11, 24, 9),
      );
      expect(await store.signIn('maya', 'pw'), isNull);
      final old = store.shiftFor('DH-001', DateTime(2026, 11, 23))!;
      expect(old.missedCheckOut, isTrue);
      expect(store.openShift, isNull);
      expect(
        attendanceStatus(store, store.me, DateTime(2026, 11, 23)),
        'Missed check-out',
      );
    },
  );

  test('within the window, check-in counts as present', () async {
    final store = await signedIn('maya');
    backend.now = DateTime.utc(2026, 11, 24, 2, 20); // 9:20 AM
    expect(await store.checkInHere(), isNull);
    backend.now = DateTime.utc(2026, 11, 24, 11); // 6:00 PM
    expect(await store.checkOutNow(), isNull);
    expect(
      attendanceStatus(store, store.me, DateTime(2026, 11, 24)),
      'Present',
    );
  });

  test('HR sees everyone’s attendance from Supabase', () async {
    backend.shiftRows.add({
      'id': 's-9',
      'employee_id': 'DH-001',
      'start_at': '2026-11-23T01:55:00Z',
      'end_at': '2026-11-23T10:05:00Z',
    });
    final store = await signedIn('arun');
    final shift = store.shiftFor('DH-001', DateTime(2026, 11, 23))!;
    expect(shift.start.hour, 8);
    expect(shift.start.minute, 55);
    expect(await store.checkInHere(), contains('employee view'));
    backend.shiftRows.add({
      'id': 's-10',
      'employee_id': 'DH-002',
      'start_at': '2026-11-23T02:00:00Z',
      'end_at': null,
    });
    await store.refreshAttendance();
    expect(store.shiftFor('DH-002', DateTime(2026, 11, 23)), isNotNull);
  });

  testWidgets('check-in page shows why check-in was refused', (tester) async {
    tester.view.physicalSize = const Size(402, 874);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final store = await signedIn('maya');
    location.failWith = const LocationFailure(LocationProblem.serviceOff);
    await tester.pumpWidget(MaterialApp(home: LocationPage(store: store)));
    expect(find.text('Rangsit University'), findsOneWidget);
    await tester.tap(find.text('Use my location and check in'));
    await tester.pumpAndSettle();
    expect(find.text('Location unavailable'), findsWidgets);
    expect(find.textContaining('Location services are off'), findsOneWidget);
    await tester.tap(find.text('Open Settings'));
    expect(location.openedSettings, LocationProblem.serviceOff);
    location.failWith = null;
    await tester.tap(find.text('Try again'));
    await tester.pumpAndSettle();
    expect(store.openShift, isNotNull);
  });
}

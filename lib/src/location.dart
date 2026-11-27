import 'dart:async';

import 'package:geolocator/geolocator.dart';

/// One reading of the device's position.
class DeviceLocation {
  const DeviceLocation(this.latitude, this.longitude, {this.accuracy});
  final double latitude, longitude;

  /// Estimated accuracy in metres, if the device reports it.
  final double? accuracy;
}

enum LocationProblem { serviceOff, denied, deniedForever, mocked, unavailable }

class LocationFailure implements Exception {
  const LocationFailure(this.problem);
  final LocationProblem problem;

  /// Whether opening the system settings can fix it.
  bool get needsSettings =>
      problem == LocationProblem.serviceOff ||
      problem == LocationProblem.deniedForever;

  String get message => switch (problem) {
    LocationProblem.serviceOff =>
      'Location services are off. Turn them on in Settings, then try again.',
    LocationProblem.denied =>
      'Location access is needed to check in. Allow access and try again.',
    LocationProblem.deniedForever => 'Location access is turned off for DailyHR. Allow it in Settings, then try again.',
    LocationProblem.mocked =>
      'A simulated location was detected. Turn off mock locations to check in.',
    LocationProblem.unavailable =>
      'Your location couldn’t be found. Move outdoors and try again.',
  };

  @override
  String toString() => 'LocationFailure($problem)';
}

/// Where check-in reads the device's current position from.
abstract class LocationSource {
  /// Asks for permission if needed and returns a fresh position.
  /// Throws [LocationFailure].
  Future<DeviceLocation> current();

  /// Opens the system settings that fix [LocationFailure.needsSettings].
  Future<void> openSettings(LocationProblem problem);
}

class GeolocatorSource implements LocationSource {
  const GeolocatorSource({this.allowSimulated = false});

  /// Accept simulated positions, as the iOS Simulator and Android emulator
  /// report. Only for debug builds; release builds must reject them.
  final bool allowSimulated;

  @override
  Future<DeviceLocation> current() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw const LocationFailure(LocationProblem.serviceOff);
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      throw const LocationFailure(LocationProblem.deniedForever);
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine) {
      throw const LocationFailure(LocationProblem.denied);
    }
    final Position position;
    try {
      position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 20),
        ),
      );
    } on TimeoutException {
      throw const LocationFailure(LocationProblem.unavailable);
    } on LocationServiceDisabledException {
      throw const LocationFailure(LocationProblem.serviceOff);
    } on PermissionDeniedException {
      throw const LocationFailure(LocationProblem.denied);
    }
    if (position.isMocked && !allowSimulated) {
      throw const LocationFailure(LocationProblem.mocked);
    }
    return DeviceLocation(
      position.latitude,
      position.longitude,
      accuracy: position.accuracy,
    );
  }

  @override
  Future<void> openSettings(LocationProblem problem) async {
    if (problem == LocationProblem.serviceOff) {
      await Geolocator.openLocationSettings();
    } else {
      await Geolocator.openAppSettings();
    }
  }
}

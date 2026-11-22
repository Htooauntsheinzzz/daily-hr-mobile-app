# Daily HR mobile application

Daily HR is an employee and payroll management app for iOS and Android. The project currently launches the Flutter starter counter. The planned employee and HR administrator workflows are in [Agent.md](Agent.md). Project decisions are recorded in the [change and decision log](spec-md/00-changes-and-decision.md).

## Local setup

From the directory containing `pubspec.yaml`, use a Flutter SDK with Dart compatible with `^3.13.0`. The starter runs without a backend account.

```sh
flutter doctor -v
flutter pub get
```

## Run on Android

Install the Android SDK through Android Studio. Start an emulator from Device Manager, or connect an Android phone with USB debugging enabled and authorize the computer. If Flutter reports missing Android licenses, run `flutter doctor --android-licenses`.

```sh
flutter devices
flutter run -d <android-device-id>
```

Replace the placeholder, including angle brackets, with the ID shown by Flutter. To create a debug APK for local installation, run `flutter build apk --debug`. The output is `build/app/outputs/flutter-apk/app-debug.apk`.

## Run on iOS

On macOS, install Xcode, complete its first-launch setup, and install an iOS Simulator runtime in Xcode settings. Start a simulated iPhone and use its ID from the device list.

```sh
open -a Simulator
flutter devices
flutter run -d <ios-device-id>
```

For a physical iPhone, trust the Mac, enable Developer Mode on the phone, and open `ios/Runner.xcworkspace` in Xcode. Select your development team under Runner → Signing & Capabilities and use a bundle identifier registered to your team. Run the same Flutter command with the iPhone's device ID.

## Development checks

```sh
flutter analyze
flutter test
flutter build apk --debug
flutter build ios --simulator
```

The widget test exercises the starter counter. The two build commands check the native runners. Use the run commands above to check a workflow interactively on each platform.

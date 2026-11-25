// Run with: flutter test tool/generate_icons.dart
// Renders the original Figma vector into the native launcher icon slots.
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('export source brand icon', () async {
    final svg = await File('assets/logos/app_forest.svg').readAsString();
    final source = await vg.loadPicture(SvgStringLoader(svg), null);
    Future<void> write(String path, int size) async {
      final recorder = ui.PictureRecorder();
      final canvas = ui.Canvas(recorder);
      canvas.drawColor(const ui.Color(0xFF35594C), ui.BlendMode.src);
      canvas.scale(size / source.size.width, size / source.size.height);
      canvas.drawPicture(source.picture);
      final picture = recorder.endRecording();
      final image = await picture.toImage(size, size);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      await File(path).writeAsBytes(bytes!.buffer.asUint8List());
      image.dispose();
      picture.dispose();
    }

    for (final entry in {
      'mdpi': 48,
      'hdpi': 72,
      'xhdpi': 96,
      'xxhdpi': 144,
      'xxxhdpi': 192,
    }.entries) {
      await write(
        'android/app/src/main/res/mipmap-${entry.key}/ic_launcher.png',
        entry.value,
      );
    }
    const root = 'ios/Runner/Assets.xcassets/AppIcon.appiconset';
    final manifest = jsonDecode(
      await File('$root/Contents.json').readAsString(),
    );
    for (final entry in manifest['images'] as List) {
      final size = double.parse((entry['size'] as String).split('x').first);
      final scale = double.parse(
        (entry['scale'] as String).replaceAll('x', ''),
      );
      await write('$root/${entry['filename']}', (size * scale).round());
    }
    source.picture.dispose();
  });
}

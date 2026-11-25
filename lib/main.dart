import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DailyHrApp(store: await HrStore.load()));
}

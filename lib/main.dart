import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/app.dart';
import 'src/auth.dart';
import 'src/backend.dart';
import 'src/location.dart';
import 'src/store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    publishableKey: dotenv.env['SUPABASE_PUBLISHABLE_KEY']!,
  );
  final client = Supabase.instance.client;
  runApp(
    DailyHrApp(
      store: await HrStore.load(
        auth: SupabaseAuthGateway(client),
        backend: SupabaseHrBackend(client),
        // Simulators always report a simulated position, so debug builds
        // accept it. Release builds reject fake GPS.
        location: const GeolocatorSource(allowSimulated: kDebugMode),
      ),
    ),
  );
}

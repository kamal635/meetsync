import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetsync/src/core/supabase/supabase_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = String.fromEnvironment(
    'MEETSYNC_SUPABASE_URL',
  );

  const supabaseAnonKey = String.fromEnvironment(
    'MEETSYNC_SUPABASE_ANON_KEY',
  );

  if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
    throw Exception(
      '''Missing Supabase config. Provide MEETSYNC_SUPABASE_URL and MEETSYNC_SUPABASE_ANON_KEY via --dart-define.''',
    );
  }

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  final client = Supabase.instance.client;
  runApp(
    ProviderScope(
      overrides: [
        supabaseClientProvider.overrideWithValue(client),
      ],
      child: const MyApp(),
    ),
  );
}

///
class MyApp extends StatelessWidget {
  ///
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

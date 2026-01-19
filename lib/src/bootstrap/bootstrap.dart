import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetsync/src/core/supabase/supabase_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Bootstraps the application and returns a [ProviderScope]
/// with necessary overrides.
Future<ProviderScope> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = String.fromEnvironment('MEETSYNC_SUPABASE_URL');
  const supabaseAnonKey = String.fromEnvironment('MEETSYNC_SUPABASE_ANON_KEY');

  // if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
  //   throw Exception(
  //     'Missing Supabase config. Provide MEETSYNC_SUPABASE_URL and '
  //     'MEETSYNC_SUPABASE_ANON_KEY via --dart-define.',
  //   );
  // }

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

  final client = Supabase.instance.client;

  return ProviderScope(
    overrides: [
      supabaseClientProvider.overrideWithValue(client),
    ],
    child: const SizedBox.shrink(), // placeholder, we replace in main
  );
}

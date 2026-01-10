import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetsync/src/core/network/dio_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A Riverpod providers for Supabase client and auth callbacks.
final Provider<SupabaseClient> supabaseClientProvider = Provider((ref) {
  throw UnimplementedError('supabaseClientProvider must be overridden in main');
});

/// A Riverpod provider that supplies
///  a configured Dio client for network requests.
final readAccessTokenProvider = Provider<ReadAccessToken>((ref) {
  final client = ref.read(supabaseClientProvider);
  return () async => client.auth.currentSession?.accessToken;
});

/// A Riverpod provider that supplies
final refreshSessionProvider = Provider<RefreshSession>((ref) {
  final client = ref.read(supabaseClientProvider);
  return () async {
    await client.auth.refreshSession();
  };
});

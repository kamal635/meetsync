import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetsync/src/core/network/dio_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<SupabaseClient> supabaseClientProvider = Provider((ref) {
  throw UnimplementedError('supabaseClientProvider must be overridden in main');
});

final readAccessTokenProvider = Provider<ReadAccessToken>((ref) {
  final client = ref.read(supabaseClientProvider);
  return () async => client.auth.currentSession?.accessToken;
});

final refreshSessionProvider = Provider<RefreshSession>((ref) {
  final client = ref.read(supabaseClientProvider);
  return () async {
    await client.auth.refreshSession();
  };
});

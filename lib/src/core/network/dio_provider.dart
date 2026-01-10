import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetsync/src/core/network/dio_client.dart';
import 'package:meetsync/src/core/supabase/supabase_providers.dart';

/// A Riverpod provider that supplies
/// a configured Dio client for network requests.
final networkDioProvider = Provider<Dio>((ref) {
  final readAccessToken = ref.read(readAccessTokenProvider);
  final refreshSession = ref.read(refreshSessionProvider);
  return createDioClient(
    readAccessToken: readAccessToken,
    refreshSession: refreshSession,
  );
});

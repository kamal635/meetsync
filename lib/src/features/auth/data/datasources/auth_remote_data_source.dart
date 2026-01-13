import 'package:supabase_flutter/supabase_flutter.dart';

/// Remote data source for authentication operations.
/// Talks directly to Supabase SDK.
// ignore: one_member_abstracts
abstract interface class AuthRemoteDataSource {
  /// Signs in a user with email and password.
  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
  });
}

/// Implementation of [AuthRemoteDataSource] using Supabase.
final class SupabaseAuthRemoteDataSource implements AuthRemoteDataSource {
  /// Constructor for [SupabaseAuthRemoteDataSource].
  const SupabaseAuthRemoteDataSource(this._client);

  final SupabaseClient _client;

  @override
  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }
}

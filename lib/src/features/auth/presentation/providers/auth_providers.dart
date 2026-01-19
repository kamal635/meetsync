import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetsync/src/core/supabase/supabase_providers.dart';
import 'package:meetsync/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:meetsync/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:meetsync/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:meetsync/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';

/// Provides the remote data source for auth (Supabase).
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final client = ref.read(supabaseClientProvider);
  return SupabaseAuthRemoteDataSource(client);
});

/// Provides the auth repository implementation.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = ref.read(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remote: remote);
});

/// Provides the sign-in usecase.
final signInWithEmailPasswordUsecaseProvider =
    Provider<SignInWithEmailPasswordUsecase>((ref) {
      final repo = ref.read(authRepositoryProvider);
      return SignInWithEmailPasswordUsecase(repository: repo);
    });

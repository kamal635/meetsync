import 'package:meetsync/src/core/errors/error_mapper.dart';
import 'package:meetsync/src/core/errors/result.dart';
import 'package:meetsync/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:meetsync/src/features/auth/domain/repositories/auth_repository.dart';

/// Supabase-backed implementation of [AuthRepository].
final class AuthRepositoryImpl implements AuthRepository {
  /// Constructor for [AuthRepositoryImpl].
  const AuthRepositoryImpl({
    required AuthRemoteDataSource remote,
  }) : _remote = remote;

  final AuthRemoteDataSource _remote;

  @override
  Future<ResultVoid> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _remote.signInWithEmailPassword(
        email: email,
        password: password,
      );
      return okVoid;
    } on Object catch (e, st) {
      return Err(mapToFailure(e, st));
    }
  }
}

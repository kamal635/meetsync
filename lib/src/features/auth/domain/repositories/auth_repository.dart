import 'package:meetsync/src/core/errors/result.dart';

/// Repository interface for authentication-related operations.
// ignore: one_member_abstracts
abstract interface class AuthRepository {
  /// Signs in a user using email and password.
  Future<ResultVoid> signInWithEmailPassword({
    required String email,
    required String password,
  });
}

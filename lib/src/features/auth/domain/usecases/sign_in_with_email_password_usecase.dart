import 'package:meetsync/src/core/errors/result.dart';
import 'package:meetsync/src/features/auth/domain/repositories/auth_repository.dart';

/// Usecase for signing in a user with email and password.
class SignInWithEmailPasswordUsecase {
  /// Constructor for [SignInWithEmailPasswordUsecase].
  const SignInWithEmailPasswordUsecase({required this.repository});

  /// The authentication repository.
  final AuthRepository repository;

  /// Executes the usecase to sign in a user.
  Future<ResultVoid> call({
    required String email,
    required String password,
  }) {
    return repository.signInWithEmailPassword(
      email: email,
      password: password,
    );
  }
}

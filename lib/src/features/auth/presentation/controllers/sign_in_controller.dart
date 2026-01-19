import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetsync/src/core/errors/failure.dart';
import 'package:meetsync/src/core/errors/result.dart';
import 'package:meetsync/src/features/auth/presentation/providers/auth_providers.dart';

/// State for the sign-in screen.
final class SignInState {
  /// Constructor for [SignInState].
  const SignInState({
    this.isLoading = false,
    this.failure,
  });

  /// Whether a sign-in operation is in progress.
  final bool isLoading;

  /// Failure encountered during sign-in, if any.
  final Failure? failure;

  /// Creates a copy of this state with the given fields replaced by new values.
  SignInState copyWith({
    bool? isLoading,
    Failure? failure,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
    );
  }
}

/// Controller that handles sign-in action.
final class SignInController extends Notifier<SignInState> {
  @override
  SignInState build() => const SignInState();

  /// Attempts to sign in a user with the given email and password.
  Future<ResultVoid> signIn({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);

    final usecase = ref.read(signInWithEmailPasswordUsecaseProvider);
    final result = await usecase(email: email, password: password);

    state = result.fold(
      onOk: (_) => state.copyWith(isLoading: false),
      onErr: (f) => state.copyWith(isLoading: false, failure: f),
    );

    return result;
  }
}

/// Provider for the [SignInController].
final signInControllerProvider =
    NotifierProvider<SignInController, SignInState>(SignInController.new);

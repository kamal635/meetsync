import 'package:meetsync/src/core/errors/failure.dart';

/// A simple result type used across the app.
/// Either returns [Ok] with a value, or [Err] with a [Failure].
sealed class Result<T> {
  const Result();

  /// Pattern match on the result.
  R fold<R>({
    required R Function(T value) onOk,
    required R Function(Failure failure) onErr,
  });

  /// Whether this result is ok.
  bool get isOk => this is Ok<T>;

  /// Whether this result is an error.
  bool get isErr => this is Err<T>;

  /// Returns the value if ok, or null if err.
  T? get okOrNull => this is Ok<T> ? (this as Ok<T>).value : null;

  /// Returns the failure if err, or null if ok.
  Failure? get errOrNull => this is Err<T> ? (this as Err<T>).failure : null;
}

/// Success result.
final class Ok<T> extends Result<T> {
  /// Creates an Ok result.
  const Ok(this.value);

  /// The success value.
  final T value;

  @override
  R fold<R>({
    required R Function(T value) onOk,
    required R Function(Failure failure) onErr,
  }) {
    return onOk(value);
  }
}

/// Failure result.
final class Err<T> extends Result<T> {
  /// Creates an Err result.
  const Err(this.failure);

  /// The failure.
  final Failure failure;

  @override
  R fold<R>({
    required R Function(T value) onOk,
    required R Function(Failure failure) onErr,
  }) {
    return onErr(failure);
  }
}

/// A convenience type for operations that don't return a meaningful value.
typedef ResultVoid = Result<void>;

/// A convenience ok value for void results.
const okVoid = Ok<void>(null);

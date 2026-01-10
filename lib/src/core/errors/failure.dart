/// Core failure types used across the app.
/// This keeps UI and domain layers independent from low-level exceptions.
enum FailureCode {
  /// Generic network error.
  network,

  /// Authentication error.
  unauthorized,

  //// Validation error.
  validation,

  /// Too many requests.
  rateLimited,

  /// Request
  timeout,

  //// Any other
  unknown,
}

/// A domain-friendly error that can be returned from repositories/usecases.
/// Never throw this to the UI; return it as a value (e.g., Either/Result).
sealed class Failure implements Exception {
  /// Creates a Failure instance.
  const Failure({
    required this.code,
    this.message,
    this.cause,
    this.stackTrace,
  });

  /// The failure code.
  final FailureCode code;

  /// Human-readable message (optional).
  /// Prefer showing UI messages based on [code] rather than this string.
  final String? message;

  /// Original exception or error object for understandability/logging.
  final Object? cause;

  /// Optional stack trace captured at the time the failure was created.
  final StackTrace? stackTrace;

  @override
  String toString() {
    final m = message;
    return 'Failure(code: $code, message: ${m ?? "-"}, cause: $cause)';
  }
}

/// Network connectivity / DNS / socket / no internet.
class NetworkFailure extends Failure {
  /// Creates a NetworkFailure instance.
  const NetworkFailure({
    super.message,
    super.cause,
    super.stackTrace,
  }) : super(
         code: FailureCode.network,
       );
}

/// Authentication required or credentials invalid.
class UnauthorizedFailure extends Failure {
  /// Creates an UnauthorizedFailure instance.
  const UnauthorizedFailure({
    super.message,
    super.cause,
    super.stackTrace,
  }) : super(
         code: FailureCode.unauthorized,
       );
}

/// Client-side validation failure (e.g., empty fields, bad email format).
class ValidationFailure extends Failure {
  /// Creates a ValidationFailure instance.
  const ValidationFailure({
    super.message,
    super.cause,
    super.stackTrace,
  }) : super(
         code: FailureCode.validation,
       );
}

/// Too many requests / throttling.
class RateLimitedFailure extends Failure {
  /// Creates a RateLimitedFailure instance.
  const RateLimitedFailure({
    super.message,
    super.cause,
    super.stackTrace,
  }) : super(
         code: FailureCode.rateLimited,
       );
}

/// Request timed out (connect/send/receive).
class TimeoutFailure extends Failure {
  /// Creates a TimeoutFailure instance.
  const TimeoutFailure({
    super.message,
    super.cause,
    super.stackTrace,
  }) : super(
         code: FailureCode.timeout,
       );
}

/// Any unclassified failure.
class UnknownFailure extends Failure {
  /// Creates an UnknownFailure instance.
  const UnknownFailure({
    super.message,
    super.cause,
    super.stackTrace,
  }) : super(
         code: FailureCode.unknown,
       );
}

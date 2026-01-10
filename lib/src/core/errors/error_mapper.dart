import 'package:dio/dio.dart';
import 'package:meetsync/src/core/errors/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Maps low-level errors/exceptions (Dio/Supabase/other) into domain-friendly [Failure].
///
/// UI should depend on [Failure.code] rather than reading exception types/messages.
/// This mapper lives in core so repositories
// can convert thrown exceptions into Failures.
Failure mapToFailure(
  Object error, [
  StackTrace? stackTrace,
]) {
  // If it's already a Failure, keep it.
  if (error is Failure) return error;

  // Dio errors (API calls, networking, timeouts, etc.)
  if (error is DioException) {
    return _mapDioException(error, stackTrace);
  }

  // Supabase Auth errors (sign-in/sign-up/refresh, etc.)
  if (error is AuthException) {
    return _mapAuthException(error, stackTrace);
  }

  // Supabase database errors (later features: RPC/DB queries)
  if (error is PostgrestException) {
    return _mapPostgrestException(error, stackTrace);
  }

  // Fallback
  return UnknownFailure(
    message: 'Unexpected error',
    cause: error,
    stackTrace: stackTrace,
  );
}

Failure _mapDioException(DioException e, StackTrace? st) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return TimeoutFailure(
        message: 'Request timed out',
        cause: e,
        stackTrace: st,
      );

    case DioExceptionType.connectionError:
      // Typically SocketException / DNS / no internet.
      return NetworkFailure(
        message: 'Network error',
        cause: e,
        stackTrace: st,
      );

    case DioExceptionType.badResponse:
      final status = e.response?.statusCode;

      if (status == 401 || status == 403) {
        return UnauthorizedFailure(
          message: 'Unauthorized',
          cause: e,
          stackTrace: st,
        );
      }

      if (status == 429) {
        return RateLimitedFailure(
          message: 'Too many requests',
          cause: e,
          stackTrace: st,
        );
      }

      if (status == 400 || status == 422) {
        return ValidationFailure(
          message: 'Invalid request',
          cause: e,
          stackTrace: st,
        );
      }

      return UnknownFailure(
        message: status == null ? 'Bad response' : 'HTTP $status',
        cause: e,
        stackTrace: st,
      );

    case DioExceptionType.cancel:
      // We don't have a dedicated FailureCode.cancelled yet.
      return UnknownFailure(
        message: 'Request cancelled',
        cause: e,
        stackTrace: st,
      );

    case DioExceptionType.badCertificate:
      return UnknownFailure(
        message: 'Bad certificate',
        cause: e,
        stackTrace: st,
      );

    case DioExceptionType.unknown:
      // Sometimes e.error contains SocketException or other errors.
      final inner = e.error;
      if (inner != null && inner.toString().toLowerCase().contains('socket')) {
        return NetworkFailure(
          message: 'Network error',
          cause: e,
          stackTrace: st,
        );
      }

      return UnknownFailure(
        message: 'Unknown network error',
        cause: e,
        stackTrace: st,
      );
  }
}

Failure _mapAuthException(AuthException e, StackTrace? st) {
  final code = e.code?.trim();
  final status = _tryParseInt(e.statusCode);

  // Prefer codes when available (e.g., invalid_credentials).
  if (code == 'invalid_credentials') {
    return UnauthorizedFailure(
      message: e.message,
      cause: e,
      stackTrace: st,
    );
  }

  // Sometimes code is null; fall back to HTTP status.
  if (status == 401 || status == 403) {
    return UnauthorizedFailure(
      message: e.message,
      cause: e,
      stackTrace: st,
    );
  }

  if (status == 429) {
    return RateLimitedFailure(
      message: e.message,
      cause: e,
      stackTrace: st,
    );
  }

  // Supabase can return 400 for auth errors too,
  // but this is a reasonable default.
  if (status == 400 || status == 422) {
    // If message suggests invalid credentials, treat it as unauthorized.
    final msg = e.message.toLowerCase();
    final looksLikeInvalidCreds =
        msg.contains('invalid login credentials') ||
        msg.contains('invalid credentials');

    return looksLikeInvalidCreds
        ? UnauthorizedFailure(message: e.message, cause: e, stackTrace: st)
        : ValidationFailure(message: e.message, cause: e, stackTrace: st);
  }

  // No status -> unknown
  return UnknownFailure(
    message: e.message,
    cause: e,
    stackTrace: st,
  );
}

Failure _mapPostgrestException(PostgrestException e, StackTrace? st) {
  // For now: keep it generic. We'll refine when we start DB features (RPC/queries).
  // Postgrest exceptions include a 'code' and 'message' fields.
  final code = e.code?.trim();

  // Some Postgres error codes can indicate validation/constraint errors.
  // Example:Unique violation : 23505
  // Not null violation:23502
  //Foreign key violation: 23503 .
  final isConstraint = code == '23505' || code == '23502' || code == '23503';

  return isConstraint
      ? ValidationFailure(message: e.message, cause: e, stackTrace: st)
      : UnknownFailure(message: e.message, cause: e, stackTrace: st);
}

int? _tryParseInt(String? value) {
  if (value == null) return null;
  return int.tryParse(value.trim());
}

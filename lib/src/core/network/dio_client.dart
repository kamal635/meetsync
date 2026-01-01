import 'package:dio/dio.dart';

/// The base URL for the MeetSync API, configurable via environment variable.
const apiBaseUrl = String.fromEnvironment(
  'MEETSYNC_API_BASE_URL',
  defaultValue: 'https://api.example.com',
);

/// A callback that returns the current access token (or null if not available).
typedef ReadAccessToken = Future<String?> Function();

/// A callback that refreshes the current session.
typedef RefreshSession = Future<void> Function();

/// Creates a Dio client configured for the MeetSync API.
Dio createDioClient({
  required ReadAccessToken readAccessToken,
  required RefreshSession refreshSession,
}) {
  final options = BaseOptions(
    baseUrl: apiBaseUrl,
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 20),
    headers: const {
      'Accept': 'application/json',
    },
  );

  final dio = Dio(options);

  dio.interceptors.addAll([
    AuthHeaderInterceptor(
      readAccessToken: readAccessToken,
    ),
    RefreshOn401Interceptor(
      refreshSession: refreshSession,
      dio: dio,
    ),
  ]);

  return dio;
}

/// An interceptor that adds the Authorization header to requests that need it.
class AuthHeaderInterceptor extends Interceptor {
  /// Creates an [AuthHeaderInterceptor].
  AuthHeaderInterceptor({
    required this.readAccessToken,
  });

  /// A callback that returns the current access token.
  final ReadAccessToken readAccessToken;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // By default, requests require auth unless explicitly disabled.
    final requiresAuth = options.extra['requiresAuth'] as bool? ?? true;

    // Respect requests that don't need auth (e.g., sign-in, sign-up).
    if (!requiresAuth) {
      handler.next(options);
      return;
    }

    // Respect a manually-set Authorization header.
    final hasAuthHeader = options.headers.keys.any(
      (k) => k.toLowerCase() == 'authorization',
    );

    if (hasAuthHeader) {
      handler.next(options);
      return;
    }

    final token = await readAccessToken();
    final trimmed = token?.trim();

    if (trimmed != null && trimmed.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $trimmed';
    }

    handler.next(options);
  }
}

//////----------------------------------------------------------------------

/// An interceptor that attempts to refresh the session on 401 responses.
class RefreshOn401Interceptor extends Interceptor {
  /// Creates a [RefreshOn401Interceptor].
  RefreshOn401Interceptor({
    required this.dio,
    required this.refreshSession,
  });

  /// The Dio client.
  final Dio dio;

  /// A callback that refreshes the current session.
  final RefreshSession refreshSession;

  /// The ongoing refresh operation, if any.
  Future<void>? _refreshing;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;

    final requiresAuth =
        err.requestOptions.extra['requiresAuth'] as bool? ?? true;

    final retried = err.requestOptions.extra['retried'] as bool? ?? false;

    final shouldHandle = statusCode == 401 && requiresAuth && !retried;

    if (!shouldHandle) {
      handler.next(err);
      return;
    }

    /// Attempt to refresh the session.
    Future<void>? refreshing;

    try {
      refreshing = _refreshing ??= refreshSession().timeout(
        const Duration(seconds: 15),
      );
      await refreshing;
    } on Object catch (_) {
      handler.next(err);
      return;
    } finally {
      if (refreshing != null && identical(_refreshing, refreshing)) {
        _refreshing = null;
      }
    }

    // Mark as retried to avoid infinite loops.
    err.requestOptions.extra['retried'] = true;

    // Remove old Authorization so AuthHeaderInterceptor
    // can inject the new token.
    _removeAuthHeader(err.requestOptions);

    try {
      final response = await dio.fetch<dynamic>(err.requestOptions);
      handler.resolve(response);
      return;
    } on DioException catch (e) {
      handler.next(e);
      return;
    } on Object catch (_) {
      handler.next(err);
      return;
    }
  }

  void _removeAuthHeader(RequestOptions options) {
    final keys = options.headers.keys.toList();
    for (final k in keys) {
      if (k.toLowerCase() == 'authorization') {
        options.headers.remove(k);
      }
    }
  }
}

import 'package:dio/dio.dart';
import 'package:mainframe_app/core/errors/exceptions.dart';
import 'package:mainframe_app/core/errors/failures.dart';

/// Maps a [DioException] to a typed [AppException].
/// Called exclusively inside [genericDataSourceMethod] — never call directly.
AppException mapDioException(DioException e) {
  final status = e.response?.statusCode;
  final message = e.response?.data is Map
      ? e.response?.data['message'] as String? ?? 'Server error.'
      : 'Server error.';

  return switch (status) {
    400 => ValidationException(message: message),
    401 => AuthenticationException(),
    403 => PermissionException(),
    404 => ServerException(message: 'Resource not found.', code: 404),
    422 => ValidationException(message: message),
    429 => ServerException(
      message: 'Too many requests. Please slow down.',
      code: 429,
    ),
    500 => ServerException(code: 500),
    502 => ServerException(message: 'Upstream service unavailable.', code: 502),
    _ => ServerException(message: e.message ?? 'Server error.'),
  };
}

/// Converts an [AppException] into its matching domain [Failure].
/// Called exclusively inside [genericRepositoryMethod] / [cacheOperation].
Failure mapFailure(AppException e) {
  return switch (e) {
    ServerException() => ServerFailure(message: e.message, code: e.code),
    AuthenticationException() => AuthenticationFailure(message: e.message),
    ValidationException() => ValidationFailure(message: e.message),
    NetworkException() => NetworkFailure(message: e.message),
    PermissionException() => PermissionFailure(message: e.message),
    CacheException() => CacheFailure(message: e.message),
    LocalStorageException() => LocalStorageFailure(message: e.message),
    ResponseException() => ResponseFailure(message: e.message),
    _ => UnknownFailure(message: e.message),
  };
}

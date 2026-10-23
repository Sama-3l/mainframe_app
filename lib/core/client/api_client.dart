import 'package:dio/dio.dart';
import 'package:mainframe_app/core/constants/constants.dart';
import 'package:mainframe_app/core/services/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService storage;
  final void Function() onUnauthorized;

  AuthInterceptor(this.storage, this.onUnauthorized);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // /pair is the only unauthenticated call
    if (!options.path.endsWith('/pair')) {
      final token = await storage.read(AppConstants.deviceToken);
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 &&
        !err.requestOptions.path.endsWith('/pair')) {
      onUnauthorized(); // clear storage, route to the scan screen
    }
    handler.next(err);
  }
}

class ApiClient {
  static Dio createDio(SecureStorageService storage) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final url = await storage.read(AppConstants.apiURL);
          if (url == null || url.isEmpty) {
            return handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.cancel,
                error: 'API URL not configured',
              ),
            );
          }
          options.baseUrl = url;
          handler.next(options);
        },
      ),
      AuthInterceptor(storage, () {}),
    ]);
    return dio;
  }
}

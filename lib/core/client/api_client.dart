import 'package:dio/dio.dart';
import 'package:mainframe_app/core/constants/constants.dart';
import 'package:mainframe_app/core/services/secure_storage.dart';

class ApiClient {
  static Dio createDio(SecureStorageService storage) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
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
    );
    return dio;
  }
}

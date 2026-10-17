import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.get('API_URL'),
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    return dio;
  }
}

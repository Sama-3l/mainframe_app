import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mainframe_app/core/errors/error_map.dart';
import 'package:mainframe_app/core/errors/exceptions.dart';

/// Wraps any [ApiService] (Retrofit/Dio) call.
/// Guarantees that only [AppException] subclasses escape this function.
///
/// Use for every [RemoteDataSourceImpl] method that calls [ApiService].
/// DO NOT use for SDK datasources (Supabase, Firebase) — those handle
/// their own SDK-specific exceptions with direct try/catch blocks.
Future<T> genericDataSourceMethod<T>({
  required Future<T> Function() method,
}) async {
  try {
    return await method();
  } on AppException {
    rethrow;
  } on SocketException {
    throw NetworkException();
  } on TimeoutException {
    throw NetworkException(message: 'Request timed out.');
  } on DioException catch (e) {
    throw mapDioException(e);
  } on FormatException catch (e) {
    // malformed JSON string itself (jsonDecode failed)
    throw ResponseException(
      message: 'Invalid JSON received from server.',
      originalError: e,
    );
  } on TypeError catch (e) {
    // fromJson() got a field of the wrong type / missing required field
    throw ResponseException(
      message: 'Failed to parse response into expected model.',
      originalError: e,
    );
  } catch (e) {
    throw UnknownException();
  }
}

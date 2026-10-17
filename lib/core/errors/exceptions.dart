import 'package:flutter/foundation.dart';

/// Abstract exceptions class
abstract class AppException implements Exception {
  final String message;
  final int? code;

  AppException({required this.message, this.code});
}

class ServerException extends AppException {
  ServerException({super.message = "Server error occurred", super.code});
}

class CacheException extends AppException {
  CacheException({super.message = "Cache error occurred"});
}

class NetworkException extends AppException {
  NetworkException({super.message = "No internet connection"});
}

class AuthenticationException extends AppException {
  AuthenticationException({super.message = "Authentication failed"});
}

class ValidationException extends AppException {
  ValidationException({required super.message});
}

class PermissionException extends AppException {
  PermissionException({super.message = "Permission denied"});
}

class FileException extends AppException {
  FileException({super.message = "File error occurred"});
}

class UnknownException extends AppException {
  UnknownException({super.message = "Something went wrong"});
}

class ResponseException extends AppException {
  ResponseException({String? message, this.originalError})
    : super(
        message: kDebugMode
            ? (message ??
                  "Backend response changed or something is wrong with your fromJson method"
                      "${originalError != null ? '\n\nDetails: $originalError' : ''}")
            : "Something is wrong",
      );

  final Object? originalError;
}

class LocalStorageException extends AppException {
  LocalStorageException({
    String message = "Something went wrong. Please try again.",
  }) : super(
         message: kDebugMode
             ? message
             : "Something went wrong. Please try again.",
       );
}

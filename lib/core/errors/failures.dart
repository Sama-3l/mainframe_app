/// Abstract class for Failures in the Domain Layer
abstract class Failure {
  final String message;
  final int? code;

  Failure({required this.message, this.code});
}

// -------------------------
// Common Failures
// -------------------------

class ServerFailure extends Failure {
  ServerFailure({String message = "Server error occurred", int? code})
    : super(message: message, code: code);
}

class CacheFailure extends Failure {
  CacheFailure({String message = "Cache error occurred", int? code})
    : super(message: message, code: code);
}

class NetworkFailure extends Failure {
  NetworkFailure({String message = "No internet connection", int? code})
    : super(message: message, code: code);
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({String message = "Authentication failed", int? code})
    : super(message: message, code: code);
}

class ValidationFailure extends Failure {
  ValidationFailure({required String message}) : super(message: message);
}

class PermissionFailure extends Failure {
  PermissionFailure({String message = "Permission denied"})
    : super(message: message);
}

class FileFailure extends Failure {
  FileFailure({String message = "File error occurred"})
    : super(message: message);
}

class UnknownFailure extends Failure {
  UnknownFailure({String message = "Something went wrong"})
    : super(message: message);
}

class ResponseFailure extends Failure {
  ResponseFailure({String message = "Something went wrong"})
    : super(message: message);
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({String message = "Something went wrong"})
    : super(message: message);
}

class NoFailure extends Failure {
  NoFailure({required super.message});
}

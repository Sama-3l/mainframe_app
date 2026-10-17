abstract class ApiStatus<T> {
  const ApiStatus();

  /// ✅ Factory constructors
  factory ApiStatus.none() => ApiNone<T>();
  factory ApiStatus.success([T? data]) => ApiSuccess<T>(data);
  factory ApiStatus.error(String message) => ApiError<T>(message);

  /// ✅ Pattern matching
  R when<R>({
    required R Function() none,
    required R Function(T? data) success,
    required R Function(String message) error,
  });

  R? whenOrNull<R>({
    R Function()? none,
    R Function(T? data)? success,
    R Function(String message)? error,
  });
}

/// ✅ None state
class ApiNone<T> extends ApiStatus<T> {
  const ApiNone();

  @override
  R when<R>({
    required R Function() none,
    required R Function(T? data) success,
    required R Function(String message) error,
  }) {
    return none();
  }

  @override
  R? whenOrNull<R>({
    R Function()? none,
    R Function(T? data)? success,
    R Function(String message)? error,
  }) {
    return none?.call();
  }
}

/// ✅ Success state
class ApiSuccess<T> extends ApiStatus<T> {
  final T? data;
  const ApiSuccess([this.data]);

  @override
  R when<R>({
    required R Function() none,
    required R Function(T? data) success,
    required R Function(String message) error,
  }) {
    return success(data);
  }

  @override
  R? whenOrNull<R>({
    R Function()? none,
    R Function(T? data)? success,
    R Function(String message)? error,
  }) {
    return success?.call(data);
  }
}

/// ✅ Error state
class ApiError<T> extends ApiStatus<T> {
  final String message;
  const ApiError(this.message);

  @override
  R when<R>({
    required R Function() none,
    required R Function(T? data) success,
    required R Function(String message) error,
  }) {
    return error(message);
  }

  @override
  R? whenOrNull<R>({
    R Function()? none,
    R Function(T? data)? success,
    R Function(String message)? error,
  }) {
    return error?.call(message);
  }
}

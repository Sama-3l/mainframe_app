import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

/// Models the `pagination` object present in all paginated collection responses.
///
/// Global Envelope — Paginated Collection:
/// ```json
/// {
///   "page": 1,
///   "limit": 20,
///   "total": 100,
///   "totalPages": 5,
///   "hasNextPage": true,
///   "hasPrevPage": false
/// }
/// ```
@JsonSerializable()
class PaginationMeta {
  @JsonKey(fromJson: _intFromJson)
  final int page;

  @JsonKey(fromJson: _intFromJson)
  final int limit;

  @JsonKey(fromJson: _intFromJson)
  final int total;

  @JsonKey(fromJson: _intFromJson)
  final int totalPages;

  // Missing from the response entirely when there are no results —
  // default to false rather than throwing. Supports both hasNextPage and hasNext.
  @JsonKey(defaultValue: false)
  final bool hasNextPage;

  @JsonKey(readValue: _readHasPrevPage, defaultValue: false)
  final bool hasPrevPage;

  static Object? _readHasPrevPage(Map json, String key) =>
      json['hasPrevPage'] ?? json['hasPreviousPage'];

  const PaginationMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationMetaToJson(this);

  bool get canLoadMore => hasNextPage;

  @override
  String toString() =>
      'PaginationMeta(page: $page, limit: $limit, total: $total, '
      'totalPages: $totalPages, hasNextPage: $hasNextPage, hasPrevPage: $hasPrevPage)';
}

// Add near the bottom with your other converters (_dateTimeFromJson etc.)
int _intFromJson(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

/// Models the Global Envelope returned by every API endpoint.
///
/// **Standard response:**
/// ```json
/// { "success": true, "message": "...", "data": { ... }, "timestamp": "ISO8601" }
/// ```
///
/// **Paginated collection response:**
/// ```json
/// { "success": true, "message": "...", "data": [ ... ], "pagination": { ... }, "timestamp": "ISO8601" }
/// ```
///
/// **Error response:**
/// ```json
/// { "success": false, "message": "...", "timestamp": "ISO8601" }
/// ```
///
/// Uses `@JsonSerializable(genericArgumentFactories: true)` so that
/// Retrofit's generated code can deserialise `ApiResponse<SomeModel>` directly.
/// The generated factory signature is:
/// ```dart
/// ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json, T Function(Object?) fromJsonT)
/// ```
/// which Retrofit invokes automatically when the method return type is `Future<ApiResponse<SomeModel>>`.
@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final String message;
  final bool success;
  final T? data;

  /// Present on every response. Reflects when the server handled the request.
  @JsonKey(
    fromJson: _dateTimeFromJson,
    toJson: _dateTimeToJson,
    includeIfNull: false,
  )
  final DateTime? timestamp;

  /// Non-null only for paginated collection endpoints.
  /// Supports both 'pagination' and 'meta' envelope keys.
  @JsonKey(readValue: _readPagination, includeIfNull: false)
  final PaginationMeta? pagination;

  static Object? _readPagination(Map json, String key) =>
      json['pagination'] ?? json['meta'];

  const ApiResponse({
    required this.message,
    required this.success,
    this.data,
    this.timestamp,
    this.pagination,
  });

  // ---------------------------------------------------------------------------
  // Convenience constructors
  // ---------------------------------------------------------------------------

  /// Response that carries a data payload.
  factory ApiResponse.withData({
    required String message,
    required bool success,
    required T data,
    DateTime? timestamp,
    PaginationMeta? pagination,
  }) {
    return ApiResponse(
      message: message,
      success: success,
      data: data,
      timestamp: timestamp,
      pagination: pagination,
    );
  }

  /// Response with no data payload (e.g. delete operations).
  factory ApiResponse.noData({
    required String message,
    required bool success,
    DateTime? timestamp,
  }) {
    return ApiResponse(
      message: message,
      success: success,
      data: null,
      timestamp: timestamp,
    );
  }

  // ---------------------------------------------------------------------------
  // Generated serialisation
  // ---------------------------------------------------------------------------

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Whether this response represents a paginated collection.
  bool get isPaginated => pagination != null;

  /// Whether there are more pages to load.
  bool get hasNextPage => pagination?.hasNextPage ?? false;
}

// ---------------------------------------------------------------------------
// Private DateTime converters used by @JsonKey above.
// ---------------------------------------------------------------------------

DateTime? _dateTimeFromJson(Object? value) =>
    value is String ? DateTime.tryParse(value) : null;

String? _dateTimeToJson(DateTime? value) => value?.toIso8601String();

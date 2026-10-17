// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    PaginationMeta(
      page: _intFromJson(json['page']),
      limit: _intFromJson(json['limit']),
      total: _intFromJson(json['total']),
      totalPages: _intFromJson(json['totalPages']),
      hasNextPage: json['hasNextPage'] as bool? ?? false,
      hasPrevPage:
          PaginationMeta._readHasPrevPage(json, 'hasPrevPage') as bool? ??
          false,
    );

Map<String, dynamic> _$PaginationMetaToJson(PaginationMeta instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'hasNextPage': instance.hasNextPage,
      'hasPrevPage': instance.hasPrevPage,
    };

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ApiResponse<T>(
  message: json['message'] as String,
  success: json['success'] as bool,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
  timestamp: _dateTimeFromJson(json['timestamp']),
  pagination: ApiResponse._readPagination(json, 'pagination') == null
      ? null
      : PaginationMeta.fromJson(
          ApiResponse._readPagination(json, 'pagination')
              as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
  'timestamp': ?_dateTimeToJson(instance.timestamp),
  'pagination': ?instance.pagination,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_media_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadMediaElementModel _$UploadMediaElementModelFromJson(
  Map<String, dynamic> json,
) => UploadMediaElementModel(
  filename: json['filename'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$UploadMediaElementModelToJson(
  UploadMediaElementModel instance,
) => <String, dynamic>{'filename': instance.filename, 'url': instance.url};

UploadMediaResponseModel _$UploadMediaResponseModelFromJson(
  Map<String, dynamic> json,
) => UploadMediaResponseModel(
  images: (json['images'] as List<dynamic>)
      .map((e) => UploadMediaElementModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UploadMediaResponseModelToJson(
  UploadMediaResponseModel instance,
) => <String, dynamic>{'images': instance.images};

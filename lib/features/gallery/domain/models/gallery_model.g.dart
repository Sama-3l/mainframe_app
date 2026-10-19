// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) => FileModel(
  name: json['name'] as String,
  fileType: json['fileType'] as String,
  addedAt: DateTime.parse(json['addedAt'] as String),
);

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
  'name': instance.name,
  'fileType': instance.fileType,
  'addedAt': instance.addedAt.toIso8601String(),
};

GalleryModel _$GalleryModelFromJson(Map<String, dynamic> json) => GalleryModel(
  file: FileModel.fromJson(json['file'] as Map<String, dynamic>),
  data: json['data'] as String,
);

Map<String, dynamic> _$GalleryModelToJson(GalleryModel instance) =>
    <String, dynamic>{'file': instance.file, 'data': instance.data};

import 'package:json_annotation/json_annotation.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';

part 'gallery_model.g.dart';

@JsonSerializable()
class FileModel {
  final String name;
  final String fileType;
  final DateTime addedAt;
  FileModel({
    required this.name,
    required this.fileType,
    required this.addedAt,
  });

  factory FileModel.fromEntity(FileEntity entity) {
    return FileModel(
      name: entity.name,
      fileType: entity.fileType,
      addedAt: entity.addedAt,
    );
  }

  FileEntity toEntity() {
    return FileEntity(name: name, fileType: fileType, addedAt: addedAt);
  }

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}

@JsonSerializable()
class GalleryModel {
  final FileModel file;
  final String data;
  GalleryModel({required this.file, required this.data});

  factory GalleryModel.fromEntity(GalleryEntity entity) {
    return GalleryModel(
      file: FileModel.fromEntity(entity.file),
      data: entity.data,
    );
  }

  GalleryEntity toEntity() {
    return GalleryEntity(file: file.toEntity(), data: data);
  }

  factory GalleryModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryModelToJson(this);
}

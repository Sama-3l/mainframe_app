import 'package:json_annotation/json_annotation.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';

part 'gallery_model.g.dart';

@JsonSerializable()
class FileModel {
  final String name;
  final String fileType;
  FileModel({required this.name, required this.fileType});

  factory FileModel.fromEntity(FileEntity entity) {
    return FileModel(name: entity.name, fileType: entity.fileType);
  }

  FileEntity toEntity() {
    return FileEntity(name: name, fileType: fileType);
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

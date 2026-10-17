import 'package:json_annotation/json_annotation.dart';
import 'package:mainframe_app/features/upload/domain/entities/upload_media_response_entity.dart';

part 'upload_media_response_model.g.dart';

@JsonSerializable()
class UploadMediaElementModel {
  final String filename;
  final String url;
  UploadMediaElementModel({required this.filename, required this.url});

  UploadMediaElementModel copyWith({String? filename, String? url}) {
    return UploadMediaElementModel(
      filename: filename ?? this.filename,
      url: url ?? this.url,
    );
  }

  factory UploadMediaElementModel.fromEntity(UploadMediaElementEntity entity) {
    return UploadMediaElementModel(filename: entity.filename, url: entity.url);
  }

  UploadMediaElementEntity toEntity() {
    return UploadMediaElementEntity(filename: filename, url: url);
  }

  factory UploadMediaElementModel.fromJson(Map<String, dynamic> json) =>
      _$UploadMediaElementModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadMediaElementModelToJson(this);
}

@JsonSerializable()
class UploadMediaResponseModel {
  final List<UploadMediaElementModel> images;
  UploadMediaResponseModel({required this.images});

  UploadMediaResponseModel copyWith({List<UploadMediaElementModel>? images}) {
    return UploadMediaResponseModel(images: images ?? this.images);
  }

  factory UploadMediaResponseModel.fromEntity(
    UploadMediaResponseEntity entity,
  ) {
    return UploadMediaResponseModel(
      images: entity.images
          .map((e) => UploadMediaElementModel.fromEntity(e))
          .toList(),
    );
  }

  UploadMediaResponseEntity toEntity() {
    return UploadMediaResponseEntity(
      images: images.map((e) => e.toEntity()).toList(),
    );
  }

  factory UploadMediaResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadMediaResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadMediaResponseModelToJson(this);
}

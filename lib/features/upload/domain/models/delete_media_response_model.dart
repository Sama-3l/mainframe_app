import 'package:mainframe_app/features/upload/domain/entities/delete_media_response_entity.dart';

class DeleteMediaResponseModel {
  final String fileName;

  DeleteMediaResponseModel({required this.fileName});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'fileName': fileName};
  }

  factory DeleteMediaResponseModel.fromJson(Map<String, dynamic> map) {
    return DeleteMediaResponseModel(fileName: map['fileName'] as String);
  }

  DeleteMediaResponseEntity toEntity() {
    return DeleteMediaResponseEntity(fileName: fileName);
  }

  factory DeleteMediaResponseModel.fromEntity(
    DeleteMediaResponseEntity entity,
  ) {
    return DeleteMediaResponseModel(fileName: entity.fileName);
  }
}

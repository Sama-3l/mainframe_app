// ignore_for_file: public_member_api_docs, sort_constructors_first
class UploadMediaElementEntity {
  final String filename;
  final String url;
  UploadMediaElementEntity({required this.filename, required this.url});
}

class UploadMediaResponseEntity {
  final List<UploadMediaElementEntity> images;
  UploadMediaResponseEntity({required this.images});
}

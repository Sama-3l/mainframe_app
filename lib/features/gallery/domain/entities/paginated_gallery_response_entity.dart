// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mainframe_app/core/client/api_response.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';

class PaginatedGalleryResponseEntity {
  final List<GalleryEntity> gallery;
  final PaginationMeta paginationMeta;

  PaginatedGalleryResponseEntity({
    required this.gallery,
    required this.paginationMeta,
  });
}

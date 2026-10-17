// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';

class ImagePreviewWidgetEntity {
  final List<GalleryEntity> images;
  final int imageIndex;

  ImagePreviewWidgetEntity({required this.images, required this.imageIndex});
}

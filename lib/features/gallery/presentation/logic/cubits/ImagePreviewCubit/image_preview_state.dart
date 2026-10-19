part of 'image_preview_cubit.dart';

sealed class ImagePreviewState {
  final int index;
  final List<GalleryEntity> images;
  final bool deleteLoading;

  const ImagePreviewState({
    required this.index,
    required this.images,
    required this.deleteLoading,
  });

  ImagePreviewState copyWith({
    int? index,
    List<GalleryEntity>? images,
    bool? deleteLoading,
  }) {
    return ImagePreviewUpdate(
      index: index ?? this.index,
      images: images ?? this.images,
      deleteLoading: deleteLoading ?? this.deleteLoading,
    );
  }
}

final class ImagePreviewUpdate extends ImagePreviewState {
  ImagePreviewUpdate({
    required super.index,
    required super.images,
    required super.deleteLoading,
  });
}

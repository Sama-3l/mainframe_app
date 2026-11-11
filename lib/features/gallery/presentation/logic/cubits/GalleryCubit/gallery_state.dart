part of 'gallery_cubit.dart';

sealed class GalleryState {
  final List<GalleryEntity> gallery;
  final int page;
  final bool pageLoad;
  final bool loadMoreImages;
  final bool uploadLoading;

  const GalleryState({
    required this.gallery,
    required this.page,
    required this.pageLoad,
    this.loadMoreImages = false,
    this.uploadLoading = false,
  });

  GalleryState copyWith({
    List<GalleryEntity>? gallery,
    bool? pageLoad,
    bool? loadMoreImages,
    int? page,
    bool? uploadLoading,
  }) {
    return GalleryUpdate(
      gallery: gallery ?? this.gallery,
      pageLoad: pageLoad ?? this.pageLoad,
      loadMoreImages: loadMoreImages ?? this.loadMoreImages,
      page: page ?? this.page,
      uploadLoading: uploadLoading ?? this.uploadLoading,
    );
  }
}

final class GalleryUpdate extends GalleryState {
  GalleryUpdate({
    required super.gallery,
    required super.page,
    super.loadMoreImages,
    required super.pageLoad,
    super.uploadLoading,
  });
}

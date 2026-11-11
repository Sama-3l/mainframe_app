part of 'gallery_cubit.dart';

sealed class GalleryState {
  final List<GalleryEntity?> gallery;
  final bool pageLoad;
  final bool loadMoreImages;
  final PaginationMeta? paginationMeta;
  final bool uploadLoading;

  const GalleryState({
    required this.gallery,
    required this.pageLoad,
    this.paginationMeta,
    this.loadMoreImages = false,
    this.uploadLoading = false,
  });

  GalleryState copyWith({
    List<GalleryEntity?>? gallery,
    bool? pageLoad,
    bool? loadMoreImages,
    PaginationMeta? paginationMeta,
    int? page,
    bool? uploadLoading,
  }) {
    return GalleryUpdate(
      gallery: gallery ?? this.gallery,
      pageLoad: pageLoad ?? this.pageLoad,
      paginationMeta: paginationMeta ?? this.paginationMeta,
      loadMoreImages: loadMoreImages ?? this.loadMoreImages,
      uploadLoading: uploadLoading ?? this.uploadLoading,
    );
  }
}

final class GalleryUpdate extends GalleryState {
  GalleryUpdate({
    required super.gallery,
    super.loadMoreImages,
    required super.pageLoad,
    super.paginationMeta,
    super.uploadLoading,
  });
}

part of 'gallery_cubit.dart';

sealed class GalleryState {
  final List<GalleryEntity> gallery;
  final bool loading;
  final bool uploadLoading;

  const GalleryState({
    required this.gallery,
    required this.loading,
    this.uploadLoading = false,
  });

  GalleryState copyWith({
    List<GalleryEntity>? gallery,
    bool? loading,
    bool? uploadLoading,
  }) {
    return GalleryUpdate(
      gallery: gallery ?? this.gallery,
      loading: loading ?? this.loading,
      uploadLoading: uploadLoading ?? this.uploadLoading,
    );
  }
}

final class GalleryUpdate extends GalleryState {
  GalleryUpdate({
    required super.gallery,
    required super.loading,
    super.uploadLoading,
  });
}

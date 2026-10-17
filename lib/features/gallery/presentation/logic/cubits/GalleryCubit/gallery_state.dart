part of 'gallery_cubit.dart';

sealed class GalleryState {
  final List<GalleryEntity> gallery;
  final bool loading;

  const GalleryState({required this.gallery, required this.loading});

  GalleryState copyWith({List<GalleryEntity>? gallery, bool? loading}) {
    return GalleryUpdate(
      gallery: gallery ?? this.gallery,
      loading: loading ?? this.loading,
    );
  }
}

final class GalleryUpdate extends GalleryState {
  GalleryUpdate({required super.gallery, required super.loading});
}

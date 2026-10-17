part of 'image_preview_cubit.dart';

sealed class ImagePreviewState {
  final int index;
  const ImagePreviewState({required this.index});

  ImagePreviewState copyWith({int? index}) {
    return ImagePreviewUpdate(index: index ?? this.index);
  }
}

final class ImagePreviewUpdate extends ImagePreviewState {
  ImagePreviewUpdate({required super.index});
}

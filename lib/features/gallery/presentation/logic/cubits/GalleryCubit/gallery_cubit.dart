import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:mainframe_app/core/constants/theme.dart';
import 'package:mainframe_app/features/gallery/data/entities/gallery_pagination_entity.dart';
import 'package:mainframe_app/features/gallery/data/usecases/get_images_usecase.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';
// import 'package:photo_manager/photo_manager.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  final GetImagesUsecase _getImagesUsecase;

  GalleryCubit(this._getImagesUsecase)
    : super(GalleryUpdate(gallery: [], loading: true));

  Future<void> loadImages(BuildContext context, int page) async {
    final response = await _getImagesUsecase(
      GalleryPaginationEntity(page: page, limit: 20),
    );

    response.fold(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("API call failed", style: TextStyles.labelLargeBold),
          ),
        );
        emit(state.copyWith(loading: false));
      },
      (response) {
        emit(state.copyWith(gallery: response, loading: false));
      },
    );
  }

  Future<void> pickImages(BuildContext context) async {
    try {
      final picker = ImagePicker();
      final List<XFile> picked = await picker.pickMultiImage(
        imageQuality: 85,
        limit: 10,
      );

      if (picked.isEmpty || !context.mounted) return;

      // Use the selected images
      final paths = picked.map((x) => x.path).toList();
      print(paths);
      // setState(() => _images = paths);
    } catch (e) {
      debugPrint('Image pick failed: $e');
    }
  }
}

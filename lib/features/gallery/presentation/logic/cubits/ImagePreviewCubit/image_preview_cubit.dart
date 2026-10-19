import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mainframe_app/core/constants/theme.dart';
import 'package:mainframe_app/features/gallery/data/usecases/delete_media_usecase.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';

part 'image_preview_state.dart';

class ImagePreviewCubit extends Cubit<ImagePreviewState> {
  final int index;
  final DeleteMediaUsecase deleteMediaUsecase;

  ImagePreviewCubit(this.deleteMediaUsecase, {required this.index})
    : super(ImagePreviewUpdate(index: index, images: [], deleteLoading: false));

  void initialize(int index, List<GalleryEntity> images) {
    emit(state.copyWith(index: index, images: images));
  }

  void updateIndex(int index) {
    emit(state.copyWith(index: index));
  }

  Future<void> deleteImage(
    BuildContext context,
    String mediaId,
    PageController pageController,
  ) async {
    emit(state.copyWith(deleteLoading: true));
    final response = await deleteMediaUsecase(mediaId);

    response.fold(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorsConstants.onBackground,
            content: Text(
              "API call failed",
              style: TextStyles.labelLargeBold.copyWith(
                color: ColorsConstants.background,
              ),
            ),
          ),
        );
        emit(state.copyWith(deleteLoading: false));
      },
      (response) {
        pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
        );
        state.images.removeAt(state.index);
        emit(state.copyWith(deleteLoading: false));
      },
    );
  }
}

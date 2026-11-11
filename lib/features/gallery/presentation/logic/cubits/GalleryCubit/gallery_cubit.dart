import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:mainframe_app/core/constants/constants.dart';
import 'package:mainframe_app/core/constants/theme.dart';
import 'package:mainframe_app/core/services/secure_storage.dart';
import 'package:mainframe_app/features/gallery/data/entities/gallery_pagination_entity.dart';
import 'package:mainframe_app/features/gallery/data/usecases/get_images_usecase.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';
import 'package:mainframe_app/features/gallery/domain/entities/image_preview_widget_entity.dart';
import 'package:mainframe_app/features/pair/data/usecases/unpair_usecase.dart';
import 'package:mainframe_app/features/upload/data/entities/upload_media_entity.dart';
import 'package:mainframe_app/features/upload/data/usecase/upload_media_usecase.dart';
import 'package:mainframe_app/router/app_route_constants.dart';
import "package:mime/mime.dart";
// import 'package:photo_manager/photo_manager.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  final SecureStorageService _secureStorageService;
  final GetImagesUsecase _getImagesUsecase;
  final UploadMediaUsecase _uploadMediaUsecase;
  final UnpairUsecase _unpairUsecase;

  GalleryCubit(
    this._secureStorageService,
    this._getImagesUsecase,
    this._uploadMediaUsecase,
    this._unpairUsecase,
  ) : super(GalleryUpdate(gallery: [], loading: true));

  Future<void> unpair(BuildContext context) async {
    // _secureStorageService.deleteAll();
    // GoRouter.of(context).goNamed(Routes.pair);
    final deviceToken = await _secureStorageService.read(
      AppConstants.deviceToken,
    );
    if (deviceToken != null) {
      final deviceId = deviceToken.split(".")[0];
      await _unpairUsecase(deviceId);
      _secureStorageService.deleteAll();
      GoRouter.of(context).goNamed(Routes.pair);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorsConstants.background,
          content: Text(
            "Device ID Not Found",
            style: TextStyles.labelLargeBold,
          ),
          action: SnackBarAction(
            label: "Re-Pair ?",
            onPressed: () {
              _secureStorageService.deleteAll();
              GoRouter.of(context).goNamed(Routes.pair);
            },
          ),
        ),
      );
    }
  }

  Future<void> loadImages(BuildContext context, int page) async {
    final response = await _getImagesUsecase(
      GalleryPaginationEntity(page: page, limit: 20),
    );

    response.fold(
      (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorsConstants.background,
            content: Text(e.message, style: TextStyles.labelLargeBold),
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
      final List<XFile> picked = await picker.pickMultiImage(imageQuality: 100);

      if (picked.isEmpty || !context.mounted) return;
      final files = await Future.wait(
        picked.map((e) async {
          final bytes = await e.readAsBytes();
          return GalleryEntity(
            file: FileEntity(
              name: e.name,
              fileType: e.mimeType ?? lookupMimeType(e.path) ?? 'image/jpeg',
              addedAt: DateTime.now(),
            ),
            data: "",
            bytes: bytes,
          );
        }),
      );
      // Use the selected images

      final result =
          await GoRouter.of(context).pushNamed(
                Routes.imagePreview,
                extra: ImagePreviewWidgetEntity(
                  images: files,
                  imageIndex: 0,
                  confirmUpload: true,
                ),
              )
              as bool?;
      if (result != null && result) {
        uploadImages(context, picked);
      }
    } catch (e) {
      debugPrint('Image pick failed: $e');
    }
  }

  Future<void> uploadImages(BuildContext context, List<XFile> picked) async {
    final files = await Future.wait(
      picked.map((x) => MultipartFile.fromFile(x.path, filename: x.name)),
    );

    final formData = FormData();
    for (final file in files) {
      formData.files.add(
        MapEntry('images', file),
      ); // e.g. 'files', 'images', 'media'
    }
    emit(state.copyWith(uploadLoading: true));
    final response = await _uploadMediaUsecase(
      UploadMediaEntity(formData: formData),
    );

    response.fold(
      (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorsConstants.background,
            content: Text(
              e.message,
              style: TextStyles.titleMedium.copyWith(
                color: ColorsConstants.onBackground,
              ),
            ),
          ),
        );
      },
      (response) async {
        await loadImages(context, 1);
        emit(state.copyWith(uploadLoading: false));
      },
    );
  }
}

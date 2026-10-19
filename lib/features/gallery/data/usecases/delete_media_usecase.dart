import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/constants/usecase.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/features/gallery/domain/repo/gallery_repo.dart';
import 'package:mainframe_app/features/upload/domain/entities/delete_media_response_entity.dart';

class DeleteMediaUsecase extends UseCase<DeleteMediaResponseEntity, String> {
  final GalleryRepo _repo;

  DeleteMediaUsecase(this._repo);

  @override
  Future<Either<Failure, DeleteMediaResponseEntity>> call(String mediaId) =>
      _repo.deleteMedia(mediaId);
}

import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/constants/usecase.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/features/upload/data/entities/upload_media_entity.dart';
import 'package:mainframe_app/features/upload/domain/entities/upload_media_response_entity.dart';
import 'package:mainframe_app/features/upload/domain/repo/upload_media_repo.dart';

class UploadMediaUsecase
    extends UseCase<UploadMediaResponseEntity, UploadMediaEntity> {
  final UploadMediaRepo _repo;

  UploadMediaUsecase({required UploadMediaRepo repository})
    : _repo = repository;

  @override
  Future<Either<Failure, UploadMediaResponseEntity>> call(
    UploadMediaEntity params,
  ) => _repo.upload(params.formData);
}

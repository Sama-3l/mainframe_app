import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/constants/usecase.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/features/gallery/data/entities/gallery_pagination_entity.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';
import 'package:mainframe_app/features/gallery/domain/repo/gallery_repo.dart';

class GetImagesUsecase
    extends UseCase<List<GalleryEntity>, GalleryPaginationEntity> {
  final GalleryRepo _repo;

  GetImagesUsecase(this._repo);

  @override
  Future<Either<Failure, List<GalleryEntity>>> call(
    GalleryPaginationEntity params,
  ) => _repo.getImages(params.page, params.limit);
}

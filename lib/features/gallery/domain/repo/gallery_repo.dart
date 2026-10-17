import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';

abstract class GalleryRepo {
  Future<Either<Failure, List<GalleryEntity>>> getImages(int page, int limit);
}

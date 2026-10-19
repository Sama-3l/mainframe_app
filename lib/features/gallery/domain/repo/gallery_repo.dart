import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';
import 'package:mainframe_app/features/upload/domain/entities/delete_media_response_entity.dart';

abstract class GalleryRepo {
  Future<Either<Failure, List<GalleryEntity>>> getImages(int page, int limit);
  Future<Either<Failure, DeleteMediaResponseEntity>> deleteMedia(
    String mediaId,
  );
}

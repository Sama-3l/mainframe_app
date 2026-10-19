import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/errors/exceptions.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/core/utils/functions/repo_method.dart';
import 'package:mainframe_app/features/gallery/data/datasource/remote/gallery_datasource_remote.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';
import 'package:mainframe_app/features/gallery/domain/repo/gallery_repo.dart';
import 'package:mainframe_app/features/upload/domain/entities/delete_media_response_entity.dart';

class GalleryRepoImpl extends GalleryRepo {
  final GalleryDatasourceRemote _datasourceRemote;

  GalleryRepoImpl(this._datasourceRemote);

  @override
  Future<Either<Failure, List<GalleryEntity>>> getImages(int page, int limit) =>
      genericRepositoryMethod(
        method: () async {
          final response = await _datasourceRemote.getImages(page, limit);

          if (!response.success || response.data == null) {
            throw ServerException(message: response.message);
          }

          final d = response.data!;
          return d.map((e) => e.toEntity()).toList();
        },
      );

  @override
  Future<Either<Failure, DeleteMediaResponseEntity>> deleteMedia(
    String mediaId,
  ) => genericRepositoryMethod(
    method: () async {
      final response = await _datasourceRemote.deleteMedia(mediaId);

      if (!response.success || response.data == null) {
        throw ServerException(message: response.message);
      }

      final d = response.data!;
      return d.toEntity();
    },
  );
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mainframe_app/core/errors/exceptions.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/core/utils/functions/repo_method.dart';
import 'package:mainframe_app/features/upload/data/datasource/remote/upload_datasource_remote.dart';
import 'package:mainframe_app/features/upload/domain/entities/upload_media_response_entity.dart';
import 'package:mainframe_app/features/upload/domain/repo/upload_media_repo.dart';

class UploadMediaRepoImpl extends UploadMediaRepo {
  final UploadDatasourceRemote _remoteDataSource;

  UploadMediaRepoImpl({required this._remoteDataSource});

  // ── Bootstrap ─────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, UploadMediaResponseEntity>> upload(FormData body) =>
      genericRepositoryMethod(
        method: () async {
          final response = await _remoteDataSource.upload(body);

          // The backend returns success:false for business-logic errors
          // (e.g. invalid/expired token). Treat this as a server failure.
          if (!response.success || response.data == null) {
            throw ServerException(message: response.message);
          }

          final d = response.data!;
          return d.toEntity();
        },
      );
}

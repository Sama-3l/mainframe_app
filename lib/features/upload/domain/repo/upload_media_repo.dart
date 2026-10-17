// import 'package:dartz/dartz.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:theo/core/errors/failures.dart';
// import 'package:theo/features/auth/domain/entities/bootstrap_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/features/upload/domain/entities/upload_media_response_entity.dart';

abstract class UploadMediaRepo {
  Future<Either<Failure, List<UploadMediaElementEntity>>> upload(FormData body);
}

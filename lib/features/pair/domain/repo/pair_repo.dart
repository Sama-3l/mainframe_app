import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/features/pair/domain/entities/pair_response_entity.dart';

abstract class PairRepo {
  Future<Either<Failure, PairResponseEntity>> pair(Map<String, dynamic> body);
}

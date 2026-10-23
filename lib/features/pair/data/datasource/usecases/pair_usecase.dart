import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/constants/usecase.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/features/pair/data/datasource/entities/pair_usecase_entity.dart';
import 'package:mainframe_app/features/pair/domain/entities/pair_response_entity.dart';
import 'package:mainframe_app/features/pair/domain/repo/pair_repo.dart';

class PairUsecase extends UseCase<PairResponseEntity, PairUsecaseEntity> {
  final PairRepo _pairRepo;

  PairUsecase(this._pairRepo);

  @override
  Future<Either<Failure, PairResponseEntity>> call(PairUsecaseEntity entity) =>
      _pairRepo.pair(entity.toJson());
}

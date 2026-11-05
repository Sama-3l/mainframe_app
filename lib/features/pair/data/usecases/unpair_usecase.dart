import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/constants/usecase.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/features/pair/domain/repo/pair_repo.dart';

class UnpairUsecase extends UseCase<void, String> {
  final PairRepo _pairRepo;

  UnpairUsecase(this._pairRepo);

  @override
  Future<Either<Failure, void>> call(String deviceID) =>
      _pairRepo.unpair(deviceID);
}

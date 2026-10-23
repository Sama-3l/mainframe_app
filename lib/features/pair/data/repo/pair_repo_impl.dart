import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/errors/exceptions.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/core/utils/functions/repo_method.dart';
import 'package:mainframe_app/features/pair/data/datasource/remote/pair_remote_datasource.dart';
import 'package:mainframe_app/features/pair/domain/entities/pair_response_entity.dart';
import 'package:mainframe_app/features/pair/domain/repo/pair_repo.dart';

class PairRepoImpl extends PairRepo {
  final PairRemoteDatasource _datasource;

  PairRepoImpl(PairRemoteDatasource datasource) : _datasource = datasource;

  @override
  Future<Either<Failure, PairResponseEntity>> pair(Map<String, dynamic> body) =>
      genericRepositoryMethod(
        method: () async {
          final response = await _datasource.pair(body);

          if (!response.success || response.data == null) {
            throw ServerException(message: response.message);
          }

          final d = response.data!;
          return d.toEntity();
        },
      );
}

import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/errors/error_map.dart';
import 'package:mainframe_app/core/errors/exceptions.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/core/network/network_info.dart';

/// Wraps a repository method that requires a network call.
///
/// 1. Checks connectivity first — returns [Left(NetworkFailure())] immediately
///    if the device is offline, before any network call is made.
/// 2. Executes [method] (which calls a datasource).
/// 3. Catches [AppException] → [mapFailure] → [Left(Failure)].
///
/// The generic [catch (_)] is a safety net only.
/// If all datasources consistently use [genericDataSourceMethod],
/// only [AppException] can reach this function and the fallback never executes.
///
/// Never catches [DioException], [SocketException], or any infrastructure
/// exception directly — that is the datasource's responsibility.
Future<Either<Failure, T>> genericRepositoryMethod<T>({
  required Future<T> Function() method,
}) async {
  if (!await NetworkInfo.checkInternetConnection()) {
    return Left(NetworkFailure());
  }
  try {
    return Right(await method());
  } on AppException catch (e) {
    return Left(mapFailure(e));
  } catch (_) {
    return Left(UnknownFailure());
  }
}

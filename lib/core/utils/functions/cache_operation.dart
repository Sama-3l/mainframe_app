import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/errors/error_map.dart';
import 'package:mainframe_app/core/errors/exceptions.dart';
import 'package:mainframe_app/core/errors/failures.dart';
import 'package:mainframe_app/core/network/network_info.dart';

Future<Either<Failure, T>> cacheOperation<T>({
  required Future<T> Function() getData,
  Future<T?> Function()? getCachedData,
  Future<void> Function(T data)? cacheData,
}) async {
  try {
    // 1️⃣ Check cached data first
    if (getCachedData != null) {
      final cachedItem = await getCachedData();
      if (cachedItem != null) {
        return Right(cachedItem);
      }
    }

    if (await NetworkInfo.checkInternetConnection() == false) {
      return Left(NetworkFailure());
    }

    // 2️⃣ Fetch from network/source
    final data = await getData();

    // 3️⃣ Cache the new data
    if (cacheData != null) await cacheData(data);

    // 4️⃣ Optional: recursive call if retry needed
    return Right(data);
  } catch (e) {
    if (e is AppException) {
      return Left(mapFailure(e));
    }
    return Left(UnknownFailure(message: e.toString()));
  }
}

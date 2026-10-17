import 'package:dartz/dartz.dart';
import 'package:mainframe_app/core/errors/failures.dart'; // For representing success or failure

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {} // For use cases that don't require any parameters

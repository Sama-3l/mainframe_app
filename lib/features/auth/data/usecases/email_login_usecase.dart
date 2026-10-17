// import 'package:dartz/dartz.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:theo/core/constants/usecase.dart';
// import 'package:theo/core/errors/failures.dart';
// import 'package:theo/features/auth/domain/entities/email_auth_usecase_params.dart';
// import 'package:theo/features/auth/domain/repository/auth_repo.dart';

// class EmailLoginUsecase extends UseCase<AuthResponse, EmailAuthUsecaseEntity> {
//   final AuthRepo _authRepo;

//   EmailLoginUsecase({required AuthRepo repository}) : _authRepo = repository;

//   @override
//   Future<Either<Failure, AuthResponse>> call(EmailAuthUsecaseEntity params) {
//     return _authRepo.signInWithEmailAndPassword(params.email, params.password);
//   }
// }

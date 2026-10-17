// import 'package:dartz/dartz.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:theo/core/errors/failures.dart';
// import 'package:theo/features/auth/domain/entities/bootstrap_entity.dart';

// abstract class AuthRepo {
//   Future<Either<Failure, AuthResponse>> signUpWithEmailAndPassword(
//     String email,
//     String password,
//   );
//   Future<Either<Failure, AuthResponse>> signInWithEmailAndPassword(
//     String email,
//     String password,
//   );
//   Future<Either<Failure, void>> signOut();

//   /// Calls POST /auth/bootstrap — validates the current JWT and returns
//   /// the authenticated user's context including onboarding status.
//   Future<Either<Failure, BootstrapEntity>> bootstrap();
// }

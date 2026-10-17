// import 'package:dartz/dartz.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:theo/core/errors/exceptions.dart';
// import 'package:theo/core/errors/failures.dart';
// import 'package:theo/core/utils/functions/repo_method.dart';
// import 'package:theo/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
// import 'package:theo/features/auth/domain/entities/bootstrap_entity.dart';
// import 'package:theo/features/auth/domain/repository/auth_repo.dart';

// class AuthRepoImpl extends AuthRepo {
//   final AuthRemoteDataSource _remoteDataSource;

//   AuthRepoImpl({required AuthRemoteDataSource remoteDataSource})
//       : _remoteDataSource = remoteDataSource;

//   // ── Bootstrap ─────────────────────────────────────────────────────────────

//   @override
//   Future<Either<Failure, BootstrapEntity>> bootstrap() =>
//       genericRepositoryMethod(
//         method: () async {
//           final response = await _remoteDataSource.bootstrap();

//           // The backend returns success:false for business-logic errors
//           // (e.g. invalid/expired token). Treat this as a server failure.
//           if (!response.success || response.data == null) {
//             throw ServerException(message: response.message);
//           }

//           final d = response.data!;
//           return d.toEntity();
//         },
//       );

//   // ── Sign in ───────────────────────────────────────────────────────────────

//   @override
//   Future<Either<Failure, AuthResponse>> signInWithEmailAndPassword(
//     String email,
//     String password,
//   ) => genericRepositoryMethod(
//         method:
//             () => _remoteDataSource.signInWithEmailAndPassword(email, password),
//       );

//   // ── Sign up ───────────────────────────────────────────────────────────────

//   @override
//   Future<Either<Failure, AuthResponse>> signUpWithEmailAndPassword(
//     String email,
//     String password,
//   ) => genericRepositoryMethod(
//         method:
//             () => _remoteDataSource.signUpWithEmailAndPassword(email, password),
//       );

//   // ── Sign out ──────────────────────────────────────────────────────────────

//   @override
//   Future<Either<Failure, void>> signOut() =>
//       genericRepositoryMethod(method: _remoteDataSource.signOut);
// }

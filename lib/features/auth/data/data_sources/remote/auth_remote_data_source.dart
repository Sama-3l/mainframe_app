// import 'dart:io';
// import 'package:mainframe_app/core/client/api_response.dart';
// import 'package:mainframe_app/core/client/api_service.dart';
// import 'package:mainframe_app/core/errors/exceptions.dart';
// import 'package:mainframe_app/core/utils/functions/datasource_method.dart';
// import 'package:mainframe_app/features/auth/domain/models/bootstrap_response_model.dart';

// // ─── Abstract ────────────────────────────────────────────────────────────────

// abstract class AuthRemoteDataSource {
//   /// Retrofit/Dio call — wrapped in [genericDataSourceMethod].
//   Future<ApiResponse<BootstrapResponseModel>> bootstrap();

//   /// Supabase SDK call — handles [AuthException] directly.
//   Future<AuthResponse> signInWithEmailAndPassword(
//     String email,
//     String password,
//   );

//   /// Supabase SDK call — handles [AuthException] directly.
//   Future<AuthResponse> signUpWithEmailAndPassword(
//     String email,
//     String password,
//   );

//   /// Supabase SDK call — handles [AuthException] directly.
//   Future<void> signOut();
// }

// // ─── Implementation ──────────────────────────────────────────────────────────

// class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
//   final ApiService _api;
//   final SupabaseClient _supabase;

//   AuthRemoteDataSourceImpl({required ApiService api, SupabaseClient? supabase})
//     : _api = api,
//       _supabase = supabase ?? Supabase.instance.client;

//   // ── Retrofit path ─────────────────────────────────────────────────────────
//   // genericDataSourceMethod converts DioException, SocketException,
//   // TimeoutException, FormatException into typed AppExceptions.
//   //
//   // ApiService.bootstrap() returns Future<ApiResponse<BootstrapResponseModel>>
//   // directly — Retrofit's generated code handles JSON deserialisation via the
//   // genericArgumentFactories factory on ApiResponse. No manual parsing needed.
//   @override
//   Future<ApiResponse<BootstrapResponseModel>> bootstrap() =>
//       genericDataSourceMethod(method: _api.bootstrap);

//   // ── Supabase SDK path ─────────────────────────────────────────────────────
//   // AuthException is Supabase-specific — genericDataSourceMethod does not know
//   // about it, so each method handles it with a direct try/catch.
//   @override
//   Future<AuthResponse> signInWithEmailAndPassword(
//     String email,
//     String password,
//   ) async {
//     try {
//       return await _supabase.auth.signInWithPassword(
//         email: email,
//         password: password,
//       );
//     } on AuthException catch (e) {
//       throw AuthenticationException(message: e.message);
//     } on SocketException {
//       throw NetworkException();
//     } catch (_) {
//       throw UnknownException();
//     }
//   }

//   @override
//   Future<AuthResponse> signUpWithEmailAndPassword(
//     String email,
//     String password,
//   ) async {
//     try {
//       return await _supabase.auth.signUp(email: email, password: password);
//     } on AuthException catch (e) {
//       throw AuthenticationException(message: e.message);
//     } on SocketException {
//       throw NetworkException();
//     } catch (_) {
//       throw UnknownException();
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     try {
//       await _supabase.auth.signOut();
//     } on AuthException catch (e) {
//       throw AuthenticationException(message: e.message);
//     } on SocketException {
//       throw NetworkException();
//     } catch (_) {
//       throw UnknownException();
//     }
//   }
// }

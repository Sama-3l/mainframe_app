// import 'package:bloc/bloc.dart';
// import 'package:theo/core/constants/global_variables.dart';
// import 'package:theo/core/constants/usecase.dart';
// import 'package:theo/core/services/google_sign_in_service.dart';
// import 'package:theo/features/auth/data/usecases/bootstrap_usecase.dart';
// import 'package:theo/features/auth/data/usecases/email_login_usecase.dart';
// import 'package:theo/features/auth/domain/entities/bootstrap_entity.dart';
// import 'package:theo/features/auth/domain/entities/email_auth_usecase_params.dart';

// part 'login_page_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   // Inject your real auth repository/service here instead of nothing.
//   final EmailLoginUsecase _emailLoginUsecase;
//   final BootstrapUsecase _bootstrapUsecase;
//   LoginCubit(this._emailLoginUsecase, this._bootstrapUsecase)
//     : super(const LoginUpdate());

//   void initialize({String? error}) {
//     if (error != null && error.isNotEmpty) {
//       Future.delayed(Duration(seconds: 1), () {
//         emit(state.copyWith(status: LoginStatus.failure, errorMessage: error));
//       });
//     }
//   }

//   void togglePasswordVisibility() {
//     emit(state.copyWith(obscurePassword: !state.obscurePassword));
//   }

//   String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) return 'Please enter your email';
//     if (!value.contains('@')) return 'Please enter a valid email';
//     return null;
//   }

//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) return 'Please enter your password';
//     if (value.length < 6) return 'Password must be at least 6 characters';
//     return null;
//   }

//   Future<void> submit({required String email, required String password}) async {
//     emit(state.copyWith(status: LoginStatus.loading, errorMessage: null));

//     final result = await _emailLoginUsecase(
//       EmailAuthUsecaseEntity(email: email, password: password),
//     );
//     result.fold(
//       (failure) => emit(
//         state.copyWith(
//           status: LoginStatus.failure,
//           errorMessage: failure.message,
//         ),
//       ),
//       (response) async {
//         await bootstrap();
//       },
//     );
//   }

//   Future<void> googleSign() async {
//     emit(state.copyWith(status: LoginStatus.loading, errorMessage: null));
//     try {
//       await googleSignIn();
//       // emit(state.copyWith(status: LoginStatus.success, errorMessage: null));
//       await bootstrap();
//     } catch (e) {
//       emit(
//         state.copyWith(
//           status: LoginStatus.failure,
//           errorMessage: "Something went wrong",
//         ),
//       );
//     }
//   }

//   Future<void> bootstrap() async {
//     emit(state.copyWith(status: LoginStatus.loading).clearError());

//     final result = await _bootstrapUsecase(NoParams());

//     result.fold(
//       (failure) => emit(
//         state.copyWith(
//           status: LoginStatus.failure,
//           errorMessage: failure.message,
//         ),
//       ),
//       (entity) {
//         GlobalVariables.authenticated.value = true;
//         emit(
//           state.copyWith(
//             bootstrapData: entity,
//             status: !entity.inviteVerified
//                 ? LoginStatus
//                       .needsInvite // → router: Invite screen
//                 : entity.onboarded
//                 ? LoginStatus
//                       .success // → router: Home
//                 : LoginStatus.needsOnboarding, // → router: Onboarding
//           ),
//         );
//       },
//     );
//   }
// }

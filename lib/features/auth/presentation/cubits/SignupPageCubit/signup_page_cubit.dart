// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:theo/core/constants/global_variables.dart';
// import 'package:theo/core/constants/usecase.dart';
// import 'package:theo/core/services/google_sign_in_service.dart';
// import 'package:theo/features/auth/data/usecases/bootstrap_usecase.dart';
// import 'package:theo/features/auth/data/usecases/email_signup_usecase.dart';
// import 'package:theo/features/auth/domain/entities/bootstrap_entity.dart';
// import 'package:theo/features/auth/domain/entities/email_auth_usecase_params.dart';

// part 'signup_page_state.dart';

// class SignupPageCubit extends Cubit<SignupPageState> {
//   // Inject your real auth repository/service here instead of nothing,
//   // e.g. SignupPageCubit(this._authRepository) : super(const SignupPageState());
//   EmailSignupUsecase _emailSignupUsecase;
//   final BootstrapUsecase _bootstrapUsecase;
//   SignupPageCubit(this._emailSignupUsecase, this._bootstrapUsecase)
//     : super(const SignupPageState());

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

//   /// Pass the current password value in so it can be compared —
//   /// e.g. validator: (value) => cubit.validateConfirmPassword(value, _passwordController.text)
//   String? validateConfirmPassword(String? value, String password) {
//     if (value == null || value.isEmpty) return 'Please confirm your password';
//     if (value != password) return 'Passwords do not match';
//     return null;
//   }

//   Future<void> submit({required String email, required String password}) async {
//     emit(state.copyWith(status: SignupStatus.loading).clearError());

//     final result = await _emailSignupUsecase(
//       EmailAuthUsecaseEntity(email: email, password: password),
//     );
//     result.fold(
//       (failure) => emit(
//         state.copyWith(
//           status: SignupStatus.failure,
//           errorMessage: failure.message,
//         ),
//       ),
//       (response) async {
//         await bootstrap();
//       },
//     );
//   }

//   Future<void> googleSign() async {
//     emit(state.copyWith(status: SignupStatus.loading, errorMessage: null));
//     try {
//       await googleSignIn();
//       await bootstrap();
//     } catch (e) {
//       emit(
//         state.copyWith(
//           status: SignupStatus.failure,
//           errorMessage: "Something went wrong",
//         ),
//       );
//     }
//   }

//   Future<void> bootstrap() async {
//     emit(state.copyWith(status: SignupStatus.loading).clearError());

//     final result = await _bootstrapUsecase(NoParams());

//     result.fold(
//       (failure) => emit(
//         state.copyWith(
//           status: SignupStatus.failure,
//           errorMessage: failure.message,
//         ),
//       ),
//       (entity) {
//         GlobalVariables.authenticated.value = true;
//         emit(
//           state.copyWith(
//             bootstrapData: entity,
//             status: !entity.inviteVerified
//                 ? SignupStatus.needsInvite      // → router: Invite screen
//                 : entity.onboarded
//                     ? SignupStatus.success        // → router: Home
//                     : SignupStatus.needsOnboarding, // → router: Onboarding
//           ),
//         );
//       },
//     );
//   }
// }

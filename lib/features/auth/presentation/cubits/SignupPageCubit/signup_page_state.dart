// part of 'signup_page_cubit.dart';

// enum SignupStatus { initial, loading, needsInvite, needsOnboarding, success, failure }

// class SignupPageState extends Equatable {
//   final SignupStatus status;
//   final bool obscurePassword;
//   final BootstrapEntity? bootstrapData;
//   final String? errorMessage;

//   const SignupPageState({
//     this.status = SignupStatus.initial,
//     this.obscurePassword = true,
//     this.bootstrapData,
//     this.errorMessage,
//   });

//   bool get isLoading => status == SignupStatus.loading;

//   SignupPageState copyWith({
//     SignupStatus? status,
//     bool? obscurePassword,
//     BootstrapEntity? bootstrapData,
//     String? errorMessage,
//   }) {
//     return SignupPageState(
//       status: status ?? this.status,
//       obscurePassword: obscurePassword ?? this.obscurePassword,
//       bootstrapData: bootstrapData ?? this.bootstrapData,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }

//   /// Use instead of copyWith when you specifically need to clear the
//   /// error message — copyWith's `?? this.x` can't tell "leave unchanged"
//   /// apart from "set to null".
//   SignupPageState clearError() => SignupPageState(
//     status: status,
//     obscurePassword: obscurePassword,
//     errorMessage: null,
//     bootstrapData: bootstrapData,
//   );

//   @override
//   List<Object?> get props => [status, obscurePassword, errorMessage];
// }

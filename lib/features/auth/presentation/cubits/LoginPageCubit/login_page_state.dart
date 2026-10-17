// part of 'login_page_cubit.dart';

// enum LoginStatus {
//   initial,
//   loading,
//   needsInvite,
//   needsOnboarding,
//   success,
//   failure,
// }

// sealed class LoginState {
//   final LoginStatus status;
//   final bool obscurePassword;
//   final BootstrapEntity? bootstrapData;
//   final String? errorMessage;

//   const LoginState({
//     this.status = LoginStatus.initial,
//     this.obscurePassword = true,
//     this.bootstrapData,
//     this.errorMessage,
//   });

//   bool get isLoading => status == LoginStatus.loading;

//   LoginState copyWith({
//     LoginStatus? status,
//     BootstrapEntity? bootstrapData,
//     bool? obscurePassword,
//     String? errorMessage,
//   }) {
//     return LoginUpdate(
//       status: status ?? this.status,
//       obscurePassword: obscurePassword ?? this.obscurePassword,
//       bootstrapData: bootstrapData ?? this.bootstrapData,
//       // Explicitly allow clearing the error by passing null via a fresh state
//       // rather than copyWith when you want to reset it.
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }

//   LoginState clearError() =>
//       LoginUpdate(status: status, bootstrapData: bootstrapData);
// }

// class LoginUpdate extends LoginState {
//   const LoginUpdate({
//     super.status,
//     super.obscurePassword,
//     super.bootstrapData,
//     super.errorMessage,
//   });
// }

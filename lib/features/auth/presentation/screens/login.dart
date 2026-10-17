// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:theo/core/common/buttons/button_tap.dart';
// import 'package:theo/core/common/buttons/primary_button/button.dart';
// import 'package:theo/core/common/buttons/text_button/custom_text_button.dart';
// import 'package:theo/core/common/buttons/third_party_auth_button.dart';
// import 'package:theo/core/common/divider.dart';
// import 'package:theo/core/common/snackbar/snackbar.dart';
// import 'package:theo/core/common/text_field/input_field_decoration.dart';
// import 'package:theo/core/constants/assets.dart';
// import 'package:theo/core/constants/enums.dart';
// import 'package:theo/core/constants/spacers.dart';
// import 'package:theo/core/constants/theme.dart';
// import 'package:theo/features/auth/presentation/cubits/LoginPageCubit/login_page_cubit.dart';
// import 'package:theo/features/auth/presentation/entities/login_page_params.dart';
// import 'package:theo/injection/injection_container.dart';
// import 'package:theo/router/app_route_constants.dart';

// class Login extends StatelessWidget {
//   const Login({super.key, required this.params});

//   final LoginPageParams params;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => sl<LoginCubit>()..initialize(error: params.error),
//       child: _LoginView(),
//     );
//   }
// }

// class _LoginView extends StatefulWidget {
//   const _LoginView();

//   @override
//   State<_LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<_LoginView> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   final _emailFocusNode = FocusNode();
//   final _passwordFocusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _emailFocusNode.addListener(() => setState(() {}));
//     _passwordFocusNode.addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _emailFocusNode.dispose();
//     _passwordFocusNode.dispose();
//     super.dispose();
//   }

//   void _submit(BuildContext context) {
//     if (!_formKey.currentState!.validate()) return;
//     context.read<LoginCubit>().submit(
//       email: _emailController.text.trim(),
//       password: _passwordController.text,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final cubit = context.read<LoginCubit>();

//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.light,
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: ColorsConstants.background,
//         body: SafeArea(
//           child: ButtonTap(
//             onPressed: () => FocusScope.of(context).unfocus(),
//             child: BlocConsumer<LoginCubit, LoginState>(
//               listener: (context, state) {
//                 if (state.status == LoginStatus.failure &&
//                     state.errorMessage != null) {
//                   ScaffoldMessenger.of(context)
//                     ..hideCurrentSnackBar()
//                     ..showSnackBar(
//                       CustomSnackbar.build(
//                         state: SnackBarState.negative,
//                         message: state.errorMessage,
//                       ),
//                     );
//                 }
//                 if (state.status == LoginStatus.success) {
//                   if (state.bootstrapData!.onboarded) {
//                     GoRouter.of(context).pushReplacement(Routes.mainAppScreen);
//                   } else {
//                     GoRouter.of(context).pushReplacement(Routes.onboardingView);
//                   }
//                 } else if (state.status == LoginStatus.needsInvite) {
//                   GoRouter.of(context).pushReplacement(Routes.inviteCode);
//                 } else if (state.status == LoginStatus.needsOnboarding) {
//                   GoRouter.of(context).pushReplacement(Routes.onboardingView);
//                 }
//                 // No success branch needed — go_router's redirect picks up the
//                 // auth state change via onAuthStateChange and navigates to /home
//                 // on its own.
//               },
//               builder: (context, state) {
//                 return LayoutBuilder(
//                   builder: (context, constraints) {
//                     return SingleChildScrollView(
//                       physics: ClampingScrollPhysics(),
//                       keyboardDismissBehavior:
//                           ScrollViewKeyboardDismissBehavior.onDrag,
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: ConstrainedBox(
//                         constraints: BoxConstraints(
//                           minHeight: constraints.maxHeight,
//                         ),
//                         child: IntrinsicHeight(
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 SizedBox(height: screenHeight * 0.03),

//                                 Center(
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: ColorsConstants.primary,
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(10),
//                                       child: Image.asset(
//                                         'assets/images/logo/logo.png',
//                                         height: 96,
//                                         width: 96,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 24.verticalSpace,

//                                 Text(
//                                   'Welcome back!',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyles.heading,
//                                 ),
//                                 8.verticalSpace,
//                                 Text(
//                                   'Your own human-first social network.\nThe way internet is supposed to be.',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyles.bodyMedium.copyWith(
//                                     color: ColorsConstants.alternate,
//                                   ),
//                                 ),
//                                 24.verticalSpace,

//                                 Text("Email", style: TextStyles.labelMedium),
//                                 const SizedBox(height: 8),
//                                 TextFormField(
//                                   controller: _emailController,
//                                   focusNode: _emailFocusNode,
//                                   keyboardType: TextInputType.emailAddress,
//                                   textInputAction: TextInputAction.next,
//                                   style: TextStyles.bodyMedium,
//                                   cursorColor: ColorsConstants.primary,
//                                   autofillHints: const [AutofillHints.email],
//                                   enabled: !state.isLoading,
//                                   decoration: AppInputDecoration.build(
//                                     hintText: "example@gmail.com",
//                                   ),
//                                   validator: cubit.validateEmail,
//                                   onFieldSubmitted: (_) {
//                                     FocusScope.of(
//                                       context,
//                                     ).requestFocus(_passwordFocusNode);
//                                   },
//                                 ),
//                                 16.verticalSpace,

//                                 Text("Password", style: TextStyles.labelMedium),
//                                 const SizedBox(height: 8),
//                                 TextFormField(
//                                   controller: _passwordController,
//                                   focusNode: _passwordFocusNode,
//                                   obscureText: state.obscurePassword,
//                                   cursorColor: ColorsConstants.primary,
//                                   textInputAction: TextInputAction.done,
//                                   autofillHints: const [AutofillHints.password],
//                                   style: TextStyles.bodyMedium,
//                                   enabled: !state.isLoading,
//                                   decoration: AppInputDecoration.build(
//                                     hintText: "Enter Password",
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         size: 20,
//                                         state.obscurePassword
//                                             ? Icons.visibility_outlined
//                                             : Icons.visibility_off_outlined,
//                                         color: _passwordFocusNode.hasFocus
//                                             ? ColorsConstants.onBackground
//                                             : ColorsConstants
//                                                   .backgroundOpacityPoint2,
//                                       ),
//                                       onPressed: cubit.togglePasswordVisibility,
//                                     ),
//                                   ),
//                                   validator: cubit.validatePassword,
//                                   onFieldSubmitted: (_) => _submit(context),
//                                 ),
//                                 // 4.verticalSpace,

//                                 // Align(
//                                 //   alignment: Alignment.centerRight,
//                                 //   child: TextButton(
//                                 //     onPressed: () {},
//                                 //     child: Text(
//                                 //       'Forgot password?',
//                                 //       style: TextStyles.titleSmall,
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 16.verticalSpace,

//                                 Button(
//                                   buttonType: ButtonType.buttonLarge,
//                                   title: "Log in",
//                                   padding: EdgeInsets.zero,
//                                   loading: state.isLoading,
//                                   onTap: state.isLoading
//                                       ? () {}
//                                       : () => _submit(context),
//                                 ),

//                                 16.verticalSpace,
//                                 Row(
//                                   children: [
//                                     Expanded(child: CustomDivider()),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 16.0,
//                                       ),
//                                       child: Text(
//                                         "OR",
//                                         style: TextStyles.labelLargeBold,
//                                       ),
//                                     ),
//                                     Expanded(child: CustomDivider()),
//                                   ],
//                                 ),
//                                 16.verticalSpace,
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     ThirdPartyAuthButton(
//                                       onTap: () => cubit.googleSign(),

//                                       icon: AppAssets.svgIcons.google,
//                                     ),
//                                     // 16.horizontalSpace,
//                                     // ThirdPartyAuthButton(
//                                     //   onTap: () {},

//                                     //   icon: AppAssets.svgIcons.apple,
//                                     //   iconColor: ColorsConstants.onBackground,
//                                     // ),
//                                   ],
//                                 ),

//                                 const Spacer(),
//                                 const SizedBox(height: 24),

//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Don't have an account?",
//                                       style: TextStyles.bodySmall,
//                                     ),
//                                     4.horizontalSpace,
//                                     CustomTextButton(
//                                       title: "Sign up",
//                                       onTap: () => GoRouter.of(
//                                         context,
//                                       ).go(Routes.signUpAuth),
//                                     ),
//                                   ],
//                                 ),
//                                 16.verticalSpace,
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

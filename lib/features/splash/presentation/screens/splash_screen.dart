import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mainframe_app/core/constants/theme.dart';
import 'package:mainframe_app/features/splash/presentation/logic/cubits/SplashScreenCubit/splash_screen_cubit.dart';
import 'package:mainframe_app/injection/injection_container.dart';
import 'package:mainframe_app/router/app_route_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SplashScreenCubit>()..initialize(),
      child: BlocListener<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashScreenSuccess) {
            GoRouter.of(context).pushReplacement(Routes.mainAppScreen);
          } else if (state is SplashScreenError) {
            GoRouter.of(context).pushReplacement(Routes.pair);
          }
        },
        child: Scaffold(
          backgroundColor: ColorsConstants.onBackground,
          body: Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: ColorsConstants.background,
            ),
          ),
        ),
      ),
    );
  }
}

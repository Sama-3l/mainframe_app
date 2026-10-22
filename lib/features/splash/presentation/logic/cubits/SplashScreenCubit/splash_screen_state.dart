part of 'splash_screen_cubit.dart';

sealed class SplashScreenState {
  const SplashScreenState();
}

final class SplashScreenInitial extends SplashScreenState {}

final class SplashScreenSuccess extends SplashScreenState {}

final class SplashScreenError extends SplashScreenState {}

part of 'pair_screen_cubit.dart';

sealed class PairScreenState {}

final class PairScreenInitial extends PairScreenState {}

final class PairScreenSuccess extends PairScreenState {}

final class PairScreenError extends PairScreenState {}

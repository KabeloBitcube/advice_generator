part of 'advice_bloc.dart';

abstract class AdviceState {}

final class AdviceInitial extends AdviceState {}

final class AdviceLoading extends AdviceState {}

final class AdviceLoaded extends AdviceState {
  final Advice advice;

  AdviceLoaded({required this.advice});
}

final class AdviceError extends AdviceState {
  final String message;

  AdviceError(this.message);
}

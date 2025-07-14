part of 'advice_bloc.dart';

abstract class AdviceState extends Equatable {}

final class AdviceInitial extends AdviceState {
  @override
  List<Object?> get props => [];
}

final class AdviceLoading extends AdviceState {
  @override
  List<Object?> get props => [];
}

final class AdviceLoaded extends AdviceState {
  final Advice advice;

  AdviceLoaded({required this.advice});
  
  @override
  List<Object?> get props => [advice];
}

final class AdviceError extends AdviceState {
  final String message;

  AdviceError(this.message);
  
  @override
  List<Object?> get props => [message];
}

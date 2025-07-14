// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:advice_generator/Domain/Entity/advice.dart';
import 'package:advice_generator/Domain/UseCase/usecase.dart';
import 'package:equatable/equatable.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  GetRandomAdvice getRandomAdvice;

  AdviceBloc(this.getRandomAdvice) : super(AdviceInitial()) {
    on<GetAdviceEvent>((event, emit) async {
      emit(AdviceLoading());
      try {
        final advice = await getRandomAdvice();
        emit(AdviceLoaded(advice: advice));
      } catch (e) {
        emit(AdviceError(e.toString()));
      }
    });
  }
}

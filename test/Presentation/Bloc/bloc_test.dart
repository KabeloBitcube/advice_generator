import 'package:advice_generator/Domain/Entity/advice.dart';
import 'package:advice_generator/Domain/Repository/advice_repository.dart';
import 'package:advice_generator/Domain/UseCase/usecase.dart';
import 'package:advice_generator/Presentation/Bloc/advice_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviceRepository extends Mock implements AdviceRepository {}

void main() {
  group('Advice Bloc', () {
    final mockAdviceRepository = MockAdviceRepository();
    final getRandomAdvice = GetRandomAdvice(adviceRepository: mockAdviceRepository);
    final advice = Advice(id: 1, advice: 'test');

    when(() => mockAdviceRepository.getRandomAdvice()).thenAnswer((answer) async {
      return advice;
    });


    blocTest<AdviceBloc, AdviceState>(
      'handles AdviceLoaded successfully.',
      build: () => AdviceBloc(getRandomAdvice),
      act: (bloc) => bloc.add(GetAdviceEvent()),
      skip: 1,
      expect: () => <AdviceState>[AdviceLoaded(advice: advice)],
    );
  });
}

import 'package:advice_generator/Domain/Entity/advice.dart';
import 'package:advice_generator/Domain/Repository/advice_repository.dart';
import 'package:advice_generator/Domain/UseCase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviceRepository extends Mock implements AdviceRepository {}

void main () {
  late MockAdviceRepository mockAdviceRepository;
  late GetRandomAdvice usecase;

  setUp(() {
    mockAdviceRepository = MockAdviceRepository();
    usecase = GetRandomAdvice(adviceRepository: mockAdviceRepository);
  });

  final advice = Advice(id: 1, advice: 'test');

  test('should get advice from the repsitory', () async {
    // Arrange
    when(() => mockAdviceRepository.getRandomAdvice()).thenAnswer((answer) async {
      return advice;
    });

    // Act
    final result = await usecase();

    // Assert
    expect(result, isA<Advice>());
  });
}
import 'package:advice_generator/Domain/Entity/advice.dart';
import 'package:advice_generator/Domain/Repository/advice_repository.dart';

class GetRandomAdvice {
  final AdviceRepository adviceRepository;

  GetRandomAdvice({
    required this.adviceRepository,
  });

  Future<Advice> call () async {
    return await adviceRepository.getRandomAdvice();
  }
}

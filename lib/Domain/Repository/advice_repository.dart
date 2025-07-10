import 'package:advice_generator/Domain/Entity/advice.dart';

abstract class AdviceRepository {
  Future<Advice> getRandomAdvice ();
}
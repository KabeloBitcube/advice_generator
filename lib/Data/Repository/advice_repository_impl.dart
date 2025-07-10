import 'package:advice_generator/Data/DataSource/remote_data_source.dart';
import 'package:advice_generator/Domain/Entity/advice.dart';
import 'package:advice_generator/Domain/Repository/advice_repository.dart';

class AdviceRepositoryImpl extends AdviceRepository {
  final RemoteDataSource remoteDataSource;

  AdviceRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Advice> getRandomAdvice() {
    return remoteDataSource.getRandomAdvice();
  }

}

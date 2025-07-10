import 'package:advice_generator/Data/DataSource/remote_data_source.dart';
import 'package:advice_generator/Data/Repository/advice_repository_impl.dart';
import 'package:advice_generator/Domain/Repository/advice_repository.dart';
import 'package:advice_generator/Domain/UseCase/usecase.dart';
import 'package:advice_generator/Presentation/Bloc/advice_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init () async {
  //External
  sl.registerLazySingleton(() => http.Client());

  //Data source
  sl.registerLazySingleton(() => RemoteDataSource(client: sl()));

  //Repository
   sl.registerLazySingleton<AdviceRepository>(() => AdviceRepositoryImpl(remoteDataSource: sl()));

  //Use case
   sl.registerLazySingleton(() => GetRandomAdvice(adviceRepository: sl()));

  //Bloc
  sl.registerFactory(() => AdviceBloc(sl()));
}
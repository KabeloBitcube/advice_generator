import 'package:advice_generator/Presentation/Bloc/advice_bloc.dart';
import 'package:advice_generator/Presentation/Navigation/router.dart';
import 'package:advice_generator/Presentation/Provider/username.dart';
import 'package:advice_generator/service_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UsernameProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdviceBloc(sl()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}

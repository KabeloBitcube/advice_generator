import 'package:advice_generator/Presentation/Home/home.dart';
import 'package:advice_generator/Presentation/Login/login.dart';
import 'package:advice_generator/Presentation/Login/sign_in.dart';
import 'package:advice_generator/Presentation/Login/sign_up.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) {
        return SignInScreen();
      },
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) {
        return SignUpScreen();
      },
    ),
  ],
);
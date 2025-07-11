import 'package:advice_generator/Presentation/Bloc/advice_bloc.dart';
import 'package:advice_generator/Presentation/Home/home.dart';
import 'package:advice_generator/Presentation/Login/login.dart';
import 'package:advice_generator/Presentation/Login/sign_in.dart';
import 'package:advice_generator/Presentation/Login/sign_up.dart';
import 'package:advice_generator/Presentation/Splash/splash.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        context.read<AdviceBloc>().add(GetAdviceEvent());
        return HomeScreen();
      },
    ),
    GoRoute(
      path: '/sign-in',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(seconds: 2),
          fullscreenDialog: true,
          key: state.pageKey,
          child: SignInScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(
                curve: Curves.easeInOutCirc,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/sign-up',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(seconds: 2),
          fullscreenDialog: true,
          key: state.pageKey,
          child: SignUpScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(
                curve: Curves.easeInOutCirc,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);

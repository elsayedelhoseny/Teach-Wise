import 'package:clean_arch_flutter/choose_role_screen.dart';
import 'package:clean_arch_flutter/custom_nav_bar.dart';
import 'package:clean_arch_flutter/c.dart';
import 'package:clean_arch_flutter/features/auth/presentation/forgot_password/presentation/views/forgot_password_screen.dart';
import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/views/login_screen.dart';
import 'package:clean_arch_flutter/features/home/presentation/views/home_screen.dart';
import 'package:clean_arch_flutter/features/splash.dart';
import 'package:flutter/material.dart';
import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rSplashRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginScrsseen(),
          transitionDuration: const Duration(milliseconds: 700),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      case AppRouterNames.rOnBoardingRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 700),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
    }
    return null;
  }
}

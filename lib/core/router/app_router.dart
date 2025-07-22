import 'package:clean_arch_flutter/choose_role_screen.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/login_screen.dart';
import 'package:clean_arch_flutter/parent_layout/features/splash.dart';
import 'package:flutter/material.dart';
import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rSplashRoute:
        return _fadeRoute(AuthScreen());
      case AppRouterNames.rOnBoardingRoute:
        return _fadeRoute(const ChooseRoleScreen());

      default:
        return null;
    }
  }

  PageRouteBuilder _fadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

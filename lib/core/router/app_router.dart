import 'package:clean_arch_flutter/choose_role_screen.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/login_screen.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/forgot_password/presentation/views/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import '../../parent_layout/features/auth/presentation/forgot_password/presentation/views/widgets/otp_verification_screen.dart';
import '../../parent_layout/features/auth/presentation/forgot_password/presentation/views/widgets/set_new_password_screen.dart';
import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rSplashRoute:
        return _fadeRoute(const ForgotPasswordScreen());
      case AppRouterNames.rOnBoardingRoute:
        return _fadeRoute(const ChooseRoleScreen());
      case AppRouterNames.rForgotPasswordRoute:
        return _fadeRoute(const ForgotPasswordScreen());

      case AppRouterNames.rOtpVerificationRoute:
        return _fadeRoute(const OtpVerificationScreen());

      case AppRouterNames.rSetNewPasswordRoute:
        return _fadeRoute(const SetNewPasswordScreen());
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

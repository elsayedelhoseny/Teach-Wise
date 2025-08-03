import 'package:clean_arch_flutter/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
bool isDarkMode() {
  return Theme.of(navigatorKey.currentContext ?? mainContext).brightness ==
      Brightness.dark;
}

String? token;

String? registerCountry;
String? phoneNumberField;
String? errorResponse;

bool? isOnboardingNotCompleted;
bool? isPinCodeExists;
bool? isDnsServerAvailable;
bool? isPinLoginRequired;
bool? isNormalLoginRequired;

late AnimationController defaultFormFieldAnimationController;

bool isArab() {
  return navigatorKey.currentContext!.tr.localeName == "ar";
}

extension Translate on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}

bool isTablet() {
  final width =
      MediaQuery.of(navigatorKey.currentContext ?? mainContext).size.width;
  return width >= 600 && width < 1024;
}

extension ContextExtensions on BuildContext {
  bool get isTablet {
    return MediaQuery.sizeOf(navigatorKey.currentContext!).width >= 600;
  }
}

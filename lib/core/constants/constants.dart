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

bool validatePhoneNumber(String value) {
  if (uppercaseRegex.hasMatch(value) == false &&
      lowercaseRegex.hasMatch(value) == false &&
      specialCharRegex.hasMatch(value) == false) {
    return false;
  }
  return true;
}

bool passwordValidator(String value) {
  if (value.length >= 8 == true &&
      uppercaseRegex.hasMatch(value) == true &&
      lowercaseRegex.hasMatch(value) == true &&
      digitRegex.hasMatch(value) == true &&
      specialCharRegex.hasMatch(value) == true) {
    return false;
  }
  return true;
}

String passwordValidateMsg({
  required value,
}) {
  return '${value.length < 8 ? getLocalizedText().eightCharacterPassword : ''}'
      '${!uppercaseRegex.hasMatch(value) ? getLocalizedText().upperCasePassword : ''}'
      '${!lowercaseRegex.hasMatch(value) ? getLocalizedText().lowerCasePassword : ''}'
      '${!digitRegex.hasMatch(value) ? getLocalizedText().numberPassword : ''}'
      '${!specialCharRegex.hasMatch(value) ? getLocalizedText().specialCharacterPassword : ''}';
}

final RegExp uppercaseRegex = RegExp(r'[A-Z]');
final RegExp lowercaseRegex = RegExp(r'[a-z]');
final RegExp digitRegex = RegExp(r'[0-9]');
final RegExp specialCharRegex = RegExp(r'[!@$&*~]');

AppLocalizations getLocalizedText() {
  return AppLocalizations.of(navigatorKey.currentContext ?? mainContext)!;
}

late AnimationController defaultFormFieldAnimationController;

bool isArab() {
  return getLocalizedText().localeName == "ar";
}

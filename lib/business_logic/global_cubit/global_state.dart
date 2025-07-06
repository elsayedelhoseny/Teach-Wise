import 'package:flutter/material.dart';

abstract class GlobalStates {}

class GlobalInitial extends GlobalStates {}

class InitializingState extends GlobalStates {}

class ChangeLangState extends GlobalStates {}

class TokenValidState extends GlobalStates {}

class TokenInvalidState extends GlobalStates {}

class ErrorChangeLangState extends GlobalStates {}

class ThemeChangedState extends GlobalStates {
  final bool isDarkMode;

  ThemeChangedState(this.isDarkMode);
}

class OnChangeLanguageDropdownButtonState extends GlobalStates {}

class ChangeThemeState extends GlobalStates {
  final ThemeMode themeMode;

  ChangeThemeState(this.themeMode);
}

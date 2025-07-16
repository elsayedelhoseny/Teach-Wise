import 'package:flutter/material.dart';

abstract class AppColors {
  /// Light Theme
  static const Color primary = Color(0xff41B06E);
  static const Color secondary = Color(0xff15324A);
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF707070);
  static const Color border = Color(0xFFE0E0E0);

  // New additions from the UI design
  static const Color borderLight = Color(0xFFB1E2C5); //
  static const Color bgLinearDark = Color(0xFF122B48); // BG LINEAR
  static const Color gray = Color(0xFFE4E3E8); // GRAY
  static const Color inputBackground = Color(0xffe085550); // INPUTS
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF92727);

  /// Dark Theme
  static const Color darkPrimary = Color(0xFF0D1B2A);
  static const Color darkSecondary = Color(0xFF1B263B);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFE0E0E0);
  static const Color darkTextSecondary = Color(0xFFB0BEC5);
  static const Color darkBorder = Color(0xFF2C2C2C);
}

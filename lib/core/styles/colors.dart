import 'package:flutter/material.dart';

abstract class AppColors {
  /// ---------------------
  /// Light Theme
  /// ---------------------

  static const Color primary = Color(0xFF9C27B0);
  static const Color secondary = Color(0xFF512DA8);
  static const Color gray = Color(0xFFF1F3F8);

  static const Color background = Color(0xFFFDF5FD);
  static const Color surface = Color(0xFFFFFFFF);

  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF6B6B6B);

  static const Color border = Color(0xFFE0E0E0);
  static const Color inputBackground = Color(0xFFF3E6F5);

  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);

  /// ---------------------
  /// Dark Theme
  /// ---------------------

  static const Color darkPrimary = Color(0xFF9C27B0);
  static const Color darkSecondary = Color(0xFF6A1B9A);

  static const Color darkBackground = Color(0xFF070B16);
  static const Color darkSurface = Color(0xFF0D1325);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0BEC5);

  static const Color darkBorder = Color(0xFF3C3C4E);
  static const Color darkInputBackground = Color(0xFF2A293D);

  static const Color darkGradientStart = Color(0xFF4A0072);
  static const Color darkGradientEnd = Color(0xFF12005E);

  static const Color darkSuccess = Color(0xFF66BB6A);
  static const Color darkWarning = Color(0xFFFFCA28);
  static const Color darkError = Color(0xFFEF5350);

  static const Gradient buttonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFCE5CBF),
      Color(0xFF7D58C7),
    ],
  );
}

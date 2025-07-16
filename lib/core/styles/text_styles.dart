import 'package:flutter/material.dart';
import '../styles/colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Beiruti',
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.transparent,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          error: AppColors.error,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.inputBackground,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: AppColors.textPrimary),
          bodyMedium: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primary),
          titleTextStyle:
              TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Beiruti',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.transparent,
        primaryColor: AppColors.darkPrimary,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.darkPrimary,
          secondary: AppColors.darkSecondary,
          error: AppColors.error,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkSurface,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkPrimary, width: 1.5),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: AppColors.darkTextPrimary),
          bodyMedium:
              TextStyle(fontSize: 14, color: AppColors.darkTextSecondary),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkSurface,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.darkTextPrimary),
          titleTextStyle: TextStyle(
              color: AppColors.darkTextPrimary, fontWeight: FontWeight.bold),
        ),
      );
}

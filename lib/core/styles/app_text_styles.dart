import '../constants/responsive.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'colors.dart';

abstract class AppTextStyles {
  static TextStyle _baseStyle(double size, FontWeight weight, {Color? color}) {
    return TextStyle(
      fontSize: size.fs(),
      fontWeight: weight,
      color: color ??
          (isDarkMode() ? AppColors.darkTextPrimary : AppColors.textPrimary),
    );
  }

  /// Light      => 300
  /// Regular    => 400
  /// Medium     => 500
  /// SemiBold   => 600
  /// Bold       => From: 700  To: 900

//////////////////////////////(12)////////////////////////////////////////
  static TextStyle text12Light({Color? color}) =>
      _baseStyle(12, FontWeight.w300, color: color);
  static TextStyle text12Regular({Color? color}) =>
      _baseStyle(12, FontWeight.w400, color: color);
//////////////////////////////(14)////////////////////////////////////////
  static TextStyle text14Light({Color? color}) =>
      _baseStyle(14, FontWeight.w300, color: color);
  static TextStyle text14Regular({Color? color}) =>
      _baseStyle(14, FontWeight.w400, color: color);
//////////////////////////////(16)////////////////////////////////////////
  static TextStyle text16Regular({Color? color}) =>
      _baseStyle(16, FontWeight.w400, color: color);
  static TextStyle text16Medium({Color? color}) =>
      _baseStyle(16, FontWeight.w500, color: color);
//////////////////////////////(18)////////////////////////////////////////
  static TextStyle text18Regular({Color? color}) =>
      _baseStyle(18, FontWeight.w400, color: color);
  static TextStyle text18Medium({Color? color}) =>
      _baseStyle(18, FontWeight.w500, color: color);
  static TextStyle text18SemiBold({Color? color}) =>
      _baseStyle(18, FontWeight.w600, color: color);
//////////////////////////////(20)////////////////////////////////////////
  static TextStyle text20Medium({Color? color}) =>
      _baseStyle(20, FontWeight.w500, color: color);
//////////////////////////////(28)////////////////////////////////////////
  static TextStyle text28Bold({Color? color}) =>
      _baseStyle(28, FontWeight.w500, color: color);
}

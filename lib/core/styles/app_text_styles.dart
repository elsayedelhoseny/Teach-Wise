import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle _baseStyle(
      BuildContext context, double size, FontWeight weight,
      {Color? color}) {
    return TextStyle(
      fontSize: size.fs(context),
      fontWeight: weight,
      color: color ?? AppColors.secondary,
    );
  }

  /// Light      => 300
  /// Regular    => 400
  /// Medium     => 500
  /// SemiBold   => 600
  /// Bold       => From: 700  To: 900

  static TextStyle text12Light(BuildContext context, {Color? color}) =>
      _baseStyle(context, 12, FontWeight.w300, color: color);
  static TextStyle text12Regular(BuildContext context, {Color? color}) =>
      _baseStyle(context, 12, FontWeight.w400, color: color);
  static TextStyle text14Light(BuildContext context, {Color? color}) =>
      _baseStyle(context, 14, FontWeight.w300, color: color);
  static TextStyle text14Regular(BuildContext context, {Color? color}) =>
      _baseStyle(context, 14, FontWeight.w400, color: color);
  static TextStyle text16Regular(BuildContext context, {Color? color}) =>
      _baseStyle(context, 16, FontWeight.w400, color: color);
  static TextStyle text16Medium(BuildContext context, {Color? color}) =>
      _baseStyle(context, 16, FontWeight.w500, color: color);

  static TextStyle text18Regular(BuildContext context, {Color? color}) =>
      _baseStyle(context, 18, FontWeight.w400, color: color);
  static TextStyle text18Medium(BuildContext context, {Color? color}) =>
      _baseStyle(context, 18, FontWeight.w500, color: color);

  static TextStyle text18SemiBold(BuildContext context, {Color? color}) =>
      _baseStyle(context, 18, FontWeight.w600, color: color);

  static TextStyle text20Medium(BuildContext context, {Color? color}) =>
      _baseStyle(context, 20, FontWeight.w500, color: color);

  static TextStyle text24Bold(BuildContext context, {Color? color}) =>
      _baseStyle(context, 28, FontWeight.w500, color: color);
}

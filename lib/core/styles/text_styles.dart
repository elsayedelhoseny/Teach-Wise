import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:flutter/material.dart';

// indicate page title ---> default fontSize = 36.sp, color = white, fontFamily = noto
class HeadLineText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? textHeight;

  const HeadLineText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    this.fontWeight,
    this.textHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontWeight: fontWeight,
          color: color ?? AppColor.white,
          fontFamily: fontFamily ?? 'noto',
          fontSize: fontSize ?? 36.w(context),
          overflow: overflow ?? TextOverflow.ellipsis,
          height: textHeight),
      maxLines: maxLines ?? 1,
    );
  }
}

// indicate titles ---> default fontSize = 32.sp, color = blueTextColor, fontFamily = noto

class SupHeadLineText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? textHeight;

  const SupHeadLineText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    this.fontWeight,
    this.textHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontWeight: fontWeight,
          color: color ?? AppColor.blueTextColor,
          fontFamily: fontFamily ?? 'noto',
          fontSize: fontSize ?? 32.w(context),
          overflow: overflow ?? TextOverflow.ellipsis,
          height: textHeight),
      maxLines: maxLines ?? 1,
    );
  }
}

// for medium texts ---> default fontSize = 24.sp, color = blueTextColor, fontFamily = noto
class BodyText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? textHeight;
  final List<Shadow>? shadows;
  final TextAlign? textAlign;

  const BodyText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    this.fontWeight,
    this.textHeight,
    this.shadows,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w700,
          color: color ?? AppColor.blueTextColor,
          fontFamily: fontFamily ?? 'noto',
          fontSize: fontSize ?? 24.w(context),
          overflow: overflow ?? TextOverflow.ellipsis,
          shadows: shadows,
          height: textHeight),
      maxLines: maxLines ?? 1,
    );
  }
}

// for smaller texts ---> default fontSize = 18.sp, color = blueTextColor, fontFamily = noto
class RegularText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? textHeight;
  final List<Shadow>? shadows;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  const RegularText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    this.fontWeight,
    this.textHeight,
    this.shadows,
    this.textAlign,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color ?? AppColor.blueTextColor,
        fontFamily: fontFamily ?? 'noto',
        fontSize: fontSize ?? 16.w(context),
        overflow: overflow ?? TextOverflow.ellipsis,
        decoration: decoration,
        shadows: shadows,
        height: textHeight,
      ),
      maxLines: maxLines ?? 1,
    );
  }
}

// for smaller texts with prefix Icon---> default fontSize = 18.sp, color = blueTextColor, fontFamily = noto
class RegularTextWithIcon extends StatelessWidget {
  final String? text;
  final IconData? prefixIcon;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? textHeight;

  const RegularTextWithIcon({
    super.key,
    required this.text,
    required this.prefixIcon,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    this.fontWeight,
    this.textHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              end: 10.w(context), bottom: 5.h(context)),
          child: Icon(
            prefixIcon,
            color: AppColor.teal,
          ),
        ),
        Text(
          text!,
          style: TextStyle(
              fontWeight: fontWeight,
              color: color ?? AppColor.blueTextColor,
              fontFamily: fontFamily ?? 'noto',
              fontSize: fontSize ?? 18.w(context),
              overflow: overflow ?? TextOverflow.ellipsis,
              height: textHeight),
          maxLines: maxLines ?? 1,
        ),
      ],
    );
  }
}

// for smaller texts with prefix AssetImage---> default fontSize = 18.sp, color = blueTextColor, fontFamily = noto
class RegularTextWithAsset extends StatelessWidget {
  final String? text;
  final String? image;
  final Color? color;
  final double? fontSize;
  final double? assetSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? textHeight;

  const RegularTextWithAsset({
    super.key,
    required this.text,
    required this.image,
    this.color,
    this.assetSize,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    this.fontWeight,
    this.textHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            end: 10.w(context),
            bottom: 5.h(context),
          ),
          child: Image.asset(
            image!,
            fit: BoxFit.contain,
            matchTextDirection: true,
            height: assetSize ?? screenHeight(context, dividedBy: 40),
            width: assetSize ?? screenHeight(context, dividedBy: 40),
          ),
        ),
        Text(
          text!,
          style: TextStyle(
              fontWeight: fontWeight,
              color: color ?? AppColor.blueTextColor,
              fontFamily: fontFamily ?? 'noto',
              fontSize: fontSize ?? 18.w(context),
              overflow: overflow ?? TextOverflow.ellipsis,
              height: textHeight),
          maxLines: maxLines ?? 1,
        ),
      ],
    );
  }
}

// for buttons ---> default fontSize = 27.sp, color = white, fontFamily = noto
class ButtonText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? textHeight;
  final List<Shadow>? shadows;

  const ButtonText({
    super.key,
    required this.text,
    this.textDecoration,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    this.fontWeight,
    this.textHeight,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontWeight: fontWeight,
          color: color ?? AppColor.white,
          fontFamily: fontFamily ?? 'noto',
          decoration: textDecoration,
          fontSize: getLocalizedText(context).localeName == 'ar'
              ? (fontSize ?? 20) - 3.w(context)
              : (fontSize ?? 18).w(context),
          overflow: overflow ?? TextOverflow.ellipsis,
          shadows: shadows,
          height: textHeight),
      maxLines: maxLines ?? 1,
    );
  }
}

TextStyle navBarStyle = const TextStyle(
  color: AppColor.white,
  fontFamily: 'noto',
  fontSize: 20,
  overflow: TextOverflow.ellipsis,
);

TextStyle tapBarTextStyle({
  Color? color,
  double? fontSize,
  TextOverflow? overflow,
  String? fontFamily,
  FontWeight? fontWeight,
  double? textHeight,
  List<Shadow>? shadows,
}) =>
    TextStyle(
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? AppColor.white,
      fontFamily: fontFamily ?? 'noto',
      fontSize: fontSize ?? 16,
      overflow: overflow ?? TextOverflow.ellipsis,
      shadows: shadows,
      height: textHeight,
    );

TextStyle unSelectedTapBarTextStyle({
  Color? color,
  double? fontSize,
  TextOverflow? overflow,
  String? fontFamily,
  FontWeight? fontWeight,
  double? textHeight,
  List<Shadow>? shadows,
}) =>
    TextStyle(
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? AppColor.heavyTeal,
      fontFamily: fontFamily ?? 'noto',
      fontSize: fontSize ?? 16,
      overflow: overflow ?? TextOverflow.ellipsis,
      shadows: shadows,
      height: textHeight,
    );

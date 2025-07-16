// ignore_for_file: constant_identifier_names

import 'package:clean_arch_flutter/business_logic/form_field_cubit/cubit.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

String? token;
String? currentPassword;
String? email;
String? phone;
String? name;

bool subscriptionExpired = true;
bool? isSubscriptionBiannual;
String? childToken;
String? guestToken;

String? displayedUserName;
String? displayedUserPhoneNumber;
String? displayedUserCountry;
String? displayedUserProfileImage;

String? registerCountry;
String? phoneNumberField;
String? errorResponse;

String? selectedCategoryNameForChildView;

int? lessonProgress;

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

String passwordValidateMsg({required value, required context}) {
  return '${value.length < 8 ? getLocalizedText(context).eightCharacterPassword : ''}'
      '${!uppercaseRegex.hasMatch(value) ? getLocalizedText(context).upperCasePassword : ''}'
      '${!lowercaseRegex.hasMatch(value) ? getLocalizedText(context).lowerCasePassword : ''}'
      '${!digitRegex.hasMatch(value) ? getLocalizedText(context).numberPassword : ''}'
      '${!specialCharRegex.hasMatch(value) ? getLocalizedText(context).specialCharacterPassword : ''}';
}

final RegExp uppercaseRegex = RegExp(r'[A-Z]');
final RegExp lowercaseRegex = RegExp(r'[a-z]');
final RegExp digitRegex = RegExp(r'[0-9]');
final RegExp specialCharRegex = RegExp(r'[!@$&*~]');

double uiDesignWidth(context) {
  if (MediaQuery.of(context).orientation == Orientation.portrait) {
    return 393;
  } else {
    return 961;
  }
}

double uiDesignHeight(context) {
  if (MediaQuery.of(context).orientation == Orientation.portrait) {
    return 961;
  } else {
    return 393;
  }
}

String replaceEnglishNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], arabic[i]);
  }

  return input;
}

///////////////////////////////////////main AnimatedContainer of small buttons/////////////////////////
///duration of main AnimatedContainer of small buttons
const Duration durationOfMainAnimatedContainerOfSmallButtons =
    Duration(milliseconds: 100);

///alignment of main AnimatedContainer of small buttons
const AlignmentGeometry alignmentOfMainAnimatedContainerOfSmallButtons =
    AlignmentDirectional.center;

///height of main AnimatedContainer of small buttons
double? heightOfMainAnimatedContainerOfSmallButtons(widget, context) =>
    widget.height ?? screenHeight(context, dividedBy: 16);

///width of main AnimatedContainer of small buttons
double? widthOfMainAnimatedContainerOfSmallButtons(widget, context) =>
    widget.width ?? screenWidth(context, dividedBy: 8);

///padding in main AnimatedContainer of small buttons
EdgeInsetsGeometry? paddingOfMainAnimatedContainerOfSmallButtons =
    const EdgeInsetsDirectional.all(2);

///clipBehavior  of main AnimatedContainer of small buttons
Clip clipBehaviorOfMainAnimatedContainerOfSmallButtons = Clip.antiAlias;

/////////////////////////////////button contented AnimatedContainer///////////////////////////
///duration of contented AnimatedContainer of small buttons
const Duration durationOfContentedAnimatedContainerOfSmallButtons =
    Duration(milliseconds: 100);

///alignment of contented AnimatedContainer of small buttons
AlignmentGeometry? alignmentOfContentedAnimatedContainerOfSmallButtons =
    AlignmentDirectional.center;

///padding in contented AnimatedContainer of small buttons
EdgeInsetsGeometry? paddingOfContentedAnimatedContainerOfSmallButtons =
    EdgeInsetsDirectional.zero;

///clipBehavior  of contented AnimatedContainer of small buttons
Clip clipBehaviorOfOfContentedAnimatedContainerOfSmallButtons = Clip.antiAlias;

///fit stack of contented AnimatedContainer of small buttons
StackFit fitOfContentedAnimatedContainerOfSmallButtons = StackFit.loose;

///padding of stack of contented AnimatedContainer of small buttons
EdgeInsetsGeometry paddingOfStackOfContentedAnimatedContainerOfSmallButtons(
        context) =>
    EdgeInsetsDirectional.only(
        start: screenWidth(context, dividedBy: 140),
        top: screenHeight(context, dividedBy: 300));
//////////////////////////////icons of small buttons//////////////////////////////////////

////////////////////////////////up and down dots of small buttons/////////////////////////
///to make up dot in the same direction in both arabic and english of small buttons
const TextDirection textDirectionOfUpDotOfSmallButton = TextDirection.ltr;

///end padding of up dot image of small button
double? endPaddingOfUpDotOfSmallButton(context) =>
    screenWidth(context, dividedBy: 170);

///path of up dot image of small buttons
const String smallButtonsUpDotImage = 'assets/images/buttons-up-dot.png';

///height of up dot image of small button
double? heightOfUpDotImageOfSmallButtons(widget) =>
    widget.iconSize != null ? widget.iconSize! - (widget.iconSize! - 5) : 7;

///width of up dot image of small button
double? widthOfUpDotImageOfSmallButtons(widget) =>
    widget.iconSize != null ? widget.iconSize! - (widget.iconSize! - 3) : 10;

///to make down dot in the same direction in both arabic and english of small buttons
const TextDirection textDirectionOfDownDotOfSmallButton = TextDirection.ltr;

///bottom padding of down dot of small buttons
double? bottomPaddingOfDownDotOfSmallButtons(context) =>
    screenHeight(context, dividedBy: 128);

///start padding of down dot of small buttons
double? startPaddingOfDownDotOfSmallButtons(context) =>
    screenWidth(context, dividedBy: 130);

///path of down dot image of small buttons
const String smallButtonsDownDotImage = 'assets/images/buttons-down-dot.png';

///height of down dot image of small button
double? heightOfDownDotImageOfSmallButtons(widget) =>
    widget.iconSize != null ? widget.iconSize! - (widget.iconSize! / 1.2) : 4;

///width of down dot image of small button
double? widthOfDownDotImageOfSmallButtons(widget) =>
    widget.iconSize != null ? widget.iconSize! - (widget.iconSize! / 10) : 5;

AppLocalizations getLocalizedText(context) {
  return AppLocalizations.of(context)!;
}

void formShake({required context}) {
  FormFieldCubit.get(context).shake();
}

late AnimationController defaultFormFieldAnimationController;

const String defaultChildProfile = 'assets/images/child-default-image.png';
const String defaultUserProfile = 'assets/images/user-default-image.jpg';

double screenHeight(BuildContext context, {double dividedBy = 1.0}) {
  return MediaQuery.of(context).size.height / dividedBy;
}

double screenWidth(BuildContext context, {double dividedBy = 1.0}) {
  return MediaQuery.of(context).size.width / dividedBy;
}

bool isOrientationPortrait(BuildContext context) =>
    MediaQuery.of(context).orientation.name == "portrait";

Size screenSize(BuildContext context) => MediaQuery.of(context).size;

bool isArab(BuildContext context) {
  return getLocalizedText(context).localeName == "ar";
}

void showToast({
  required String text,
  required BuildContext context,
  required ToastColors color,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: setToastColor(color),
    textColor: Colors.white,
    fontSize: 16.0.fs(context),
  );
}

enum ToastColors {
  SUCCESS,
  ERROR,
  WARNING,
}

Color setToastColor(ToastColors color) {
  Color c;

  switch (color) {
    case ToastColors.ERROR:
      c = Colors.red;
      break;
    case ToastColors.SUCCESS:
      c = Colors.green;
      break;
    case ToastColors.WARNING:
      c = Colors.amber;
      break;
  }

  return c;
}

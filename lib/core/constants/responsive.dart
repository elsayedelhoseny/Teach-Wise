import 'dart:math';

import 'package:clean_arch_flutter/main.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

double screenHeight = MediaQuery.sizeOf(navigatorKey.currentContext!).height;
double screenWidth = MediaQuery.sizeOf(navigatorKey.currentContext!).width;
const double dWidth = 375;
const double dHeight = 812;

/// Utility for responsive design in Flutter.
/// Scales widgets, padding, margins, and font sizes based on the screen size.
class Responsive {
  /// The base width and height for your design (e.g., 375x808 for an iPhone design).
  final double designWidth;
  final double designHeight;

  const Responsive({
    this.designWidth = dWidth, // Default design width
    this.designHeight = dHeight, // Default design height
  });

  /// Calculate the responsive width based on the design width.
  double w(
    double width,
  ) {
    final size = MediaQuery.sizeOf(navigatorKey.currentContext ?? mainContext);
    return width * (size.width / designWidth);
  }

  /// Calculate the responsive height based on the design height.
  double h(
    double height,
  ) {
    final size = MediaQuery.sizeOf(navigatorKey.currentContext ?? mainContext);
    return height * (size.height / designHeight);
  }

  /// Calculate the responsive font size based on the smaller screen dimension.
  double fs(
    double fontSize,
  ) {
    final size = MediaQuery.sizeOf(navigatorKey.currentContext ?? mainContext);
    return fontSize * min(size.width / designWidth, size.height / designHeight);
  }
}

/// Extension on [num] to simplify responsive scaling.
extension SizeExtension on num {
  /// Responsive width scaling based on the design dimensions.
  double w({double designWidth = dWidth}) {
    final size = MediaQuery.sizeOf(navigatorKey.currentContext ?? mainContext);
    return this * (size.width / dWidth);
  }

  /// Responsive height scaling based on the design dimensions.
  double h({double designHeight = dHeight}) {
    final size = MediaQuery.sizeOf(navigatorKey.currentContext ?? mainContext);
    return this * (size.height / designHeight);
  }

  /// Responsive font size scaling based on the smaller dimension.
  double fs({
    double designWidth = dWidth,
    double designHeight = dHeight,
  }) {
    final size = MediaQuery.sizeOf(navigatorKey.currentContext ?? mainContext);
    return this * min(size.width / designWidth, size.height / designHeight);
  }

  /// Vertical [SizedBox] based on responsive height.
  Widget verticalSB({double designHeight = dHeight}) {
    return SizedBox(height: h(designHeight: designHeight));
  }

  /// Horizontal [SizedBox] based on responsive width.
  Widget horizontalSB({double designWidth = dWidth}) {
    return SizedBox(width: w(designWidth: designWidth));
  }
}

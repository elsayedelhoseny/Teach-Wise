import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/widgets/clickable_animation.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.onTap,
    required this.text,
    this.gradient = AppColors.buttonGradient,
    this.colortxt,
    this.colorborder = Colors.transparent,
    this.heightButton = 40,
    this.horizontalMarge = 0.0,
    this.widthButton,
    this.radius = 10,
    this.verticalMarge,
    this.boxShadow = const [
      BoxShadow(
        color: Color(0x66D782F7),
        blurRadius: 20,
        offset: Offset(0, 4),
      ),
      BoxShadow(
        color: Color(0x33000000),
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
    this.textStyle,
  });

  final VoidCallback? onTap;
  final String text;
  final Gradient gradient;
  final Color? colortxt;
  final Color colorborder;
  final double heightButton;
  final double? widthButton;
  final double radius;
  final double horizontalMarge;
  final double? verticalMarge;
  final List<BoxShadow> boxShadow;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ClickableAnimation(
      onPressed: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: verticalMarge ?? 0,
          horizontal: horizontalMarge,
        ),
        width: widthButton ?? screenWidth,
        height: heightButton.h(),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: colorborder),
          boxShadow: boxShadow,
        ),
        child: Text(
          text,
          style: textStyle ?? AppTextStyles.text18SemiBold(),
        ),
      ),
    );
  }
}

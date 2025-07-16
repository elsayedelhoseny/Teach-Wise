import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/widgets/clickable_animation.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.onTap,
    required this.text,
    this.color,
    this.gradient,
    this.colortxt,
    this.colorborder = Colors.black,
    this.heightButton = 50,
    this.fontSizeTxt = 14,
    this.horizontalMarge = 0.0,
    this.fontWeightTxt = FontWeight.w400,
    this.widthButton,
    this.radius = 50,
    this.verticalMarge,
  });

  final VoidCallback? onTap;
  final String text;
  final Color? color;
  final Gradient? gradient;
  final Color? colortxt;
  final Color colorborder;
  final double? heightButton;
  final double? widthButton;
  final double? fontSizeTxt;
  final FontWeight? fontWeightTxt;
  final double radius;
  final double horizontalMarge;
  final double? verticalMarge;

  @override
  Widget build(BuildContext context) {
    return ClickableAnimation(
      onPressed: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: verticalMarge ?? 0,
          horizontal: horizontalMarge,
        ),
        decoration: BoxDecoration(
          color: gradient == null ? color : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: colorborder),
        ),
        width: widthButton,
        height: heightButton,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: colortxt ?? Colors.white,
            fontSize: fontSizeTxt,
            fontWeight: fontWeightTxt,
          ),
        ),
      ),
    );
  }
}

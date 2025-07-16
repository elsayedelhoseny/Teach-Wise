import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/widgets/clickable_animation.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.image,
    this.onPressed,
    this.color,
    this.useGradientOnImage = false,
  });

  final String image;
  final Color? color;
  final void Function()? onPressed;
  final bool useGradientOnImage;

  @override
  Widget build(BuildContext context) {
    return ClickableAnimation(
      onPressed: onPressed,
      child: Container(
        height: 64.h(context),
        width: 64.w(context),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? Colors.white,
        ),
        child: Center(
            child: ShaderMask(
          shaderCallback: (bounds) => AppColors.buttonGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          blendMode: BlendMode.srcIn,
          child: Image.asset(
            image,
            width: 28.w(context),
            height: 28.h(context),
          ),
        )),
      ),
    );
  }
}

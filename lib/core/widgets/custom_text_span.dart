import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTextSpan extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback? onSecondTextTap;

  const CustomTextSpan({
    super.key,
    required this.firstText,
    required this.secondText,
    this.onSecondTextTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: AppTextStyles.text12Light(color: const Color(0xffB2B2B2)),
          ),
          TextSpan(
            text: secondText,
            style: AppTextStyles.text12Light(
              color: AppColors.primary,
            ).copyWith(
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onSecondTextTap,
          ),
        ],
      ),
    );
  }
}

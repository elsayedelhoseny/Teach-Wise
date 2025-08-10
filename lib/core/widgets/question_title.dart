import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:flutter/material.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({
    super.key,
    required this.title,
    this.isForgetScreen = false,
    this.subTitle,
  });

  final String title;
  final String? subTitle;

  final bool isForgetScreen;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isForgetScreen ? 200.h() : 150.h(),
      width: double.infinity,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 112.h(),
            end: isForgetScreen ? 260.w() : 212.w(),
            child: Container(
              width: 31.w(),
              height: 18.h(),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFCE5CBF),
                    Color(0xFF7D58C7),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: isForgetScreen ? 101.h() : 100.h(),
            end: isForgetScreen ? 95.w() : 160.w(),
            child: Text(
              title,
              style: isForgetScreen
                  ? AppTextStyles.text28Bold().copyWith(
                      fontSize: 24.fs(),
                      color: isDarkMode()
                          ? AppColors.darkTextPrimary
                          : AppColors.textPrimary)
                  : AppTextStyles.text28Bold(
                      color: isDarkMode()
                          ? AppColors.darkTextPrimary
                          : AppColors.textPrimary),
            ),
          ),
          isForgetScreen
              ? PositionedDirectional(
                  top: 140.h(),
                  end: 102.w(),
                  child: Text(
                    subTitle ?? '',
                    style: AppTextStyles.text12Light(
                        color: isDarkMode()
                            ? AppColors.darkTextPrimary
                            : AppColors.textPrimary),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

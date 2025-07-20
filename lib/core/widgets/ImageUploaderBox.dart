import 'package:clean_arch_flutter/core/constants/images.dart';
import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';

class ImageUploaderBox extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const ImageUploaderBox({
    super.key,
    required this.onTap,
    this.title = 'اضغط هنا لتحميل الصورة الشخصية',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        color: Color(0xff6A6D73),
        borderType: BorderType.Rect,
        radius: const Radius.circular(10.53),
        dashPattern: const [4.21, 4.21],
        child: Container(
          height: 92.h(),
          width: 327.4886474609375.w(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icimageupload,
                height: 24.h(),
                width: 24.w(),
                color: isDarkMode() ? AppColors.darkPrimary : AppColors.primary,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: AppTextStyles.text14Regular(
                  color: isDarkMode()
                      ? AppColors.darkTextPrimary
                      : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '../constants/responsive.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../styles/app_text_styles.dart';
import '../styles/colors.dart';

class TeacherCard extends StatelessWidget {
  final String teacherName;
  final String subject;
  final String studentCode;
  final String imageUrl;
  final double rating;
  final int maxStars;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? subtitleColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final VoidCallback? onViewDetails;

  const TeacherCard({
    super.key,
    required this.teacherName,
    required this.subject,
    required this.studentCode,
    required this.imageUrl,
    this.rating = 5.0,
    this.maxStars = 5,
    this.backgroundColor,
    this.textColor,
    this.subtitleColor,
    this.borderRadius = 16.0,
    this.onTap,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final cardBackgroundColor = backgroundColor ??
        (isDarkMode() ? AppColors.darkSurface : AppColors.gray);
    final primaryTextColor = textColor ??
        (isDarkMode() ? AppColors.darkTextPrimary : AppColors.textPrimary);
    final secondaryTextColor = subtitleColor ??
        (isDarkMode() ? AppColors.darkTextSecondary : AppColors.textSecondary);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.all(8),
        width: 327.w(),
        decoration: BoxDecoration(
          color: cardBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                7.horizontalSB(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            teacherName,
                            style: AppTextStyles.text18SemiBold(
                                color: primaryTextColor),
                            textDirection: TextDirection.rtl,
                          ),
                          4.horizontalSB(),
                          Text(
                            subject,
                            style: AppTextStyles.text14Regular(
                                color: secondaryTextColor),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(maxStars, (index) {
                          return Icon(
                            index < rating ? Icons.star : Icons.star_border,
                            color: Colors.yellow[600],
                            size: 10,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            12.verticalSB(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(context.tr.student_code,
                        style: AppTextStyles.text12Regular(
                            color: secondaryTextColor)),
                    4.horizontalSB(),
                    Text(
                      studentCode,
                      style:
                          AppTextStyles.text14Regular(color: primaryTextColor)
                              .copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onViewDetails,
                  child: Text(
                    context.tr.view_details,
                    style: AppTextStyles.text14Regular(color: AppColors.primary)
                        .copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

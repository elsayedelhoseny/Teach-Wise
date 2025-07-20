import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';

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
        (isDarkMode() ? AppColors.darkSurface : AppColors.surface);
    final primaryTextColor = textColor ??
        (isDarkMode() ? AppColors.darkTextPrimary : AppColors.textPrimary);
    final secondaryTextColor = subtitleColor ??
        (isDarkMode() ? AppColors.darkTextSecondary : AppColors.textSecondary);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color:
                  (isDarkMode() ? Colors.black : Colors.grey).withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imageUrl),
                  backgroundColor:
                      isDarkMode() ? AppColors.darkBorder : AppColors.border,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        teacherName,
                        style: AppTextStyles.text18SemiBold(
                            color: primaryTextColor),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subject,
                        style: AppTextStyles.text14Regular(
                            color: secondaryTextColor),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(maxStars, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.yellow[600],
                  size: 24,
                );
              }),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      ":كود الطالب",
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      studentCode,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onViewDetails,
                  child: Text(
                    "عرض التفاصيل",
                    style: TextStyle(
                      color: const Color(0xFF6366F1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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

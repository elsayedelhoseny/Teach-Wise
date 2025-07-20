import 'package:clean_arch_flutter/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';

class ProfileCardOption extends StatelessWidget {
  final String label;
  final String? imagePath;
  final String? imageUrl;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ProfileCardOption({
    super.key,
    required this.label,
    required this.onTap,
    this.imagePath,
    this.imageUrl,
    this.isSelected = false,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final bool showMenu = onEdit != null || onDelete != null;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(vertical: 24.h()),
            width: 158.w(),
            height: 132.h(),
            decoration: BoxDecoration(
              color: isDarkMode() ? AppColors.darkSurface : AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? (isDarkMode() ? AppColors.darkPrimary : AppColors.primary)
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imageUrl != null)
                  CircleAvatar(
                    radius: 20.h(),
                    backgroundImage: NetworkImage(imageUrl!),
                  )
                else if (imagePath != null)
                  Image.asset(
                    imagePath!,
                    height: 32.h(),
                    width: 32.w(),
                    color: isDarkMode()
                        ? AppColors.darkPrimary
                        : AppColors.primary,
                  ),
                12.verticalSB(),
                Text(
                  label,
                  style: AppTextStyles.text16Regular(
                    color: isDarkMode()
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          if (showMenu)
            Positioned(
              top: 0,
              right: 0,
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') onEdit?.call();
                  if (value == 'delete') onDelete?.call();
                },
                color: Theme.of(context).cardColor.withValues(alpha: 0.8),
                offset: const Offset(0, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                itemBuilder: (context) => [
                  if (onEdit != null)
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Image.asset(icedit, width: 12.w(), height: 12.h()),
                          8.horizontalSB(),
                          Text(
                            'تعديل البيانات',
                            style: AppTextStyles.text16Regular(),
                          ),
                        ],
                      ),
                    ),
                  // if (onEdit != null && onDelete != null)
                  //   const PopupMenuDivider(

                  //   ),
                  if (onDelete != null)
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Image.asset(ictrash, width: 12.w(), height: 12.h()),
                          8.horizontalSB(),
                          Text(
                            'حذف الابن',
                            style: AppTextStyles.text16Regular(),
                          ),
                        ],
                      ),
                    ),
                ],
                icon: CircleAvatar(
                  backgroundColor: Color(0xff1B2132),
                  child: const Icon(Icons.more_vert,
                      color: Colors.white, size: 20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

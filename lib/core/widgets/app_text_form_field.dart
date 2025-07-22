import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool enableSuffix;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? suffixPressed;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged;

  const AppTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.enableSuffix = false,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixPressed,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.text18Regular(
              color: isDarkMode()
                  ? AppColors.inputBackground
                  : AppColors.darkBackground),
        ),
        14.verticalSB(),
        DefaultFormField(
          controller: controller,
          hintText: hintText,
          keyboard: keyboardType,
          isPassword: isPassword,
          suffixIcon: suffixIcon,
          enableSuffix: enableSuffix,
          suffixPressed: suffixPressed,
          prefixIcon: prefixIcon,
          enablePrefix: prefixIcon != null,
          validate: validator,
          maxLines: maxLines,
          noInput: readOnly,
          onTap: onTap,
          onChange: onChanged,
        ),
      ],
    );
  }
}

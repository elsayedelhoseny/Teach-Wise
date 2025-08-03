import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/widgets/animated_widget.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final int? maxLines;
  final int? hintMaxLines;
  final double? height;
  final double? borderWidth;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final double? errorTextHeight;
  final double? errorTextFontSize;
  final TextStyle? formTextStyle;
  final TextStyle? hintTextStyle;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Icon? noSuffix;
  final Widget? suffixWidget;
  final Icon? noPrefix;
  final VoidCallback? suffixPressed;
  final String? hintText;
  final FormFieldValidator<String>? validate;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final TextInputType? keyboard;
  final TextDirection? textDirection;
  final bool isPassword;
  final bool autofocus;
  final bool noInput;
  final bool enablePrefix;
  final bool enableSuffix;
  final VoidCallback? onTap;
  final AutovalidateMode? autoValidator;
  final void Function(PointerDownEvent)? onTapOutside;

  const DefaultFormField({
    super.key,
    this.controller,
    this.label,
    this.focusNode,
    this.noPrefix,
    this.noSuffix,
    this.maxLines,
    this.hintMaxLines,
    this.height,
    this.borderWidth,
    this.hintTextStyle,
    this.radius,
    this.padding,
    this.errorTextHeight,
    this.errorTextFontSize,
    this.formTextStyle,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.borderColor,
    this.focusBorderColor,
    this.fillColor,
    this.hintText,
    this.suffixWidget,
    this.suffixIcon,
    this.suffixPressed,
    this.validate,
    this.autoValidator,
    this.onTapOutside,
    this.onChange,
    this.onSubmit,
    this.keyboard,
    this.isPassword = false,
    this.autofocus = false,
    this.noInput = false,
    this.enablePrefix = false,
    this.enableSuffix = false,
    this.onTap,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultAnimatedBuilder(
      animatedChild: SizedBox(
        height: height ?? 38.h(),
        child: Center(
          child: TextFormField(
            autofocus: autofocus,
            focusNode: focusNode,
            textAlign:
                context.tr.localeName == 'ar' ? TextAlign.end : TextAlign.start,
            textDirection: TextDirection.ltr,
            style: formTextStyle ??
                AppTextStyles.text16Regular(
                  color: isDarkMode()
                      ? AppColors.darkTextPrimary
                      : AppColors.textPrimary,
                ),
            validator: validate,
            readOnly: noInput,
            controller: controller,
            onChanged: onChange,
            autovalidateMode:
                autoValidator ?? AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              errorMaxLines: 2,
              errorStyle: TextStyle(
                height: errorTextHeight ?? 0.1.h(),
                fontSize: errorTextFontSize ?? 12.w(),
              ),
              filled: true,
              fillColor: (isDarkMode()
                  ? AppColors.fillColorDark
                  : AppColors.fillColor),
              contentPadding: const EdgeInsetsDirectional.only(start: 10),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ??
                      (isDarkMode() ? AppColors.darkBorder : AppColors.border),
                  width: borderWidth ?? 1,
                ),
                borderRadius: BorderRadius.circular((radius ?? 12).w()),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ??
                      (isDarkMode() ? AppColors.darkBorder : AppColors.border),
                  width: borderWidth ?? 1,
                ),
                borderRadius: BorderRadius.circular((radius ?? 12).w()),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusBorderColor ??
                      (isDarkMode()
                          ? AppColors.darkPrimary
                          : AppColors.primary),
                  width: borderWidth ?? 1,
                ),
                borderRadius: BorderRadius.circular((radius ?? 15).w()),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular((radius ?? 15).w()),
              ),
              labelText: label,
              labelStyle: TextStyle(
                color: isDarkMode()
                    ? AppColors.darkTextSecondary
                    : AppColors.textSecondary,
                fontFamily: 'noto',
                fontSize: context.tr.localeName == 'ar' ? 20.w() : 22.w(),
              ),
              alignLabelWithHint: true,
              prefixIcon: enablePrefix
                  ? Container(
                      margin: const EdgeInsetsDirectional.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        border: BorderDirectional(
                          end: BorderSide(
                            color: prefixIconColor ??
                                (isDarkMode()
                                    ? AppColors.darkTextSecondary
                                    : AppColors.textSecondary),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Icon(
                        prefixIcon,
                      ),
                    )
                  : noPrefix,
              prefixIconColor: prefixIconColor ??
                  (isDarkMode()
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary),
              suffixIconColor: suffixIconColor ??
                  (isDarkMode()
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary),
              suffixIcon: enableSuffix
                  ? suffixWidget ??
                      IconButton(
                        icon: Icon(suffixIcon),
                        onPressed: suffixPressed,
                      )
                  : noSuffix,
              hintText: hintText,
              hintMaxLines: hintMaxLines ?? 1,
              hintStyle: hintTextStyle ??
                  AppTextStyles.text14Regular(
                    color: isDarkMode()
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
              hintTextDirection: TextDirection.ltr,
            ),
            keyboardType: keyboard ?? TextInputType.text,
            obscureText: isPassword,
            onTapOutside: onTapOutside ??
                (pointerDownEvent) {
                  FocusScope.of(context).unfocus();
                },
            onTap: onTap,
            onFieldSubmitted: onSubmit,
            onEditingComplete: () {
              FocusScope.of(context).nearestScope.nextFocus();
            },
          ),
        ),
      ),
    );
  }
}

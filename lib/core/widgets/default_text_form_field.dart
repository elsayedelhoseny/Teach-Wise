import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/widgets/animated_widget.dart';
import 'package:flutter/material.dart';

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
      animatedChild: Padding(
        padding: padding ?? EdgeInsets.only(top: 12.h(context)),
        child: SizedBox(
          height: height ?? 75.h(context),
          width: screenWidth(context),
          child: TextFormField(
            autofocus: autofocus,
            focusNode: focusNode,
            textAlign: getLocalizedText(context).localeName == 'ar'
                ? TextAlign.end
                : TextAlign.start,
            textDirection: TextDirection.ltr,
            style: formTextStyle ??
                TextStyle(
                    fontSize: getLocalizedText(context).localeName == 'ar'
                        ? 20.w(context)
                        : 18.w(context),
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'noto',
                    height: 2.h(context)),
            validator: validate,
            readOnly: noInput,
            controller: controller,
            onChanged: onChange,
            autovalidateMode:
                autoValidator ?? AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                errorMaxLines: 2,
                errorStyle: TextStyle(
                  height: errorTextHeight ?? 0.1.h(context),
                  fontSize: errorTextFontSize ?? 12.w(context),
                ),
                filled: true,
                fillColor: fillColor ?? Colors.transparent,
                contentPadding: const EdgeInsetsDirectional.only(start: 10),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          // borderColor ??
                          AppColors.gray,
                      width: borderWidth ?? 1),
                  borderRadius:
                      BorderRadius.circular((radius ?? 15).w(context)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? AppColors.gray,
                      width: borderWidth ?? 1),
                  borderRadius:
                      BorderRadius.circular((radius ?? 15).w(context)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: focusBorderColor ?? AppColors.gray,
                      width: borderWidth ?? 1),
                  borderRadius:
                      BorderRadius.circular((radius ?? 15).w(context)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius:
                      BorderRadius.circular((radius ?? 15).w(context)),
                ),
                labelText: label,
                labelStyle: TextStyle(
                  color: AppColors.gray,
                  fontFamily: 'noto',
                  fontSize: getLocalizedText(context).localeName == 'ar'
                      ? 20.w(context)
                      : 22.w(context),
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
                          color: prefixIconColor ?? AppColors.gray,
                          width: 1,
                        ))),
                        child: Icon(
                          prefixIcon,
                        ),
                      )
                    : noPrefix,
                prefixIconColor: prefixIconColor ?? AppColors.gray,
                suffixIconColor: suffixIconColor ?? AppColors.gray,
                suffixIcon: enableSuffix
                    ? suffixWidget ??
                        IconButton(
                          icon: Icon(
                            suffixIcon,
                          ),
                          onPressed: suffixPressed,
                        )
                    : noSuffix,
                hintText: hintText,
                hintMaxLines: hintMaxLines ?? 1,
                hintStyle: hintTextStyle ??
                    const TextStyle(
                      color: AppColors.gray,
                    ),
                hintTextDirection: TextDirection.ltr),
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

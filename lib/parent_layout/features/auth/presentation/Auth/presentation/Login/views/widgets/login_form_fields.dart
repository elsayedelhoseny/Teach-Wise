import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/widgets/app_text_form_field.dart';
import 'package:clean_arch_flutter/core/widgets/clickable_animation.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';

class LoginFormFields extends StatefulWidget {
  const LoginFormFields(
      {super.key,
      required this.emailController,
      required this.passwordController});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          label: 'البريد الالكتروني',
          hintText: 'ادخل البريد الالكتروني',
          keyboardType: TextInputType.emailAddress,
          controller: widget.emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'البريد الإلكتروني مطلوب';
            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                .hasMatch(value)) {
              return 'البريد الإلكتروني غير صالح';
            }
            return null;
          },
        ),
        10.verticalSB(),
        AppTextFormField(
          label: 'كلمة المرور',
          hintText: 'ادخل كلمة المرور',
          keyboardType: TextInputType.visiblePassword,
          controller: widget.passwordController,
          isPassword: !isPasswordVisible,
          enableSuffix: true,
          suffixIcon:
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          suffixPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'كلمة المرور مطلوبة';
            } else if (value.length < 6) {
              return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
            }
            return null;
          },
        ),
        8.verticalSB(),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: ClickableAnimation(
            onPressed: () {},
            child: Text("هل نسيت كلمة المرور؟",
                style: AppTextStyles.text14Regular(
                  color: isDarkMode()
                      ? AppColors.darkPrimary
                      : AppColors.darkPrimary,
                ).copyWith(
                  decoration: TextDecoration.underline,
                )),
          ),
        ),
      ],
    );
  }
}

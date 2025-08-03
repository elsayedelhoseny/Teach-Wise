import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/widgets/app_text_form_field.dart';
import 'package:clean_arch_flutter/core/widgets/clickable_animation.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';

class LoginFormFields extends StatefulWidget {
  const LoginFormFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

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
          label: context.tr.email,
          hintText: context.tr.enter_email,
          keyboardType: TextInputType.emailAddress,
          controller: widget.emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.tr.email_again;
            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                .hasMatch(value)) {
              return context.tr.unacceptablePhoneNum;
            }
            return null;
          },
        ),
        10.verticalSB(),
        AppTextFormField(
          label: context.tr.password,
          hintText: context.tr.enter_password,
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
              return context.tr.password;
            } else if (value.length < 6) {
              return context.tr.eightCharacterPassword;
            }
            return null;
          },
        ),
        8.verticalSB(),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: ClickableAnimation(
            onPressed: () {},
            child: Text(
              context.tr.forgot_password,
              style: AppTextStyles.text14Regular(
                color: isDarkMode()
                    ? AppColors.darkPrimary
                    : AppColors.darkPrimary,
              ).copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

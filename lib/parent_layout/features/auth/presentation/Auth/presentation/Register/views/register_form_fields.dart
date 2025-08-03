import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/widgets/app_text_form_field.dart';

class RegisterFormFields extends StatefulWidget {
  const RegisterFormFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<RegisterFormFields> createState() => _RegisterFormFieldsState();
}

class _RegisterFormFieldsState extends State<RegisterFormFields> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          label: context.tr.enter_full_name,
          hintText: context.tr.enter_full_name,
          controller: widget.nameController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return context.tr.enter_full_name;
            }
            return null;
          },
        ),
        4.verticalSB(),
        AppTextFormField(
          label: context.tr.phone,
          hintText: context.tr.enter_phone,
          keyboardType: TextInputType.phone,
          controller: widget.phoneController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return context.tr.phoneFieldEmpty;
            } else if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
              return context.tr.unacceptablePhoneNum;
            }
            return null;
          },
        ),
        4.verticalSB(),
        AppTextFormField(
          label: context.tr.email,
          hintText: context.tr.enter_email,
          keyboardType: TextInputType.emailAddress,
          controller: widget.emailController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return context.tr.email_again;
            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                .hasMatch(value)) {
              return context.tr.unacceptablePhoneNum;
            }
            return null;
          },
        ),
        4.verticalSB(),
        AppTextFormField(
          label: context.tr.password,
          hintText: context.tr.enter_password,
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
        4.verticalSB(),
        AppTextFormField(
          label: context.tr.confirm_password,
          hintText: context.tr.reenter_child_password,
          controller: widget.confirmPasswordController,
          isPassword: !isConfirmPasswordVisible,
          enableSuffix: true,
          suffixIcon: isConfirmPasswordVisible
              ? Icons.visibility
              : Icons.visibility_off,
          suffixPressed: () {
            setState(() {
              isConfirmPasswordVisible = !isConfirmPasswordVisible;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.tr.confirm_password;
            } else if (value != widget.passwordController.text) {
              return context.tr.passwords_do_not_match;
            }
            return null;
          },
        ),
      ],
    );
  }
}

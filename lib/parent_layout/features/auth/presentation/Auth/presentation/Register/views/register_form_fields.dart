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
          label: 'الاسم الكامل',
          hintText: 'ادخل الاسم',
          controller: widget.nameController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'الاسم مطلوب';
            }
            return null;
          },
        ),
        4.verticalSB(),
        AppTextFormField(
          label: 'رقم الهاتف',
          hintText: 'ادخل رقم الهاتف',
          keyboardType: TextInputType.phone,
          controller: widget.phoneController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'رقم الهاتف مطلوب';
            } else if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
              return 'رقم الهاتف غير صالح';
            }
            return null;
          },
        ),
        4.verticalSB(),
        AppTextFormField(
          label: 'البريد الالكتروني',
          hintText: 'ادخل البريد الالكتروني',
          keyboardType: TextInputType.emailAddress,
          controller: widget.emailController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'البريد الإلكتروني مطلوب';
            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                .hasMatch(value)) {
              return 'البريد الإلكتروني غير صالح';
            }
            return null;
          },
        ),
        4.verticalSB(),
        AppTextFormField(
          label: 'كلمة المرور',
          hintText: 'ادخل كلمة المرور',
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
        4.verticalSB(),
        AppTextFormField(
          label: 'تأكيد كلمة المرور',
          hintText: 'اعد كتابة كلمة المرور',
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
              return 'تأكيد كلمة المرور مطلوب';
            } else if (value != widget.passwordController.text) {
              return 'كلمتا المرور غير متطابقتين';
            }
            return null;
          },
        ),
      ],
    );
  }
}

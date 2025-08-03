import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/widgets/app_text_form_field.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';

class ForgotFormField extends StatelessWidget {
  const ForgotFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0.w()),
      child: AppTextFormField(
        label: context.tr.email,
        hintText: context.tr.enter_email,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return context.tr.email_again;
          } else if (!_isValidEmail(value.trim())) {
            return context.tr.unacceptablePhoneNum;
          }
          return null;
        },
      ),
    );
  }

  bool _isValidEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    return emailRegex.hasMatch(value);
  }
}

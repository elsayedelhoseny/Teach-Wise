import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/widgets/default_button.dart';
import 'package:clean_arch_flutter/core/widgets/question_title.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/forgot_password/presentation/views/widgets/forgot_form_fields.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          QuestionTitle(
            isForgetScreen: true,
            subTitle: 'أدخل البريد الالكتروني  لاستعادة كلمة المرور',
            title: 'نسيت كلمة المرور؟',
          ),
          ForgotFormField(controller: controller),
          32.verticalSB(),
          DefaultButton(
            horizontalMarge: 32.0.w(),
            text: context.tr.confirm,
            colortxt: isDarkMode()
                ? AppColors.darkTextPrimary
                : AppColors.textPrimary,
            onTap: () {
              if (formKey.currentState!.validate()) {
                debugPrint('Email is valid: ${controller.text}');
              }
            },
          ),
        ],
      ),
    );
  }
}

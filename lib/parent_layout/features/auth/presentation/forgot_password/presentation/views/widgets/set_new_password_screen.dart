import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/constants/responsive.dart';
import '../../../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../../../core/widgets/default_button.dart';
import '../../../../../../../../core/widgets/auth_background_scaffold.dart';
import '../../../../../../../../core/widgets/question_title.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              QuestionTitle(
                title: context.tr.enter_new_password,
              ),
              40.verticalSB(),
              AppTextFormField(
                label: context.tr.new_password,
                hintText: context.tr.enter_new_password,
                keyboardType: TextInputType.visiblePassword,
                controller: newPasswordController,
                isPassword: !isNewPasswordVisible,
                enableSuffix: true,
                suffixIcon: isNewPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                suffixPressed: () {
                  setState(() {
                    isNewPasswordVisible = !isNewPasswordVisible;
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
              16.verticalSB(),
              AppTextFormField(
                label: context.tr.confirm_password,
                hintText: context.tr.eightCharacterPassword,
                keyboardType: TextInputType.visiblePassword,
                controller: confirmPasswordController,
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
                    return context.tr.password;
                  } else if (value != newPasswordController.text) {
                    return context.tr.passwords_do_not_match;
                  }
                  return null;
                },
              ),
              32.verticalSB(),
              DefaultButton(
                text: context.tr.confirm,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print("New Password Saved");
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

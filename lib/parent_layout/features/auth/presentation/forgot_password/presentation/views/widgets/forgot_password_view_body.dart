import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/widgets/default_button.dart';
import 'package:clean_arch_flutter/core/widgets/question_title.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/forgot_password/presentation/views/widgets/forgot_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/router/app_router_names.dart';
import '../../../manger/forgot_password_cubit.dart';
import '../../../manger/forgot_password_state.dart';

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
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordEmailSent) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushNamed(context, AppRouterNames.rOtpVerificationRoute);
        } else if (state is ForgotPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              QuestionTitle(
                isForgetScreen: true,
                subTitle: context.tr.enter_email_to_restore_password,
                title: context.tr.forgot_password,
              ),
              ForgotFormField(controller: controller),
              32.verticalSB(),
              state is ForgotPasswordLoading
                  ? CircularProgressIndicator()
                  : DefaultButton(
                      horizontalMarge: 32.0.w(),
                      text: context.tr.confirm,
                      colortxt: isDarkMode()
                          ? AppColors.darkTextPrimary
                          : AppColors.textPrimary,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          ForgotPasswordCubit.of(context)
                              .sendResetEmail(controller.text);
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}

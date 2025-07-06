import 'package:clean_arch_flutter/core/widgets/default_button.dart';
import 'package:clean_arch_flutter/core/widgets/default_platform_loading_indicator.dart';
import 'package:clean_arch_flutter/features/auth/presentation/forgot_password/presentation/manger/forgot_password_cubit.dart';
import 'package:clean_arch_flutter/features/auth/presentation/forgot_password/presentation/manger/forgot_password_state.dart';
import 'package:clean_arch_flutter/features/auth/presentation/forgot_password/presentation/views/widgets/forgot_form_fields.dart';
import 'package:clean_arch_flutter/features/auth/presentation/forgot_password/verify_code/presentation/views/verify_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../login/presentation/manger/login_cubit/login_state.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;

  const ForgotPasswordViewBody({
    super.key,
    required this.emailController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VerifyCodeScreen(email: emailController.text),
              ),
            );
          } else if (state is ForgotPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                ForgotFormFields(
                  emailController: emailController,
                  onSubmit: (p0) {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<ForgotPasswordCubit>()
                          .sendResetCode(email: emailController.text);
                    }
                  },
                ),
                const SizedBox(height: 20),
                state is LoginLoading
                    ? const PlatformLoadingIndicator()
                    : DefaultButton(
                        label: "Send Reset Link",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<ForgotPasswordCubit>()
                                .sendResetCode(email: emailController.text);
                          }
                        },
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}

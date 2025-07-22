import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/forgot_password/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: ForgotPasswordViewBody(
        emailController: emailController,
        formKey: formKey,
      ),
    );
  }
}

import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(
        emailController: emailController,
        passwordController: passwordController,
        formKey: formKey,
      ),
    );
  }
}

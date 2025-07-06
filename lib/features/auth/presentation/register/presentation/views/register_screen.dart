import 'package:clean_arch_flutter/features/auth/presentation/register/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final GlobalKey one = GlobalKey();
  final GlobalKey two = GlobalKey();
  final GlobalKey there = GlobalKey();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterViewBody(
        one: one,
        mobileController: mobileController,
        userNameController: userNameController,
        emailController: emailController,
        passwordController: passwordController,
        formKey: formKey,
      ),
    );
  }
}

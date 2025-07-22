import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/widgets/default_button.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Login/manger/login_cubit.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Login/manger/login_states.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Login/views/widgets/login_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('✅ ${state.message}')),
          );
        } else if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('❌ ${state.error}')),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0.w()),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  LoginFormFields(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  32.verticalSB(),
                  state is LoginLoading
                      ? const CircularProgressIndicator()
                      : DefaultButton(
                          text: 'تسجيل',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginCubit>().userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

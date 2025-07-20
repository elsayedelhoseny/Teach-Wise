import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/features/auth/data/data_sources/login_remote_data_source.dart';
import 'package:clean_arch_flutter/features/auth/data/repos/login_repo_impl.dart';
import 'package:clean_arch_flutter/features/auth/domain/use_cases/user_login_use_case.dart';
import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/manger/login_cubit/login_cubit.dart';
import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/manger/login_cubit/login_state.dart';
import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/views/widgets/login_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginViewBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(UserLoginUseCase(
          LoginRepoImpl(loginRemoteDataSource: LoginRemoteDataSourceImpl()))),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {}
          if (state is LoginFailure) {}
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                LoginFormFields(
                  emailController: emailController,
                  passwordController: passwordController,
                  onSubmit: (p0) {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginCubit>().userLogin(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

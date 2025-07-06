import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/text_styles.dart';
import 'package:clean_arch_flutter/core/widgets/default_button.dart';
import 'package:clean_arch_flutter/core/widgets/default_platform_loading_indicator.dart';
import 'package:clean_arch_flutter/core/widgets/navigate_finish.dart';
import 'package:clean_arch_flutter/features/auth/data/data_sources/login_remote_data_source.dart';
import 'package:clean_arch_flutter/features/auth/data/repos/login_repo_impl.dart';
import 'package:clean_arch_flutter/features/auth/domain/use_cases/user_login_use_case.dart';
import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/manger/login_cubit/login_cubit.dart';
import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/manger/login_cubit/login_state.dart';
import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/views/widgets/login_form_fields.dart';
import 'package:clean_arch_flutter/features/auth/presentation/register/presentation/views/register_screen.dart';
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
          if (state is LoginSuccess) {
            showToast(
              context: context,
              text: getLocalizedText(context).loginsuccess,
              color: ToastColors.SUCCESS,
            );
          }
          if (state is LoginFailure) {
            showToast(
              context: context,
              text: state.error,
              color: ToastColors.ERROR,
            );
          }
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
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {},
                    child: RegularText(
                      text: getLocalizedText(context).forgetPass,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                state is LoginLoading
                    ? const PlatformLoadingIndicator()
                    : Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: screenHeight(context, dividedBy: 50),
                          bottom: screenHeight(context, dividedBy: 40),
                        ),
                        child: DefaultButton(
                          width: double.infinity,
                          height: 48.h(context),
                          label: getLocalizedText(context).login,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginCubit>().userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        ),
                      ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RegularText(
                                text: getLocalizedText(context).noAccount,
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  navigateAndFinish(
                                      context, const RegisterScreen());
                                },
                                child: RegularText(
                                  text: getLocalizedText(context).newAccount,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
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

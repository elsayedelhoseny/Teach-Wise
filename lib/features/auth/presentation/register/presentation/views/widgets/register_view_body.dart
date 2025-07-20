import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/widgets/default_platform_loading_indicator.dart';
import 'package:clean_arch_flutter/core/widgets/navigate_finish.dart';
import 'package:clean_arch_flutter/features/auth/data/data_sources/register_remote_data_source.dart';
import 'package:clean_arch_flutter/features/auth/data/repos/register_repo_impl.dart';
import 'package:clean_arch_flutter/features/auth/domain/use_cases/user_rigester_use_case.dart';
import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/views/login_screen.dart';
import 'package:clean_arch_flutter/features/auth/presentation/register/presentation/manger/register_cubit/register_cubit.dart';
import 'package:clean_arch_flutter/features/auth/presentation/register/presentation/manger/register_cubit/register_state.dart';
import 'package:clean_arch_flutter/features/auth/presentation/register/presentation/views/widgets/register_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final GlobalKey one;

  const RegisterViewBody({
    super.key,
    required this.one,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.userNameController,
    required this.mobileController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(UserRigesterUseCase(RigesterRepoImpl(
          rigesterRemoteDataSource: RigesterRemoteDataSourceImpl()))),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterSuccess) {}
          if (state is RegisterFailure) {}
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                RegisterFormFields(
                  userNameController: userNameController,
                  mobileController: mobileController,
                  passwordController: passwordController,
                  emailController: emailController,
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

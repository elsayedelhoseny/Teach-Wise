import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/widgets/default_button.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Register/manger/register_cubit.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Register/manger/register_states.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Register/views/register_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    final formKey = GlobalKey<FormState>(); // ✅

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('✅ ${state.message}')),
          );
        } else if (state is RegisterError) {
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
                  RegisterFormFields(
                    nameController: nameController,
                    phoneController: phoneController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                  ),
                  32.verticalSB(),
                  state is RegisterLoading
                      ? const CircularProgressIndicator()
                      : DefaultButton(
                          text: context.tr.register,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<RegisterCubit>().userRegister(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    confirmPassword:
                                        confirmPasswordController.text,
                                  );
                            }
                          },
                        ),
                  20.verticalSB(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

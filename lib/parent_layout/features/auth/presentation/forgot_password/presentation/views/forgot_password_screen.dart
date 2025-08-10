import 'package:clean_arch_flutter/core/widgets/auth_background_scaffold.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/forgot_password/manger/forgot_password_cubit.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/forgot_password/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      body: BlocProvider(
        create: (context) => ForgotPasswordCubit(),
        child: ForgotPasswordViewBody(),
      ),
    );
  }
}

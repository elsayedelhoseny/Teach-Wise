import 'package:clean_arch_flutter/features/auth/presentation/forgot_password/verify_code/presentation/manger/verify_code_cubit.dart';
import 'package:clean_arch_flutter/features/auth/presentation/forgot_password/verify_code/presentation/manger/verify_code_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyCodeScreen extends StatelessWidget {
  final String email;

  const VerifyCodeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyCodeCubit()..resendCode(email: email),
      child: Scaffold(
        appBar: AppBar(title: const Text('Verify Code')),
        body: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
          listener: (context, state) {
            if (state is VerifyCodeSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Code verified!')),
              );
            } else if (state is VerifyCodeFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            } else if (state is VerifyCodeResent) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Code resent!')),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<VerifyCodeCubit>();
            int seconds = 0;

            if (state is VerifyCodeTimerUpdate) {
              seconds = state.secondsRemaining;
            } else {
              seconds = cubit.secondsRemaining;
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter the code sent to $email',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(15),
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      cubit.verifyCode(email: email, code: verificationCode);
                    },
                  ),
                  const SizedBox(height: 32),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: seconds == 0
                        ? () => cubit.resendCode(email: email)
                        : null,
                    child: Text(
                      seconds == 0 ? 'Resend Code' : 'Resend in $seconds s',
                      style: TextStyle(
                        color: seconds == 0
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

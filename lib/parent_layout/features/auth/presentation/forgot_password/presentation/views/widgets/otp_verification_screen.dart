import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/constants/responsive.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/router/app_router_names.dart';
import '../../../../../../../../core/styles/colors.dart';
import '../../../../../../../../core/widgets/auth_background_scaffold.dart';
import '../../../../../../../../core/widgets/default_button.dart';
import '../../../../../../../../core/widgets/custom_text_span.dart';
import '../../../../../../../../core/widgets/pin_input_row.dart';
import '../../../../../../../../core/widgets/question_title.dart';
import '../../../manger/forgot_password_cubit.dart';
import '../../../manger/forgot_password_state.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordOtpVerified) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );

            Navigator.pushReplacementNamed(
                context, AppRouterNames.rSetNewPasswordRoute);
          } else if (state is ForgotPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  QuestionTitle(
                    isForgetScreen: true,
                    subTitle: context.tr.enter_passcode_4_chars,
                    title: context.tr.enter_verification_code,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w()),
                    child: PinInputRow(
                      pFController: otpController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return context.tr.enter_code_again;
                        } else if (value.trim().length < 4) {
                          return context.tr.code_must_be_4_digits;
                        }
                        return null;
                      },
                      onCompleted: (value) {
                        debugPrint('OTP Entered: $value');
                      },
                    ),
                  ),
                  16.verticalSB(),
                  CustomTextSpan(
                    firstText: context.tr.did_not_receive_code,
                    secondText: context.tr.resend,
                    onSecondTextTap: () {
                      debugPrint('Resend code tapped');
                    },
                  ),
                  32.verticalSB(),
                  DefaultButton(
                    horizontalMarge: 32.w(),
                    text: context.tr.confirm,
                    colortxt: isDarkMode()
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        ForgotPasswordCubit.of(context)
                            .verifyOtp(otpController.text.trim());
                      }
                    },
                  ),
                  16.verticalSB(),
                  CustomTextSpan(
                    firstText: context.tr.remember_password,
                    secondText: context.tr.login,
                    onSecondTextTap: () {
                      debugPrint('Navigate to Register');
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

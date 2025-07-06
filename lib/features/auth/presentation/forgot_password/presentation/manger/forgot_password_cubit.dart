import 'package:clean_arch_flutter/features/auth/presentation/forgot_password/presentation/manger/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  void sendResetCode({required String email}) async {
    emit(ForgotPasswordLoading());
    await Future.delayed(const Duration(seconds: 2)); // simulate API call

    // simulate success
    if (email == 'test@example.com') {
      emit(ForgotPasswordSuccess());
    } else {
      emit(ForgotPasswordFailure(error: 'Email not found'));
    }
  }
}

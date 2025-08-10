import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/Apis/end_points.dart';
import '../../../../../../core/Apis/dioHelper/dio_helper.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  static ForgotPasswordCubit of(context) => BlocProvider.of(context);

  /// 1 - إرسال الإيميل
  Future<void> sendResetEmail(String email) async {
    emit(ForgotPasswordLoading());
    try {
      final response = await DioHelper.postData(
        url: EndPoint.forgotPassword,
        data: {'email': email},
      );
      emit(ForgotPasswordEmailSent(
          response.data['message'] ?? 'Email sent successfully'));
    } catch (e) {
      emit(ForgotPasswordError(e.toString()));
    }
  }

  /// 2 - التحقق من OTP
  Future<void> verifyOtp(String otp) async {
    emit(ForgotPasswordLoading());
    try {
      final response = await DioHelper.postData(
        url: EndPoint.verifyOtp,
        data: {'otp': otp},
      );
      emit(ForgotPasswordOtpVerified(
          response.data['message'] ?? 'OTP verified'));
    } catch (e) {
      emit(ForgotPasswordError(e.toString()));
    }
  }

  /// 3 - تعيين كلمة المرور الجديدة
  Future<void> setNewPassword(String password, String confirmPassword) async {
    emit(ForgotPasswordLoading());
    try {
      final response = await DioHelper.postData(
        url: EndPoint.resetPassword,
        data: {
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );
      emit(ForgotPasswordPasswordChanged(
          response.data['message'] ?? 'Password reset successfully'));
    } catch (e) {
      emit(ForgotPasswordError(e.toString()));
    }
  }
}

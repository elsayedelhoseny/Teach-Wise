import 'package:clean_arch_flutter/core/Apis/dioHelper/dio_helper.dart';
import 'package:clean_arch_flutter/core/Apis/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final response = await DioHelper.postData(
        url: EndPoint.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      final message = response.data["message"];

      emit(LoginSuccess(message));
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }
}

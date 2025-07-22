import 'package:clean_arch_flutter/core/Apis/dioHelper/dio_helper.dart';
import 'package:clean_arch_flutter/core/Apis/end_points.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Register/manger/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoading());

    try {
      final response = await DioHelper.postData(
        url: EndPoint.register,
        data: {
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );

      final message = response.data["message"];

      emit(RegisterSuccess(message));
    } catch (error) {
      emit(RegisterError(error.toString()));
    }
  }
}

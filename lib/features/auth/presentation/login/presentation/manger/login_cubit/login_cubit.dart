import 'package:clean_arch_flutter/features/auth/domain/use_cases/user_login_use_case.dart';
import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/manger/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.userLoginUseCase) : super(UserInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  final UserLoginUseCase userLoginUseCase;

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoading());
    var result = await userLoginUseCase.call(email: email, password: password);

    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (loginModel) async {
      if (loginModel.isEmpty) {
        print("LoginModel is empty! No data to save.");
        return;
      }

      // await CacheHelper.saveData(
      //     key: EndPoint.token, value: loginModel.first.token);

      // await CacheHelper.saveData(
      //     key: EndPoint.token, value: loginModel.first.token);
      // print('tokeeeeeeen ${loginModel.first.token}');
      // await CacheHelper.saveData(
      //     key: EndPoint.email, value: loginModel.first.email);
      // print('emailllll ${loginModel.first.email}');
      // await CacheHelper.saveData(
      //     key: EndPoint.phone, value: loginModel.first.phone);
      // print('phoneeee ${loginModel.first.phone}');
      // await CacheHelper.saveData(
      //     key: EndPoint.name, value: loginModel.first.name);
      // print('nameeeee ${loginModel.first.name}');

      emit(LoginSuccess(loginModel));
    });
  }
}

import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';

class LoginState {}

final class UserInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final List<UserEntity> loginModel;

  LoginSuccess(this.loginModel);
}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

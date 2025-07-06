import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';

class RegisterState {}

final class UserInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final List<UserEntity> loginModel;
  RegisterSuccess(this.loginModel);
}

final class RegisterLoading extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure(this.error);
}

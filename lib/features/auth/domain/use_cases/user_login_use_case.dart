import 'package:clean_arch_flutter/core/errors/failure.dart';
import 'package:clean_arch_flutter/features/auth/domain/repos/login_repo.dart';
import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

class UserLoginUseCase {
  final LoginRepo loginRepo;

  UserLoginUseCase(this.loginRepo);

  Future<Either<Failure, List<UserEntity>>> call(
      {required String email, required String password}) {
    return loginRepo.userLogin(email: email, password: password);
  }
}

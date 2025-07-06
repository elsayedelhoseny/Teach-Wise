import 'package:clean_arch_flutter/core/errors/failure.dart';
import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure, List<UserEntity>>> userLogin({
    required String email,
    required String password,
  });
}

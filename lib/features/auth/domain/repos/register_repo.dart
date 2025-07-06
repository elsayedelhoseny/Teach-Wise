import 'package:clean_arch_flutter/core/errors/failure.dart';
import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RigesterRepo {
  Future<Either<Failure, List<UserEntity>>> userRigester({
    required String email,
    required String password,
    required String phone,
    required String name,
  });
}

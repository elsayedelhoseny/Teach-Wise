import 'package:clean_arch_flutter/core/errors/failure.dart';
import 'package:clean_arch_flutter/features/auth/domain/repos/register_repo.dart';
import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

class UserRigesterUseCase {
  final RigesterRepo rigesterRepo;

  UserRigesterUseCase(this.rigesterRepo);

  Future<Either<Failure, List<UserEntity>>> call({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    return rigesterRepo.userRigester(
        email: email, password: password, name: name, phone: phone);
  }
}

import 'package:clean_arch_flutter/core/errors/failure.dart';
import 'package:clean_arch_flutter/features/auth/data/data_sources/login_remote_data_source.dart';
import 'package:clean_arch_flutter/features/auth/domain/repos/login_repo.dart';
import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;
  LoginRepoImpl({
    required this.loginRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<UserEntity>>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      List<UserEntity> userLogin = await loginRemoteDataSource.userLogin(
          email: email, password: password);

      return right(userLogin);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

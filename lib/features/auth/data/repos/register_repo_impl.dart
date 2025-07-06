import 'package:clean_arch_flutter/core/errors/failure.dart';
import 'package:clean_arch_flutter/features/auth/data/data_sources/register_remote_data_source.dart';
import 'package:clean_arch_flutter/features/auth/domain/repos/register_repo.dart';
import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RigesterRepoImpl extends RigesterRepo {
  final RigesterRemoteDataSource rigesterRemoteDataSource;
  RigesterRepoImpl({
    required this.rigesterRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<UserEntity>>> userRigester(
      {required String email,
      required String password,
      required String phone,
      required String name}) async {
    try {
      List<UserEntity> userRigester =
          await rigesterRemoteDataSource.userRigester(
              name: password, phone: phone, email: email, password: password);

      return right(userRigester);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

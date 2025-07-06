import 'package:clean_arch_flutter/core/Apis/end_points.dart';
import 'package:clean_arch_flutter/features/auth/data/models/auth/auth_model.dart';
import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';

import '../../../../core/Apis/dioHelper/dio_helper.dart';

abstract class LoginRemoteDataSource {
  Future<List<UserEntity>> userLogin(
      {required String email, required String password});
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<List<UserEntity>> userLogin(
      {required String email, required String password}) async {
    final response = await DioHelper.postData(
      url: EndPoint.login,
      requestedBody: {'email': email, 'password': password},
    );
    var userLoginMap = response.data['data'];
    List<UserEntity> user = [];
    if (userLoginMap is Map<String, dynamic>) {
      user.add(AuthModel.fromJson(userLoginMap));
    }
    return user;
  }
}

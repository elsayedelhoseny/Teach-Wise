import 'package:clean_arch_flutter/core/Apis/dioHelper/dio_helper.dart';
import 'package:clean_arch_flutter/core/Apis/end_points.dart';
import 'package:clean_arch_flutter/features/auth/data/models/auth/auth_model.dart';
import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';

abstract class RigesterRemoteDataSource {
  Future<List<UserEntity>> userRigester({
    required String email,
    required String password,
    required String phone,
    required String name,
  });
}

class RigesterRemoteDataSourceImpl implements RigesterRemoteDataSource {
  @override
  Future<List<UserEntity>> userRigester(
      {required String email,
      required String password,
      required String phone,
      required String name}) async {
    final response = await DioHelper.postData(
      url: EndPoint.register,
      requestedBody: {
        'email': email,
        'name': name,
        'phone': phone,
        'password': password
      },
    );

    var userRigesterMap = response.data['data'];
    List<UserEntity> userRigester = [];
    if (userRigesterMap is Map<String, dynamic>) {
      userRigester.add(AuthModel.fromJson(userRigesterMap));
    }
    return userRigester;
  }
}

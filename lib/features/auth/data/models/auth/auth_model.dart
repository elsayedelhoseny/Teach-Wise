import 'package:clean_arch_flutter/features/auth/domain/user_entity.dart';

class AuthModel extends UserEntity {
  int? points;
  int? credit;

  AuthModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
    required super.token,
    this.points,
    this.credit,
  });

  AuthModel.fromJson(Map<String, dynamic> json)
      : points = json['points'],
        credit = json['credit'],
        super(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          phone: json['phone'],
          image: json['image'],
          token: json['token'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'token': token,
      'points': points,
      'credit': credit,
    };
  }
}

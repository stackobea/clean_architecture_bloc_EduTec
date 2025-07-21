import 'package:clean_architecture_bloc/features/domain/entities/user.dart';

class UserModel extends User {
  UserModel(super.token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(json['token']);
  }

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}

import 'dart:convert';

import 'package:clean_architecture_bloc/features/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class LoginDataSource {
  Future<UserModel> login({required String username, required String pwd});
}

@LazySingleton(as: LoginDataSource)
class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<UserModel> login({
    required String username,
    required String pwd,
  }) async {
    // Api Calls.

    List<UserModel> u = [];
    u.add(UserModel("token890"));

    // Convert the list to a list of JSON maps
    List<Map<String, dynamic>> jsonList = u.map((e) => e.toJson()).toList();

    if (jsonList.isNotEmpty) {
      return UserModel.fromJson(jsonList.single);
    } else {
      throw Exception('Login Failed');
    }
  }
}

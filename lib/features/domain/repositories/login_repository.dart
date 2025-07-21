import 'package:clean_architecture_bloc/features/domain/entities/user.dart';

abstract class LoginRepository {
  Future<User> login({required String username, required String pwd});
}

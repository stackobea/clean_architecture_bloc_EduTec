import 'package:clean_architecture_bloc/features/data/data_sources/login_data_source.dart';
import 'package:clean_architecture_bloc/features/domain/entities/user.dart';
import 'package:clean_architecture_bloc/features/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl(this.loginDataSource);

  @override
  Future<User> login({required String username, required String pwd}) async {
    return await loginDataSource.login(username: username, pwd: pwd);
  }
}

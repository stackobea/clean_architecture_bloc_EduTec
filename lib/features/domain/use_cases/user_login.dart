import 'package:clean_architecture_bloc/features/domain/entities/user.dart';
import 'package:clean_architecture_bloc/features/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserLogin {
  final LoginRepository loginRepository;

  UserLogin(this.loginRepository);

  Future<User> call({required String username, required String pwd}) async {
    return await loginRepository.login(username: username, pwd: pwd);
  }
}

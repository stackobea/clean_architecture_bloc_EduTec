import 'package:bloc/bloc.dart';
import 'package:clean_architecture_bloc/dl/injection.dart';
import 'package:clean_architecture_bloc/features/domain/use_cases/user_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'clean_arch_sample_event.dart';

part 'clean_arch_sample_state.dart';

class CleanArchSampleBloc
    extends Bloc<CleanArchSampleEvent, CleanArchSampleState> {
  CleanArchSampleBloc() : super(CleanArchSampleInitial()) {
    on<LoginButtonClicked>((event, emit) async {
      final loginUser = getIt<UserLogin>();

      emit(CleanArchSampleLoading());
      await Future.delayed(
        Duration(seconds: 1),
      ); // Simulate a real api calling delay in response

      if (event.username.trim().isEmpty || event.pwd.trim().isEmpty) {
        emit(
          CleanArchSampleFailure("The Username and Password should not empty"),
        );
      } else if (event.username.trim().toLowerCase() == "admin" &&
          event.pwd.trim().toLowerCase() == "admin") {
        await loginUser.call(username: event.username, pwd: event.pwd).then((
          v,
        ) {
          Fluttertoast.showToast(msg: "Successfully logged in");
          emit(CleanArchSampleSuccess(v.token));
        });
      } else {
        emit(CleanArchSampleFailure("Please check username and password"));
      }
    });
  }
}

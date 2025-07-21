part of 'clean_arch_sample_bloc.dart';

@immutable
sealed class CleanArchSampleEvent {}

class LoginButtonClicked extends CleanArchSampleEvent {
  final String username;
  final String pwd;

  LoginButtonClicked(this.username, this.pwd);
}

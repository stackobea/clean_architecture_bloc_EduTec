part of 'clean_arch_sample_bloc.dart';

@immutable
sealed class CleanArchSampleState {}

final class CleanArchSampleInitial extends CleanArchSampleState {}

final class CleanArchSampleLoading extends CleanArchSampleState {}

final class CleanArchSampleSuccess extends CleanArchSampleState {
  final String msg;

  CleanArchSampleSuccess(this.msg);
}

final class CleanArchSampleFailure extends CleanArchSampleState {
  final String msg;

  CleanArchSampleFailure(this.msg);
}

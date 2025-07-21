part of 'text_change_bloc.dart';

@immutable
sealed class TextChangeState {}

final class TextChangeInitial extends TextChangeState {}

class SampleDisplayText extends TextChangeState {
  final String updateText;

  SampleDisplayText(this.updateText);
}

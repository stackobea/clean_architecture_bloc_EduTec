part of 'text_change_bloc.dart';

@immutable
sealed class TextChangeEvent {}

class OneChangeText extends TextChangeEvent {
  final String updateText;

  OneChangeText(this.updateText);
}

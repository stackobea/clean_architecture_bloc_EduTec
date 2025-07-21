part of 'color_change_bloc.dart';

sealed class ColorChangeState {}

final class ColorChangeInitialSimple extends ColorChangeState {}

final class ColorChangeInitial extends ColorChangeState {
  final String color;

  ColorChangeInitial(this.color);
}

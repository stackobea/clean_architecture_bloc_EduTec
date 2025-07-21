part of 'color_change_bloc.dart';

sealed class ColorChangeEvent {}

class ChangeColor extends ColorChangeEvent {
  final String color;

  ChangeColor(this.color);
}

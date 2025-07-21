import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_change_event.dart';

part 'color_change_state.dart';

class ColorChangeBloc extends Bloc<ColorChangeEvent, ColorChangeState> {
  ColorChangeBloc() : super(ColorChangeInitialSimple()) {
    on<ChangeColor>((event, emit) {
      emit(ColorChangeInitial(event.color));
    });
  }
}

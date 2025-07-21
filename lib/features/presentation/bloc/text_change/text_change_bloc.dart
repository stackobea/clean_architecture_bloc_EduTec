import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_change_event.dart';

part 'text_change_state.dart';

class TextChangeBloc extends Bloc<TextChangeEvent, TextChangeState> {
  TextChangeBloc() : super(TextChangeInitial()) {
    on<OneChangeText>((event, emit) {
      emit(SampleDisplayText(event.updateText));
    });
  }
}

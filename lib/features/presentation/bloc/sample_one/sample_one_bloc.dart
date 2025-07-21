import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class SampleOneEvent extends Equatable {}

class MinusButtonClicked extends SampleOneEvent {
  final int displayCount;

  MinusButtonClicked(this.displayCount);

  @override
  List<Object?> get props => [displayCount];
}

class AddButtonClicked extends SampleOneEvent {
  final int displayCount;

  AddButtonClicked(this.displayCount);

  @override
  List<Object?> get props => [displayCount];
}

// class OneChangeText extends SampleOneEvent {
//   final String updateText;
//
//   OneChangeText(this.updateText);
//
//   @override
//   List<Object?> get props => [updateText];
// }

sealed class SampleOneState {}

class SampleOneInitial extends SampleOneState {}

class SampleOneLoading extends SampleOneState {}

class SampleOneDisplayCount extends SampleOneState {
  final int displayCount;

  SampleOneDisplayCount({this.displayCount = 0});
}

class SampleOneSuccess extends SampleOneState {}

class SampleOneFailure extends SampleOneState {}

// class SampleDisplayText extends SampleOneState {
//   final String updateText;
//
//   SampleDisplayText(this.updateText);
// }

class SampleOneBloc extends Bloc<SampleOneEvent, SampleOneState> {
  SampleOneBloc() : super(SampleOneDisplayCount(displayCount: 0)) {
    on<MinusButtonClicked>((event, emit) {
      emit(SampleOneDisplayCount(displayCount: event.displayCount - 1));
    });
    on<AddButtonClicked>((event, emit) {
      emit(SampleOneDisplayCount(displayCount: event.displayCount + 1));
    });

    // on<OneChangeText>((event, emit) {
    //   emit(SampleDisplayText(event.updateText));
    // });
  }
}

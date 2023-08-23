import 'dart:async';

import 'package:elearning/features/main/build_main/bloc/main_event.dart';
import 'package:elearning/features/main/build_main/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    print("Main bloc created");
    on(_currentIndexEvent);
  }

  FutureOr<void> _currentIndexEvent(
      CurrentIndexInvent event, Emitter<MainState> emit) {
    emit(state.copyWith(currentIndex: event.currentIndex));
  }
}

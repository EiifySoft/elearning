import 'package:elearning/features/welcome/bloc/welcome_event.dart';
import 'package:elearning/features/welcome/bloc/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    print("Welcome bloc created");
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(pageIndex: state.pageIndex));
    });
  }
}

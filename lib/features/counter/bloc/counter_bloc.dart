import 'dart:async';

import 'package:elearning/features/counter/bloc/counter_event.dart';
import 'package:elearning/features/counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    print("Counter bloc created");
    on(_increamentEvent);
    on(_decreamentEvemt);
    on(_setNameEvent);
  }

  FutureOr<void> _increamentEvent(
      IncreamentCounterEvent event, Emitter<CounterState> emit) {
    emit(CounterState(counter: event.counter));
  }

  FutureOr<void> _decreamentEvemt(
      DecreamentCounterEvent event, Emitter<CounterState> emit) {
    emit(CounterState(counter: event.counter));
  }

  FutureOr<void> _setNameEvent(SetNameEvent event, Emitter<CounterState> emit) {
    emit(CounterState(name: event.name));
  }
}

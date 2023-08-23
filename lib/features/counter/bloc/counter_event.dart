sealed class CounterEvent {}

class IncreamentCounterEvent extends CounterEvent {
  int? counter;

  IncreamentCounterEvent({this.counter});
}

class DecreamentCounterEvent extends CounterEvent {
  int? counter;

  DecreamentCounterEvent({this.counter});
}

class SetNameEvent extends CounterEvent {
  String? name;
  SetNameEvent({this.name});
}

class CounterState {
  int? counter;
  String? name;

  CounterState({this.counter = 0, this.name = "Ayesha"});
  CounterState copywith({int? counter, String? name}) {
    return CounterState(
      counter: counter ?? this.counter,
      name: name ?? this.name,
    );
  }
}

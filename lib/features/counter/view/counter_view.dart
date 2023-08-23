import 'package:elearning/features/counter/bloc/counter_bloc.dart';
import 'package:elearning/features/counter/bloc/counter_event.dart';
import 'package:elearning/features/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Counter App"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: TextField(
                    controller: nameController,
                    onTapOutside: (value) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<CounterBloc>()
                          .add(SetNameEvent(name: nameController.text));
                    },
                    child: const Text("Set Name")),
                Text(
                  state.name.toString(),
                ),
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  state.counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: "Tag1",
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(DecreamentCounterEvent(counter: state.counter! - 1));
                },
                tooltip: 'Decreament',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: "Tag2",
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(DecreamentCounterEvent(counter: state.counter! + 1));
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          );
        },
      ),
    );
  }
}

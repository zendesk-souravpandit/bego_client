// State
import 'package:becomponent/page.dart';
import 'package:becore/hooks.dart';
import 'package:flutter/material.dart';

class CounterState with BeState {
  CounterState({this.count = 0, this.status = const BeStatus.empty()});
  final int count;
  @override
  final BeStatus status;

  CounterState copyWith({int? count, BeStatus? status}) {
    return CounterState(count: count ?? this.count, status: status ?? this.status);
  }
}

// Actions
class IncrementAction extends BeStateAction {}

class DecrementAction extends BeStateAction {}

// Reducer
CounterState reducer(CounterState state, BeStateAction action, [BuildContext? context]) {
  return switch (action) {
    IncrementAction() => CounterState(count: state.count + 1),
    DecrementAction() => CounterState(count: state.count - 1),
    SetStateAction<CounterState>(state: final newState) => newState,
    _ => state, // Default case
  };
}

// Usage in Widget
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BePageProvider<CounterState, BeStateAction>(
      initialState: CounterState(count: 32),
      reducer: reducer,
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            // Text('Count: ${state.count}'),
            MyWidget(),
            MyWidget2(),
            MyWidget3(),
          ],
        ),
      ),
      floatingActionButton: FloatingOption(),
    );
  }
}

class FloatingOption extends StatelessWidget {
  const FloatingOption({super.key});

  @override
  Widget build(BuildContext context) {
    final (state, dispatch) = usePageReducer<CounterState, BeStateAction>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(onPressed: () => dispatch(IncrementAction()), child: const Icon(Icons.add)),
        FloatingActionButton(onPressed: () => dispatch(DecrementAction()), child: const Icon(Icons.remove)),
      ],
    );
  }
}

class MyWidget extends HookWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("MyWidget1 render");
    final count = useStateSelector<CounterState, BeStateAction, int>(context, (state) => state.count);
    final dispatch = usePageAction<CounterState, BeStateAction>(context);

    return Row(
      children: [
        Text('Count $count '),
        ElevatedButton(
          onPressed: () {
            dispatch(SetStateAction(CounterState(count: 0, status: const BeStatus.loading())));
          },
          child: const Text("Change Status"),
        ),
      ],
    );
  }
}

class MyWidget2 extends HookWidget {
  const MyWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    print("MyWidget2 render");
    final status = useStateSelector<CounterState, BeStateAction, String>(context, (state) => state.status.toString());

    return Text('Status $status');
  }
}

class MyWidget3 extends HookWidget {
  const MyWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    print("MyWidget3 render");

    return const Text('MyWidget3');
  }
}

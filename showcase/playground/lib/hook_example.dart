import 'package:becore/hooks.dart';
import 'package:flutter/material.dart';

/// Public controller that exposes count + methods
class CounterController {
  CounterController(this._state);

  final CounterHookState _state;

  int get count => _state._count;
  void increment() => _state.increment();
  void decrement() => _state.decrement();
  void reset() => _state.reset();
}

class _CounterHook extends Hook<CounterController> {
  const _CounterHook({this.initialValue = 0});
  final int initialValue;

  @override
  CounterHookState createState() => CounterHookState();
}

class CounterHookState extends HookState<CounterController, _CounterHook> {
  late int _count;
  late CounterController _controller;

  @override
  void initHook() {
    super.initHook();
    _count = hook.initialValue;
    _controller = CounterController(this);
  }

  void increment() => setState(() => _count++);
  void decrement() => setState(() => _count--);
  void reset() => setState(() => _count = hook.initialValue);

  @override
  CounterController build(final BuildContext context) => _controller;

  @override
  void dispose() {
    debugPrint('Counter was at $_count when disposed');
    super.dispose();
  }
}

CounterController useCounter({final int initialValue = 0}) {
  return use(_CounterHook(initialValue: initialValue));
}

/// Hook to measure how long a widget stays alive
class _TimeAlive extends Hook<void> {
  const _TimeAlive();

  @override
  _TimeAliveState createState() => _TimeAliveState();
}

class _TimeAliveState extends HookState<void, _TimeAlive> {
  late final DateTime _start;

  @override
  void initHook() {
    super.initHook();
    _start = DateTime.now();
  }

  @override
  void build(final BuildContext context) {
    final duration = DateTime.now().difference(_start);
    debugPrint(duration.toString());
  }

  @override
  void dispose() {
    final duration = DateTime.now().difference(_start);
    debugPrint('Widget was alive for: $duration');
    super.dispose();
  }
}

void useTimeAlive() {
  use(const _TimeAlive());
}

class CounterWidget extends HookWidget {
  const CounterWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    useTimeAlive();

    final counter = useCounter();

    return Scaffold(
      appBar: AppBar(title: const Text('Separated Logic Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: ${counter.count}', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: counter.decrement, child: const Text('Decrement')),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: counter.reset, child: const Text('Reset')),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: counter.increment, child: const Text('Increment')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

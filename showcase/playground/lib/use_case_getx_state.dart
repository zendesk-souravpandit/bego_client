import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  Home({super.key});

  final count = 0.obs;
  @override
  Widget build(final context) => const CounterView();
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Text('Count: ${state.count}'),
            MyWidget(),
            MyWidget2(),
            const MyWidget3(),
          ],
        ),
      ),
      // floatingActionButton: FloatingOption(),
    );
  }
}

// class FloatingOption extends StatelessWidget {
//   const FloatingOption({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         FloatingActionButton(
//           onPressed: () => dispatch(IncrementAction()),
//           child: const Icon(Icons.add),
//         ),
//         FloatingActionButton(
//           onPressed: () => dispatch(DecrementAction()),
//           child: const Icon(Icons.remove),
//         ),
//       ],
//     );
//   }
// }

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  final count = 0.obs;
  @override
  Widget build(final BuildContext context) {
    print('MyWidget1 render');
    // final count = useStateSelector<CounterState, BePageAction, int>(
    //   context,
    //   (state) => state.count,
    // );
    // final dispatch = usePageAction<CounterState, BePageAction>(context);

    return Row(
      children: [
        Obx(() {
          return Text('Count $count ');
        }),
        ElevatedButton(
          onPressed: () {
            // dispatch(
            //   SetStateAction(
            //     CounterState(count: 0, status: const BePageStatus.loading()),
            //   ),
            // );
            count.value++;
          },
          child: const Text('Change Status'),
        ),
      ],
    );
  }
}

class MyWidget2 extends StatelessWidget {
  MyWidget2({super.key});
  final count = 0.obs;
  @override
  Widget build(final BuildContext context) {
    print('MyWidget2 render');
    // final status = useStateSelector<CounterState, BePageAction, String>(
    //   context,
    //   (state) => state.status.toString(),
    // );

    return Text('Status $count');
  }
}

class MyWidget3 extends StatelessWidget {
  const MyWidget3({super.key});

  @override
  Widget build(final BuildContext context) {
    print('MyWidget3 render');

    return const Text('MyWidget3');
  }
}

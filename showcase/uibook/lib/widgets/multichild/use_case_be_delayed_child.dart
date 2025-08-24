import 'package:beui/mulitchild.dart';
import 'package:beui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class _RefreshableUseCase extends StatefulWidget {
  const _RefreshableUseCase({required this.builder});

  final Widget Function(BuildContext) builder;

  @override
  State<_RefreshableUseCase> createState() => _RefreshableUseCaseState();
}

class _RefreshableUseCaseState extends State<_RefreshableUseCase> {
  Key _key = UniqueKey();

  void _refresh() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: _refresh, child: const Text('Refresh')),
        Expanded(child: KeyedSubtree(key: _key, child: widget.builder(context))),
      ],
    );
  }
}

@widgetbook.UseCase(name: 'BeDelayedChild', path: 'widget/multichild', type: BeDrawOver)
Widget useCaseBeDelayedChild(final BuildContext context) {
  return _RefreshableUseCase(
    builder: (final context) {
      // Delay Configuration
      // final delayDuration = context.knobs.double.slider(
      //   label: 'Delay Duration (seconds)',
      //   initialValue: 2,
      //   min: 0,
      //   max: 10,
      // );

      // Appearance
      final childText = context.knobs.string(label: 'Child Text', initialValue: 'Hello, World!');

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: BeWrap(
          spacing: -50,
          runSpacing: 8,
          children: List.generate(
            context.knobs.int.slider(label: 'Number of Items', initialValue: 5, min: 1, max: 20),
            (final index) {
              final child = Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: BeColorUtils.randomColor(), borderRadius: BorderRadius.circular(8)),
                child: Text(
                  '$childText : $index',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              );
              if (index == 0) {
                return BeDrawOver(
                  // delayDrawnLast: true,
                  // duration: Duration(seconds: delayDuration.toInt()),
                  child: child,
                );
              } else {
                return child;
              }
            },
          ),
        ),
      );
    },
  );
}

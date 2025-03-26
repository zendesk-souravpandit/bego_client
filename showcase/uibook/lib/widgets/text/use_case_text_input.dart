import 'package:beui/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'App Theme', path: 'widget', type: TextField)
Widget textFieldUseCase(BuildContext context) => Column(
  children: [
    BeTappable.animated(
      onPress: () {},
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(20),
        child: const Text('Button'),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: context.knobs.string(
            label: 'Label',
            initialValue: 'Username',
          ),
          errorText:
              context.knobs.boolean(label: 'Show Error')
                  ? 'Invalid input'
                  : null,
        ),
      ),
    ),
  ],
);

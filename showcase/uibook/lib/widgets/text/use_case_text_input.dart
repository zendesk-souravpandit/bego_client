import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'App Theme', path: 'widget', type: TextField)
Widget textFieldUseCase(final BuildContext context) => Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: context.knobs.string(label: 'Label', initialValue: 'Username'),
          errorText: context.knobs.boolean(label: 'Show Error') ? 'Invalid input' : null,
        ),
      ),
    ),
  ],
);

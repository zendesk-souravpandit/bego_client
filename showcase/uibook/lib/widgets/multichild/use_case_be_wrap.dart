import 'package:beui/mulitchild.dart';
import 'package:beui/utils.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeWrap', path: 'widget/multichild', type: BeWrap)
Widget useCaseBeWrap(final BuildContext context) {
  // Wrap Configuration
  final spacing = context.knobs.double.slider(label: 'Spacing', initialValue: 8, min: -32, max: 32);
  final runSpacing = context.knobs.double.slider(label: 'Run Spacing', initialValue: 8, min: -32, max: 32);

  final alignment = context.knobs.object.dropdown(
    label: 'Alignment',
    options: WrapAlignment.values,
    labelBuilder: (final value) => value.toString().split('.').last,
  );

  // Appearance
  final showBorders = context.knobs.boolean(label: 'Show Borders', initialValue: true);
  final cardElevation = context.knobs.double.slider(label: 'Card Elevation', initialValue: 2, min: 0, max: 8);
  final paddingValue = context.knobs.double.slider(label: 'Padding', initialValue: 8, min: 0, max: 16);

  // Removed demoType logic and updated to render a single widget with playground capabilities
  final widgetTitle = context.knobs.string(label: 'Widget Title', initialValue: 'Playground Widget');
  final widgetColor = context.knobs.color(label: 'Widget Color', initialValue: Colors.blue);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: cardElevation,
            child: Container(
              padding: EdgeInsets.all(paddingValue),

              height: 500,
              child: BeWrap(
                spacing: spacing,
                runSpacing: runSpacing,
                alignment: alignment,
                children: List.generate(
                  context.knobs.int.slider(label: 'Number of Items', initialValue: 5, min: 1, max: 20),
                  (final index) => InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tapped on $widgetTitle $index'), duration: const Duration(seconds: 1)),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),

                      decoration: BoxDecoration(
                        color: BeColorUtils.randomColor(),
                        border: showBorders ? Border.all(color: widgetColor, width: 2) : null,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$widgetTitle $index',
                        style: TextStyle(color: widgetColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

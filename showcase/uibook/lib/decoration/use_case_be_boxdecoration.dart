import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:flutter/material.dart';
import 'package:uibook/widgetbook/modal_option.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// @widgetbook.UseCase(name: 'Icons', path: 'Widget', type: BeIcons)
// Widget redContainerUseCase(BuildContext context) =>
// const Icon(BeIcons.icon_youtube, color: Colors.red, size: 100);

@widgetbook.UseCase(name: 'Decoration', path: 'decoration', type: BeBoxDecoration)
Widget useCaseBeBoxDecoration(final BuildContext context) {
  final color = context.knobs.list(
    label: 'Surface Color',
    options: [
      const KnobOption(label: 'Red', value: Colors.red),
      const KnobOption(label: 'Green', value: Colors.green),
      const KnobOption(label: 'Blue', value: Colors.blue),
      const KnobOption(label: 'Yellow', value: Colors.yellow),
    ],
    labelBuilder: (final value) => value.label,
  );
  final background = context.knobs.list(
    label: 'Shadow Color',
    options: [
      const KnobOption(label: 'Red', value: Colors.red),
      const KnobOption(label: 'Green', value: Colors.green),
      const KnobOption(label: 'Blue', value: Colors.blue),
      const KnobOption(label: 'Yellow', value: Colors.yellow),
    ],
    labelBuilder: (final value) => value.label,
  );
  final borderRadius = context.knobs.doubleOrNull.slider(label: 'Border Radius', min: 0, max: 50);
  final xOffset = context.knobs.doubleOrNull.slider(label: 'X Offset', min: -50, max: 50);
  final yOffset = context.knobs.doubleOrNull.slider(label: 'Y Offset', min: -50, max: 50);
  final blurRadius = context.knobs.doubleOrNull.slider(label: 'Blur Radius', min: 0, max: 50);
  final spreadRadius = context.knobs.doubleOrNull.slider(label: 'Spread Radius', min: 0, max: 50);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,

    children: [
      Container(
        width: 400,

        decoration: BeBoxDecoration(
          color: color.value,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          boxShadow: [
            BeBoxShadow(
              color: background.value,
              offset: Offset(xOffset ?? 0, yOffset ?? 0),
              blurRadius: blurRadius ?? 0,
              spreadRadius: spreadRadius ?? 0,
            ),
          ],
        ),
        child: const Padding(padding: EdgeInsets.all(8.0), child: Center(child: BeText.titleLarge('BeBoxDecoration'))),
      ),
    ],
  );
}

import 'package:beui/text.dart';
import 'package:flutter/material.dart';
import 'package:uibook/widgetbook/knob_extentions.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Icon button', path: 'widget', type: BeIconTextButton)
Widget createDefaultStyle(BuildContext context) {
  final k = context.knobs;

  final leadingIcon = k.beIconOrNullKnob(label: 'Leading Icon');

  final textBold = k.boolean(label: 'Bold Text');
  final iconSize = k.int.slider(
    label: 'Text Size',
    initialValue: 18,
    max: 100,
    min: 12,
  );
  final padding = k.int.slider(label: 'Padding', initialValue: 10, max: 100);

  return SingleChildScrollView(
    child: Column(
      children:
          BeIconDirection.values
              .map(
                (v) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: BeIconTextButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: padding.toDouble(),
                      vertical: padding.toDouble() / 2,
                    ),
                    buttonText: BeText(
                      k.string(label: 'Text', initialValue: 'Button'),
                      style: TextStyle(
                        fontSize: iconSize.toDouble() * 0.6,
                        fontWeight:
                            textBold ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onPressed: () {},
                    direction: v,
                    buttonIcon: Icon(
                      leadingIcon?.data,
                      size: iconSize.toDouble(),
                    ),
                  ),
                ),
              )
              .toList(),
    ),
  );
}

class BeIconTextButton extends IconButton {
  BeIconTextButton({
    required this.buttonIcon,
    required this.buttonText,
    required super.onPressed,
    super.key,
    double space = 4,
    BeIconDirection direction = BeIconDirection.top,
    super.iconSize,
    super.visualDensity,
    super.padding,
    super.alignment,
    super.splashRadius,
    super.color,
    super.focusColor,
    super.hoverColor,
    super.highlightColor,
    super.splashColor,
    super.disabledColor,
    super.mouseCursor,
    super.focusNode,
    super.autofocus = false,
    super.tooltip,
    super.enableFeedback,
    super.constraints,
    super.style,
    super.isSelected,
    super.selectedIcon,
  }) : super(
         icon: switch (direction) {
           BeIconDirection.left => Row(
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [buttonIcon, SizedBox(width: space), buttonText],
           ),
           BeIconDirection.right => Row(
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [buttonText, SizedBox(width: space), buttonIcon],
           ),
           BeIconDirection.top => Column(
             mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.min,
             children: [buttonIcon, SizedBox(height: space), buttonText],
           ),
           BeIconDirection.bottom => Column(
             mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.min,
             children: [buttonText, SizedBox(height: space), buttonIcon],
           ),
         },
       );

  final Widget buttonIcon;
  final Widget buttonText;
}

enum BeIconDirection { left, right, top, bottom }

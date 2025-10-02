import 'package:beui/text.dart';
import 'package:flutter/material.dart';
import 'package:uibook/core/widgetbook/knob_extentions.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Standard Flutter Buttons
@widgetbook.UseCase(name: 'Standard Buttons', path: 'Components/Buttons', type: ElevatedButton)
Widget standardButtonsShowcase(final BuildContext context) => Padding(
  padding: const EdgeInsets.all(16.0),
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildButtonSection(
          context: context,
          title: 'Elevated Buttons',
          buttons: [
            ElevatedButton(
              style: _buttonStyle(context, size: ButtonSize.small),
              onPressed: _getOnPressed(context),
              child: const Text('Small Elevated'),
            ),
            ElevatedButton(
              style: _buttonStyle(context),
              onPressed: _getOnPressed(context),
              child: const Text('Regular Elevated'),
            ),
            ElevatedButton(
              style: _buttonStyle(context, size: ButtonSize.large),
              onPressed: _getOnPressed(context),
              child: const Text('Large Elevated'),
            ),
            ElevatedButton.icon(
              style: _buttonStyle(context),
              onPressed: _getOnPressed(context),
              icon: const Icon(Icons.add),
              label: const Text('Icon Elevated'),
            ),
          ],
        ),

        _buildButtonSection(
          context: context,
          title: 'Filled Buttons',
          buttons: [
            FilledButton(
              style: _buttonStyle(context, size: ButtonSize.small),
              onPressed: _getOnPressed(context),
              child: const Text('Small Filled'),
            ),
            FilledButton(
              style: _buttonStyle(context),
              onPressed: _getOnPressed(context),
              child: const Text('Regular Filled'),
            ),
            FilledButton(
              style: _buttonStyle(context, size: ButtonSize.large),
              onPressed: _getOnPressed(context),
              child: const Text('Large Filled'),
            ),
          ],
        ),

        _buildButtonSection(
          context: context,
          title: 'Outlined Buttons',
          buttons: [
            OutlinedButton(
              style: _buttonStyle(context, size: ButtonSize.small),
              onPressed: _getOnPressed(context),
              child: const Text('Small Outlined'),
            ),
            OutlinedButton(
              style: _buttonStyle(context),
              onPressed: _getOnPressed(context),
              child: const Text('Regular Outlined'),
            ),
            OutlinedButton.icon(
              style: _buttonStyle(context),
              onPressed: _getOnPressed(context),
              icon: const Icon(Icons.download),
              label: const Text('Icon Outlined'),
            ),
          ],
        ),

        _buildButtonSection(
          context: context,
          title: 'Text Buttons',
          buttons: [
            TextButton(
              style: _buttonStyle(context, size: ButtonSize.small),
              onPressed: _getOnPressed(context),
              child: const Text('Small Text'),
            ),
            TextButton(
              style: _buttonStyle(context),
              onPressed: _getOnPressed(context),
              child: const Text('Regular Text'),
            ),
          ],
        ),

        _buildButtonSection(
          context: context,
          title: 'Icon Buttons',
          buttons: [
            IconButton(iconSize: 24, onPressed: _getOnPressed(context), icon: const Icon(Icons.favorite_border)),
            IconButton.filled(iconSize: 32, onPressed: _getOnPressed(context), icon: const Icon(Icons.star)),
          ],
        ),
      ],
    ),
  ),
);

// BeIconTextButton - Custom Button Component
@widgetbook.UseCase(name: 'Icon Text Button', path: 'Components/Buttons', type: BeIconTextButton)
Widget iconTextButtonShowcase(final BuildContext context) {
  final k = context.knobs;

  final leadingIcon = k.beIconOrNullKnob(label: 'Leading Icon');
  final textBold = k.boolean(label: 'Bold Text');
  final iconSize = k.int.slider(label: 'Icon Size', initialValue: 18, max: 100, min: 12);
  final padding = k.int.slider(label: 'Padding', initialValue: 10, max: 100);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          const Text('BeIconTextButton - All Directions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...BeIconDirection.values.map(
            (final direction) => Padding(
              padding: const EdgeInsets.all(8),
              child: BeIconTextButton(
                padding: EdgeInsets.symmetric(horizontal: padding.toDouble(), vertical: padding.toDouble() / 2),
                buttonText: BeText(
                  k.string(label: 'Text', initialValue: 'Button'),
                  style: TextStyle(
                    fontSize: iconSize.toDouble() * 0.6,
                    fontWeight: textBold ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                onPressed: () {},
                direction: direction,
                buttonIcon: Icon(leadingIcon?.data, size: iconSize.toDouble()),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// Helper widgets and functions
Widget _buildButtonSection({
  required final BuildContext context,
  required final String title,
  required final List<Widget> buttons,
}) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    ),
    Wrap(spacing: 16, runSpacing: 16, children: buttons),
    const SizedBox(height: 32),
  ],
);

ButtonStyle _buttonStyle(final BuildContext context, {final ButtonSize size = ButtonSize.medium}) {
  final padding = switch (size) {
    ButtonSize.small => const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ButtonSize.medium => const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ButtonSize.large => const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  };

  final textStyle = switch (size) {
    ButtonSize.small => Theme.of(context).textTheme.labelSmall,
    ButtonSize.medium => Theme.of(context).textTheme.labelMedium,
    ButtonSize.large => Theme.of(context).textTheme.labelLarge,
  };

  return ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(padding),
    textStyle: WidgetStatePropertyAll(textStyle),
  );
}

VoidCallback? _getOnPressed(final BuildContext context) => context.knobs.boolean(label: 'Disabled') ? null : () {};

enum ButtonSize { small, medium, large }

// BeIconTextButton Implementation
class BeIconTextButton extends IconButton {
  BeIconTextButton({
    required this.buttonIcon,
    required this.buttonText,
    required super.onPressed,
    super.key,
    final double space = 4,
    final BeIconDirection direction = BeIconDirection.top,
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

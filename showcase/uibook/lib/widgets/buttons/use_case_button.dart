import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Buttons',
  path: 'Widget/Button',
  type: ElevatedButton,
)
Widget useCaseButtons(BuildContext context) => Padding(
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
              child: const Text('Large Elevated'),
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
            IconButton(
              iconSize: 24,
              onPressed: _getOnPressed(context),
              icon: const Icon(Icons.favorite_border),
            ),
            IconButton.filled(
              iconSize: 32,
              onPressed: _getOnPressed(context),
              icon: const Icon(Icons.star),
            ),
          ],
        ),
      ],
    ),
  ),
);

Widget _buildButtonSection({
  required BuildContext context,
  required String title,
  required List<Widget> buttons,
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

ButtonStyle _buttonStyle(
  BuildContext context, {
  ButtonSize size = ButtonSize.medium,
}) {
  final padding = switch (size) {
    ButtonSize.small => const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ButtonSize.medium => const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 12,
    ),
    ButtonSize.large => const EdgeInsets.symmetric(
      horizontal: 32,
      vertical: 16,
    ),
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

VoidCallback? _getOnPressed(BuildContext context) =>
    context.knobs.boolean(label: 'Disabled') ? null : () {};

enum ButtonSize { small, medium, large }

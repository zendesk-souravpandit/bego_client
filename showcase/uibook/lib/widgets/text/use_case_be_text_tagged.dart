import 'package:beui/mulitchild.dart';
import 'package:beui/text.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeTextTagged', path: 'widget/text', type: BeTextTagged)
Widget useCaseBeTextTagged(final BuildContext context) {
  final label = context.knobs.string(label: 'Tag Label', initialValue: 'New');
  final position = context.knobs.list<BeBadgePosition>(label: 'Position', options: BeBadgePosition.values);
  final tagColor = context.knobs.color(label: 'Tag Color', initialValue: Colors.red);
  final tagBackground = context.knobs.colorOrNull(label: 'Tag Background');
  final text = context.knobs.string(label: 'Text Content', initialValue: 'Sample Text with Tag');

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BeTextTagged(
          label: label,
          position: position,
          tagColor: tagColor,
          tagBackground: tagBackground,
          child: BeText.titleMedium(text),
        ),
        const SizedBox(height: 24),
        const Text('Examples with different positions:'),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children:
              BeBadgePosition.values
                  .map(
                    (final pos) => BeTextTagged(
                      label: pos.name.toUpperCase(),
                      position: pos,
                      tagColor: Colors.white,
                      tagBackground: Colors.blue,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: BeText.bodyMedium('Text with ${pos.name} tag'),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    ),
  );
}

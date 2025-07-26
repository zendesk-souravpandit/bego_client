import 'package:becore/modal.dart';
import 'package:beui/from.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeItemSelector', path: 'widget/form', type: BeItemSelector)
Widget useCaseBeItemSelector(final BuildContext context) {
  final isExpanded = context.knobs.boolean(label: 'Is Expanded', initialValue: true);
  final isDense = context.knobs.boolean(label: 'Is Dense', initialValue: true);
  final hint = context.knobs.string(label: 'Hint Text', initialValue: 'Select an option');
  final label = context.knobs.string(label: 'Label', initialValue: 'Choose Option');

  // Sample data using built-in KeyValueIS
  final items = [
    KeyValueIS(key: 1, value: 'Option 1'),
    KeyValueIS(key: 2, value: 'Option 2'),
    KeyValueIS(key: 3, value: 'Option 3'),
    KeyValueIS(key: 4, value: 'Option 4'),
  ];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeItemSelector Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Basic selector
          BeItemSelector<KeyValueIS>(
            id: 'basic_selector',
            items: items,
            hint: hint,
            label: label,
            isExpanded: isExpanded,
            isDense: isDense,
            onChanged: (final value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected: ${value?.display}')));
            },
            validator: (final value) {
              if (value == null) return 'Please select an option';
              return null;
            },
          ),

          const SizedBox(height: 24),
          const Text('With Initial Value:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeItemSelector<KeyValueIS>(
            id: 'preselected_selector',
            items: items,
            value: items[1], // Pre-selected
            hint: 'Select option',
            label: 'Pre-selected',
            isExpanded: true,
            onChanged: (final value) {},
          ),

          const SizedBox(height: 24),
          const Text('Compact Style:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeItemSelector<KeyValueIS>(
            id: 'compact_selector',
            items: items,
            hint: 'Compact',
            isExpanded: false,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            onChanged: (final value) {},
          ),

          const SizedBox(height: 24),
          const Text('With Trailing Widgets:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeItemSelector<KeyValueIS>(
            id: 'help_selector',
            items: items,
            hint: 'With help icon',
            label: 'Selector with Help',
            trailingTitleWidgets: [
              IconButton(
                icon: const Icon(Icons.help_outline, size: 20),
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Help: Choose the best option for your needs')));
                },
              ),
            ],
            trailingHelperWidgets: [TextButton(onPressed: () {}, child: const Text('Learn More'))],
            onChanged: (final value) {},
          ),

          const SizedBox(height: 24),
          const Text('Custom Colors:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeItemSelector<KeyValueIS>(
            id: 'custom_style_selector',
            items: items,
            hint: 'Custom colors',
            label: 'Styled Selector',
            dropdownColor: Colors.blue.shade50,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            onChanged: (final value) {},
          ),

          const SizedBox(height: 24),
          const Text('Different Data Types:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeItemSelector<KeyValueSS>(
            id: 'string_selector',
            items: [
              KeyValueSS(key: 'red', value: 'Red Color'),
              KeyValueSS(key: 'green', value: 'Green Color'),
              KeyValueSS(key: 'blue', value: 'Blue Color'),
            ],
            hint: 'Choose a color',
            label: 'Color Selector',
            onChanged: (final value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected color: ${value?.display}')));
            },
          ),
        ],
      ),
    ),
  );
}

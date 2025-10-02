import 'package:becore/model.dart';
import 'package:beui/from.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Form Field Showcase
@widgetbook.UseCase(name: 'Form Fields', path: 'Components/Forms', type: BeFormField)
Widget formFieldsShowcase(final BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Email Address');
  final helperText = context.knobs.stringOrNull(label: 'Helper Text');
  final shouldValidate = context.knobs.boolean(label: 'Should Validate', initialValue: true);
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: BeFormBuilder(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('BeFormField Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Basic form field with TextField
            BeFormField<String>(
              name: 'email',
              title: title,
              helperText: helperText,
              shouldValidate: shouldValidate,
              enabled: enabled,
              validator:
                  shouldValidate
                      ? (final value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      }
                      : null,
              fieldBuilder:
                  (final field) => TextFormField(
                    enabled: enabled,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: const OutlineInputBorder(),
                      errorText: field.hasError ? field.errorText : null,
                    ),
                    onChanged: field.didChange,
                  ),
            ),

            const SizedBox(height: 24),

            // Password form field
            BeFormField<String>(
              name: 'password',
              title: 'Password',
              shouldValidate: shouldValidate,
              enabled: enabled,
              validator:
                  shouldValidate
                      ? (final value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      }
                      : null,
              fieldBuilder:
                  (final field) => TextFormField(
                    enabled: enabled,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      border: const OutlineInputBorder(),
                      errorText: field.hasError ? field.errorText : null,
                    ),
                    onChanged: field.didChange,
                  ),
            ),

            const SizedBox(height: 24),

            // Multiline text field
            BeFormField<String>(
              name: 'description',
              title: 'Description',
              helperText: 'Enter a detailed description',
              shouldValidate: shouldValidate,
              enabled: enabled,
              fieldBuilder:
                  (final field) => TextFormField(
                    enabled: enabled,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Enter description here...',
                      border: const OutlineInputBorder(),
                      errorText: field.hasError ? field.errorText : null,
                    ),
                    onChanged: field.didChange,
                  ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Item Selector Showcase
@widgetbook.UseCase(name: 'Item Selectors', path: 'Components/Forms', type: BeItemSelector)
Widget itemSelectorsShowcase(final BuildContext context) {
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

  final fruitItems = [
    KeyValueIS(key: 1, value: 'Apple'),
    KeyValueIS(key: 2, value: 'Banana'),
    KeyValueIS(key: 3, value: 'Orange'),
    KeyValueIS(key: 4, value: 'Grapes'),
    KeyValueIS(key: 5, value: 'Mango'),
  ];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeItemSelector Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
          const Text('Fruit Selector:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeItemSelector<KeyValueIS>(
            id: 'fruit_selector',
            items: fruitItems,
            hint: 'Select a fruit',
            label: 'Favorite Fruit',
            isExpanded: isExpanded,
            isDense: isDense,
            onChanged: (final value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected fruit: ${value?.display}')));
            },
          ),

          const SizedBox(height: 24),
          const Text('Required Selector:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeItemSelector<KeyValueIS>(
            id: 'required_selector',
            items: items,
            hint: 'This is required',
            label: 'Required Field',
            isExpanded: isExpanded,
            isDense: isDense,
            onChanged: (final value) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Required field selected: ${value?.display}')));
            },
            validator: (final value) {
              if (value == null) return 'This field is required';
              return null;
            },
          ),
        ],
      ),
    ),
  );
}

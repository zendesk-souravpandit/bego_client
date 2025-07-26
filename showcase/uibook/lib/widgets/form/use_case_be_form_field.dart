import 'package:beui/from.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeFormField', path: 'widget/form', type: BeFormField)
Widget useCaseBeFormField(final BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Email Address');
  final helperText = context.knobs.stringOrNull(label: 'Helper Text');
  final shouldValidate = context.knobs.boolean(label: 'Should Validate', initialValue: true);
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: FormBuilder(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('BeFormField Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Basic form field with TextField
            BeFormField<String>(
              id: 'email',
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
                    initialValue: field.value,
                  ),
            ),

            const SizedBox(height: 24),
            const Text('With Trailing Widgets:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            BeFormField<String>(
              id: 'password',
              title: 'Password',
              helperText: 'Must be at least 8 characters',
              trailingTitleWidgets: [IconButton(icon: const Icon(Icons.visibility_off, size: 20), onPressed: () {})],
              trailingHelperWidgets: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password requirements: 8+ chars, 1 number, 1 symbol')),
                    );
                  },
                  child: const Text('Requirements'),
                ),
              ],
              validator: (final value) {
                if (value == null || value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
              fieldBuilder:
                  (final field) => TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      border: const OutlineInputBorder(),
                      errorText: field.hasError ? field.errorText : null,
                      suffixIcon: const Icon(Icons.lock_outline),
                    ),
                    onChanged: field.didChange,
                    initialValue: field.value,
                  ),
            ),

            const SizedBox(height: 24),
            const Text('With Custom Styling:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            BeFormField<String>(
              id: 'bio',
              title: 'Bio',
              helperText: 'Tell us about yourself',
              spacing: 12,
              gap: 8,
              titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
              helperStyle: const TextStyle(fontSize: 12, color: Colors.grey),
              errorStyle: const TextStyle(fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
              validator: (final value) {
                if (value != null && value.length > 200) {
                  return 'Bio must be under 200 characters';
                }
                return null;
              },
              fieldBuilder:
                  (final field) => TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Write your bio here...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      errorText: field.hasError ? field.errorText : null,
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                    onChanged: field.didChange,
                    initialValue: field.value,
                  ),
            ),

            const SizedBox(height: 24),
            const Text('With Start/End Widgets:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // BeFormField<int>(
            //   id: 'age',
            //   title: 'Age',
            //   helperText: 'Select your age',
            //   initialValue: 25,
            //   startWidgets: [
            //     Container(
            //       padding: const EdgeInsets.all(8),
            //       decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(8)),
            //       child: const Icon(Icons.person, color: Colors.blue),
            //     ),
            //   ],
            //   endWidgets: [const Text('25 years', style: TextStyle(fontWeight: FontWeight.bold))],
            //   fieldBuilder:
            //       (final field) => FormBuilderSlider(
            //         name: 'age_slider',
            //         min: 18,
            //         max: 100,
            //         initialValue: field.value?.toDouble() ?? 25,
            //         divisions: 82,
            //         onChanged: enabled ? (final value) => field.didChange(value?.toInt()) : null,
            //       ),
            // ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Form submitted!')));
                },
                child: const Text('Submit Form'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

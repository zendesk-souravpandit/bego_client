import 'package:beui/text.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeText Variants', path: 'widget/text', type: BeText)
Widget useCaseBeText(final BuildContext context) {
  final textContent = context.knobs.string(label: 'Text Content', initialValue: 'Sample Text');
  final color = context.knobs.colorOrNull(label: 'Color');
  final maxLines = context.knobs.intOrNull.input(label: 'Max Lines');
  final align = context.knobs.objectOrNull.dropdown<TextAlign>(label: 'Text Align', options: TextAlign.values);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextSection('Display Styles', [
            BeText.displayLarge(textContent, color: color, maxLine: maxLines, align: align),
            BeText.displayMedium(textContent, color: color, maxLine: maxLines, align: align),
            BeText.displaySmall(textContent, color: color, maxLine: maxLines, align: align),
          ]),
          const SizedBox(height: 24),
          _buildTextSection('Headline Styles', [
            BeText.headlineLarge(textContent, color: color, maxLine: maxLines, align: align),
            BeText.headlineMedium(textContent, color: color, maxLine: maxLines, align: align),
            BeText.headlineSmall(textContent, color: color, maxLine: maxLines, align: align),
          ]),
          const SizedBox(height: 24),
          _buildTextSection('Title Styles', [
            BeText.titleLarge(textContent, color: color, maxLine: maxLines, align: align),
            BeText.titleMedium(textContent, color: color, maxLine: maxLines, align: align),
            BeText.titleSmall(textContent, color: color, maxLine: maxLines, align: align),
          ]),
          const SizedBox(height: 24),
          _buildTextSection('Body Styles', [
            BeText.bodyLarge(textContent, color: color, maxLine: maxLines, align: align),
            BeText.bodyMedium(textContent, color: color, maxLine: maxLines, align: align),
            BeText.bodySmall(textContent, color: color, maxLine: maxLines, align: align),
          ]),
          const SizedBox(height: 24),
          _buildTextSection('Label Styles', [
            BeText.labelLarge(textContent, color: color, maxLine: maxLines, align: align),
            BeText.labelMedium(textContent, color: color, maxLine: maxLines, align: align),
            BeText.labelSmall(textContent, color: color, maxLine: maxLines, align: align),
          ]),
        ],
      ),
    ),
  );
}

Widget _buildTextSection(final String title, final List<Widget> textWidgets) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      ...textWidgets.map((final widget) => Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: widget)),
    ],
  );
}

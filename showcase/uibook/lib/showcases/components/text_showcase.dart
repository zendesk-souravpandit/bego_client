import 'package:beui/mulitchild.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// BeText Variants Showcase
@widgetbook.UseCase(name: 'Text Styles', path: 'Components/Text', type: BeText)
Widget textStylesShowcase(final BuildContext context) {
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

// Typography System Showcase
@widgetbook.UseCase(name: 'Typography System', path: 'Components/Text', type: BeText)
Widget typographySystemShowcase(final BuildContext context) {
  final text = context.knobs.string(
    label: 'Text Content',
    initialValue: 'Almost before we knew it, we had left the ground.',
  );

  final useVariant = context.knobs.boolean(label: 'Use Variant', description: 'Apply text variant styling');
  final selectedColor = context.knobs.color(label: 'Text Color', initialValue: BeColors.secondary);
  final variant = useVariant ? BeTextVariant.primary : BeTextVariant.none;
  final color = context.knobs.boolean(label: 'Custom Color') ? selectedColor : null;

  final textCategories = [
    _TextCategory(
      type: 'Display',
      sizes: [
        _TextSize('Large', BeText.displayLarge),
        _TextSize('Medium', BeText.displayMedium),
        _TextSize('Small', BeText.displaySmall),
      ],
    ),
    _TextCategory(
      type: 'Headline',
      sizes: [
        _TextSize('Large', BeText.headlineLarge),
        _TextSize('Medium', BeText.headlineMedium),
        _TextSize('Small', BeText.headlineSmall),
      ],
    ),
    _TextCategory(
      type: 'Title',
      sizes: [
        _TextSize('Large', BeText.titleLarge),
        _TextSize('Medium', BeText.titleMedium),
        _TextSize('Small', BeText.titleSmall),
      ],
    ),
    _TextCategory(
      type: 'Body',
      sizes: [
        _TextSize('Large', BeText.bodyLarge),
        _TextSize('Medium', BeText.bodyMedium),
        _TextSize('Small', BeText.bodySmall),
      ],
    ),
    _TextCategory(
      type: 'Label',
      sizes: [
        _TextSize('Large', BeText.labelLarge),
        _TextSize('Medium', BeText.labelMedium),
        _TextSize('Small', BeText.labelSmall),
      ],
    ),
  ];

  return ListView(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    children: [
      _buildFontHeader(),
      ...textCategories.expand(
        (final category) => _buildCategorySection(
          context,
          category: category.type,
          sizes: category.sizes,
          text: text,
          color: color,
          variant: variant,
        ),
      ),
    ],
  );
}

// Tagged Text Showcase
@widgetbook.UseCase(name: 'Tagged Text', path: 'Components/Text', type: BeTextTagged)
Widget taggedTextShowcase(final BuildContext context) {
  final label = context.knobs.string(label: 'Tag Label', initialValue: 'New');
  final position = context.knobs.object.dropdown<BeBadgePosition>(label: 'Position', options: BeBadgePosition.values);
  final tagColor = context.knobs.color(label: 'Tag Color', initialValue: Colors.red);
  final tagBackground = context.knobs.colorOrNull(label: 'Tag Background');
  final text = context.knobs.string(label: 'Text Content', initialValue: 'Sample Text with Tag');

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Interactive Tagged Text:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        BeTextTagged(
          label: label,
          position: position,
          tagColor: tagColor,
          tagBackground: tagBackground,
          child: BeText.titleMedium(text),
        ),
        const SizedBox(height: 32),
        const Text('All Badge Positions:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: BeBadgePosition.values
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

// Helper widgets and functions
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

Widget _buildFontHeader() => const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BeText('Roboto ', color: BeColors.lightTextSecondary, style: TextStyle(fontSize: 68, height: 1.2)),
        BeText.labelMedium('https://fonts.google.com/specimen/Roboto', color: BeColors.lightTextLink),
        SizedBox(height: 8),
        BeText.labelMedium(
          'Roboto is the world-script expansion of the Lexend fonts. '
          'Designed by Thomas Jockin and Nadine Chahine, it currently supports '
          'Latin and Arabic. Lexend is a family of variable fonts designed by '
          'Bonnie Shaver-Troup, Thomas Jockin and Font Bureau.',
        ),
        SizedBox(height: 16),
      ],
    );

List<Widget> _buildCategorySection(
  final BuildContext context, {
  required final String category,
  required final List<_TextSize> sizes,
  required final String text,
  required final Color? color,
  required final BeTextVariant variant,
}) =>
    [
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BeText(
              category,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: BeTheme.of(context).colors.textSecondary),
            ),
            const Divider(thickness: 1),
          ],
        ),
      ),
      ...sizes.map(
        (final size) => Column(
          children: [Label(textType: category, textSize: size.name), size.builder(text, color: color, variant: variant)],
        ),
      ),
    ];

class _TextCategory {
  _TextCategory({required this.type, required this.sizes});
  final String type;
  final List<_TextSize> sizes;
}

class _TextSize {
  _TextSize(this.name, this.builder);
  final String name;
  final BeText Function(
    String?, {
    TextAlign? align,
    Color? color,
    Key? key,
    int? maxLine,
    TextOverflow? overflow,
    EdgeInsets? padding,
    BeTextVariant? variant,
  }) builder;
}

class Label extends StatelessWidget {
  const Label({required this.textType, required this.textSize, super.key});

  final String textType;
  final String textSize;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BeText(
              '$textType / $textSize',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
                color: BeTheme.of(context).colors.textSecondary,
              ),
            ),
            const Divider(thickness: 0.2),
          ],
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('textType', textType))
      ..add(StringProperty('textSize', textSize));
  }
}
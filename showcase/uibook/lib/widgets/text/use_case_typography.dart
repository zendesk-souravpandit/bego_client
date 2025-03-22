import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Typography', path: 'Widget/Text', type: BeText)
Widget displayTypographyUseCase(BuildContext context) {
  // Knobs configuration
  final text = context.knobs.string(
    label: 'Text Content',
    initialValue: 'Almost before we knew it, we had left the ground.',
  );

  final useVariant = context.knobs.boolean(label: 'Use Variant', description: 'Apply text variant styling');

  final selectedColor = context.knobs.color(label: 'Text Color', initialValue: BeColors.secondary);

  final variant = useVariant ? BeTextVariant.primary : BeTextVariant.none;
  final color = context.knobs.boolean(label: 'Custom Color') ? selectedColor : null;

  // Text type configuration
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
        (category) => _buildCategorySection(
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
  })
  builder;
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
  BuildContext context, {
  required String category,
  required List<_TextSize> sizes,
  required String text,
  required Color? color,
  required BeTextVariant variant,
}) => [
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
    (size) => Column(
      children: [Label(textType: category, textSize: size.name), size.builder(text, color: color, variant: variant)],
    ),
  ),
];

class Label extends StatelessWidget {
  const Label({required this.textType, required this.textSize, super.key});

  final String textType;
  final String textSize;

  @override
  Widget build(BuildContext context) => Padding(
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
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('textType', textType))
      ..add(StringProperty('textSize', textSize));
  }
}

import 'package:beui/src/widgets/common/empty.dart';
import 'package:beui/src/widgets/variants/be_text_variant.dart';
import 'package:beui/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum BeTextType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

extension BeTextTypeExtension on BeTextType {
  TextStyle getStyle(BeStyle style) {
    switch (this) {
      case BeTextType.displayLarge:
        return style.displayLarge;
      case BeTextType.displayMedium:
        return style.displayMedium;
      case BeTextType.displaySmall:
        return style.displaySmall;
      case BeTextType.headlineLarge:
        return style.headlineLarge;
      case BeTextType.headlineMedium:
        return style.headlineMedium;
      case BeTextType.headlineSmall:
        return style.headlineSmall;
      case BeTextType.titleLarge:
        return style.titleLarge;
      case BeTextType.titleMedium:
        return style.titleMedium;
      case BeTextType.titleSmall:
        return style.titleSmall;
      case BeTextType.bodyLarge:
        return style.bodyLarge;
      case BeTextType.bodyMedium:
        return style.bodyMedium;
      case BeTextType.bodySmall:
        return style.bodySmall;
      case BeTextType.labelLarge:
        return style.labelLarge;
      case BeTextType.labelMedium:
        return style.labelMedium;
      case BeTextType.labelSmall:
        return style.labelSmall;
    }
  }
}

// Add this extension for convenient context access
extension BeThemeContextExtension on BuildContext {
  TextStyle beTextStyle(BeTextType type) {
    final beTheme = BeTheme.of(this); // Assuming you have BeTheme setup
    return type.getStyle(beTheme.style);
  }
}

const _defaultMaxLine = 10000;

class BeText extends StatelessWidget {
  const BeText(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.style,
    this.type = BeTextType.bodyMedium,
    this.overflow,
  });

  const BeText.displayLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow = TextOverflow.clip,
  }) : type = BeTextType.displayLarge,
       style = null;

  const BeText.displayMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.displayMedium,
       style = null;

  const BeText.displaySmall(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.displaySmall,
       style = null;

  const BeText.headlineLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.headlineLarge,
       style = null;

  const BeText.headlineMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.headlineMedium,
       style = null;

  const BeText.headlineSmall(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.headlineSmall,
       style = null;

  const BeText.titleLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.titleLarge,
       style = null;

  const BeText.titleMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.titleMedium,
       style = null;

  const BeText.titleSmall(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.titleSmall,
       style = null;

  const BeText.bodyLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLine = _defaultMaxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.bodyLarge,
       style = null;

  const BeText.bodyMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLine = _defaultMaxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.bodyMedium,
       style = null;

  const BeText.bodySmall(
    this.text, {
    super.key,
    this.color,
    this.maxLine = _defaultMaxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.bodySmall,
       style = null;

  const BeText.labelLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.labelLarge,
       style = null;

  const BeText.labelMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.labelMedium,
       style = null;

  const BeText.labelSmall(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  }) : type = BeTextType.labelSmall,
       style = null;

  final String? text;
  final Color? color;
  final int? maxLine;
  final TextAlign? align;
  final EdgeInsets? padding;
  final BeTextVariant? variant;
  final TextStyle? style;
  final BeTextType type;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final bethem = BeTheme.of(context);
    final textStyle = type.getStyle(bethem.style);

    return text == null || text!.isEmpty
        ? emptyWidget
        : Text(
          text!,
          style: textStyle.copyWith(color: color),
          maxLines: maxLine,
          overflow: overflow ?? TextOverflow.ellipsis,
          textAlign: align ?? TextAlign.start,
        );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<Color?>('color', color))
      ..add(IntProperty('maxLine', maxLine))
      ..add(DiagnosticsProperty<TextAlign?>('align', align))
      ..add(DiagnosticsProperty<EdgeInsets?>('padding', padding))
      ..add(DiagnosticsProperty<BeTextVariant?>('variant', variant))
      ..add(DiagnosticsProperty<TextStyle?>('style', style))
      ..add(EnumProperty<BeTextType?>('textType', type))
      ..add(DiagnosticsProperty<TextOverflow?>('overflow', overflow));
  }
}

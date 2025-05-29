import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeStyleLight extends BeStyle {
  const BeStyleLight({required super.color, required super.adaptiveStyle});

  @override
  TextStyle get displayLarge => _baseStyle.copyWith(
    fontSize: adaptiveStyle.displayLargeTextSize,
    height: adaptiveStyle.displayLargeLineHeight / adaptiveStyle.displayLargeTextSize,
    letterSpacing: -0.25,
  );

  @override
  TextStyle get displayMedium => _baseStyle.copyWith(
    fontSize: adaptiveStyle.displayMediumTextSize,
    height: adaptiveStyle.displayMediumLineHeight / adaptiveStyle.displayMediumTextSize,
  );

  @override
  TextStyle get displaySmall => _baseStyle.copyWith(
    fontSize: adaptiveStyle.displaySmallTextSize,
    height: adaptiveStyle.displaySmallLineHeight / adaptiveStyle.displaySmallTextSize,
  );

  @override
  TextStyle get headlineLarge => _baseStyle.copyWith(
    fontSize: adaptiveStyle.headlineLargeTextSize,
    height: adaptiveStyle.headlineLargeLineHeight / adaptiveStyle.headlineLargeTextSize,
  );

  @override
  TextStyle get headlineMedium => _baseStyle.copyWith(
    fontSize: adaptiveStyle.headlineMediumTextSize,
    height: adaptiveStyle.headlineMediumLineHeight / adaptiveStyle.headlineMediumTextSize,
  );

  @override
  TextStyle get headlineSmall => _baseStyle.copyWith(
    fontSize: adaptiveStyle.headlineSmallTextSize,
    height: adaptiveStyle.headlineSmallLineHeight / adaptiveStyle.headlineSmallTextSize,
  );

  @override
  TextStyle get titleLarge => _baseStyle.copyWith(
    fontSize: adaptiveStyle.titleLargeTextSize,
    height: adaptiveStyle.titleLargeLineHeight / adaptiveStyle.titleLargeTextSize,
  );

  @override
  TextStyle get titleMedium => _baseStyle.copyWith(
    fontSize: adaptiveStyle.titleMediumTextSize,
    height: adaptiveStyle.titleMediumLineHeight / adaptiveStyle.titleMediumTextSize,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get titleSmall => _baseStyle.copyWith(
    fontSize: adaptiveStyle.titleSmallTextSize,
    height: adaptiveStyle.titleSmallLineHeight / adaptiveStyle.titleSmallTextSize,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get bodyLarge => _baseStyle.copyWith(
    fontSize: adaptiveStyle.bodyLargeTextSize,
    height: adaptiveStyle.bodyLargeLineHeight / adaptiveStyle.bodyLargeTextSize,
    letterSpacing: 0.5,
  );

  @override
  TextStyle get bodyMedium => _baseStyle.copyWith(
    fontSize: adaptiveStyle.bodyMediumTextSize,
    height: adaptiveStyle.bodyMediumLineHeight / adaptiveStyle.bodyMediumTextSize,
    letterSpacing: 0.25,
  );

  @override
  TextStyle get bodySmall => _baseStyle.copyWith(
    fontSize: adaptiveStyle.bodySmallTextSize,
    height: adaptiveStyle.bodySmallLineHeight / adaptiveStyle.bodySmallTextSize,
    letterSpacing: 0.25,
  );

  @override
  TextStyle get labelLarge => _baseStyle.copyWith(
    fontSize: adaptiveStyle.labelLargeTextSize,
    height: adaptiveStyle.labelLargeLineHeight / adaptiveStyle.labelLargeTextSize,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get labelMedium => _baseStyle.copyWith(
    fontSize: adaptiveStyle.labelMediumTextSize,
    height: adaptiveStyle.labelMediumLineHeight / adaptiveStyle.labelMediumTextSize,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get labelSmall => _baseStyle.copyWith(
    fontSize: adaptiveStyle.labelSmallTextSize,
    height: adaptiveStyle.labelSmallLineHeight / adaptiveStyle.labelSmallTextSize,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  TextStyle get _baseStyle => TextStyle(
    package: BeUIConst.packageName,
    fontFamily: BeUIConst.fontFamily,
    fontWeight: FontWeight.w400,
    color: color.textPrimary,
    shadows: BeUIConst.textShadow,
  );

  @override
  BeStyle copyWith({final Object? color, final BeAdaptiveStyle? adaptiveStyle}) {
    return BeStyleLight(
      color: color is BeColor ? color : this.color,
      adaptiveStyle: adaptiveStyle ?? this.adaptiveStyle,
    );
  }
}

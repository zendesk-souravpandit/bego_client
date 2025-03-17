import 'package:beui/src/theme/styles/be_theme_const.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeStyleLight implements BeStyle {
  const BeStyleLight({this.color = const BeColorsLight(), this.inset = const BeMobileInset()});
  final BeColor color;
  final BeThemeValue inset;

  @override
  TextStyle get displayLarge => _baseStyle.copyWith(
    fontSize: inset.displayLargeTextSize,
    height: inset.displayLargeLineHeight / inset.displayLargeTextSize,
    letterSpacing: -0.25,
  );

  @override
  TextStyle get displayMedium => _baseStyle.copyWith(
    fontSize: inset.displayMediumTextSize,
    height: inset.displayMediumLineHeight / inset.displayMediumTextSize,
  );

  @override
  TextStyle get displaySmall => _baseStyle.copyWith(
    fontSize: inset.displaySmallTextSize,
    height: inset.displaySmallLineHeight / inset.displaySmallTextSize,
  );

  @override
  TextStyle get headlineLarge => _baseStyle.copyWith(
    fontSize: inset.headlineLargeTextSize,
    height: inset.headlineLargeLineHeight / inset.headlineLargeTextSize,
  );

  @override
  TextStyle get headlineMedium => _baseStyle.copyWith(
    fontSize: inset.headlineMediumTextSize,
    height: inset.headlineMediumLineHeight / inset.headlineMediumTextSize,
  );

  @override
  TextStyle get headlineSmall => _baseStyle.copyWith(
    fontSize: inset.headlineSmallTextSize,
    height: inset.headlineSmallLineHeight / inset.headlineSmallTextSize,
  );

  @override
  TextStyle get titleLarge => _baseStyle.copyWith(
    fontSize: inset.titleLargeTextSize,
    height: inset.titleLargeLineHeight / inset.titleLargeTextSize,
  );

  @override
  TextStyle get titleMedium => _baseStyle.copyWith(
    fontSize: inset.titleMediumTextSize,
    height: inset.titleMediumLineHeight / inset.titleMediumTextSize,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get titleSmall => _baseStyle.copyWith(
    fontSize: inset.titleSmallTextSize,
    height: inset.titleSmallLineHeight / inset.titleSmallTextSize,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get bodyLarge => _baseStyle.copyWith(
    fontSize: inset.bodyLargeTextSize,
    height: inset.bodyLargeLineHeight / inset.bodyLargeTextSize,
    letterSpacing: 0.5,
  );

  @override
  TextStyle get bodyMedium => _baseStyle.copyWith(
    fontSize: inset.bodyMediumTextSize,
    height: inset.bodyMediumLineHeight / inset.bodyMediumTextSize,
    letterSpacing: 0.25,
  );

  @override
  TextStyle get bodySmall => _baseStyle.copyWith(
    fontSize: inset.bodySmallTextSize,
    height: inset.bodySmallLineHeight / inset.bodySmallTextSize,
    letterSpacing: 0.25,
  );

  @override
  TextStyle get labelLarge => _baseStyle.copyWith(
    fontSize: inset.labelLargeTextSize,
    height: inset.labelLargeLineHeight / inset.labelLargeTextSize,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get labelMedium => _baseStyle.copyWith(
    fontSize: inset.labelMediumTextSize,
    height: inset.labelMediumLineHeight / inset.labelMediumTextSize,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get labelSmall => _baseStyle.copyWith(
    fontSize: inset.labelSmallTextSize,
    height: inset.labelSmallLineHeight / inset.labelSmallTextSize,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  TextStyle get _baseStyle => TextStyle(
    package: BeThemeConst.packageName,
    fontFamily: BeThemeConst.fontFamily,
    fontWeight: FontWeight.w400,
    color: color.textPrimary,
    shadows: BeThemeConst.textShadow,
  );
}

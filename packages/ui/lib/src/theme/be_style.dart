import 'package:beui/theme.dart';
import 'package:flutter/widgets.dart';

/// Style of ui component like heading text , body text,
/// button style app bar style, decoration shadow etc
abstract class BeStyle {
  const BeStyle({required this.color, required this.adaptiveStyle});
  final BeColor color;
  final BeAdaptiveStyle adaptiveStyle;
  TextStyle get headlineLarge;
  TextStyle get headlineMedium;
  TextStyle get headlineSmall;

  TextStyle get titleLarge;
  TextStyle get titleMedium;
  TextStyle get titleSmall;

  TextStyle get displayLarge;
  TextStyle get displayMedium;
  TextStyle get displaySmall;

  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;

  TextStyle get labelLarge;
  TextStyle get labelMedium;
  TextStyle get labelSmall;

  BeStyle copyWith({final BeColor? color, final BeAdaptiveStyle? adaptiveStyle});
}

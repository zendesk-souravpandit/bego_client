import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeStyleDark implements BeStyle {
  const BeStyleDark({
    this.color = const BeColorsDark(),
    this.inset = const BeMobileInset(),
  });
  final BeColor color;
  final BeThemeValue inset;

  @override
  TextStyle get bodyLarge => throw UnimplementedError();

  @override
  TextStyle get bodyMedium => throw UnimplementedError();

  @override
  TextStyle get bodySmall => throw UnimplementedError();

  @override
  TextStyle get displayLarge => throw UnimplementedError();

  @override
  TextStyle get displayMedium => throw UnimplementedError();

  @override
  TextStyle get displaySmall => throw UnimplementedError();

  @override
  TextStyle get headlineLarge => throw UnimplementedError();

  @override
  TextStyle get headlineMedium => throw UnimplementedError();

  @override
  TextStyle get headlineSmall => throw UnimplementedError();

  @override
  TextStyle get labelLarge => throw UnimplementedError();

  @override
  TextStyle get labelMedium => throw UnimplementedError();

  @override
  TextStyle get labelSmall => throw UnimplementedError();

  @override
  TextStyle get titleLarge => throw UnimplementedError();

  @override
  TextStyle get titleMedium => throw UnimplementedError();

  @override
  TextStyle get titleSmall => throw UnimplementedError();
}

import 'package:beui/src/screen/be_breakpoint.dart';
import 'package:beui/src/theme/be_color.dart';
import 'package:beui/src/theme/be_style.dart';
import 'package:beui/src/theme/be_style_values.dart';
import 'package:beui/src/theme/styles/be_colors_light.dart';
import 'package:beui/src/theme/styles/be_style_light.dart';
import 'package:flutter/material.dart';

@immutable
class BeThemeData extends ThemeExtension<BeThemeData> {
  const BeThemeData({
    required this.breakpoint,
    required this.styleValue,
    this.themeMode = ThemeMode.system,
    this.colors = const BeColorsLight(),
    this.style = const BeStyleLight(),
  });
  final ThemeMode themeMode;
  final BeStyle style;
  final BeColor colors;
  final BeStyleValues styleValue;
  final BeBreakpoint breakpoint;

  @override
  BeThemeData copyWith({
    BeBreakpoint? breakpoint,
    BeStyle? style,
    BeColor? colors,
    BeStyleValues? inset,
  }) => BeThemeData(
    breakpoint: breakpoint ?? this.breakpoint,
    style: style ?? this.style,
    colors: colors ?? this.colors,
    styleValue: inset ?? styleValue,
  );

  @override
  BeThemeData lerp(BeThemeData? other, double t) {
    if (other is! BeThemeData) {
      return this;
    }
    return BeThemeData(
      breakpoint:
          other.breakpoint, // Implement breakpoint interpolation if needed
      style: other.style, // You can implement lerping for style if needed
      colors: other.colors,
      styleValue: other.styleValue, // Implement color interpolation if needed
    );
  }
}

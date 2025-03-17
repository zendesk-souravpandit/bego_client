import 'package:beui/src/screen/be_breakpoint.dart';
import 'package:beui/src/theme/be_color.dart';
import 'package:beui/src/theme/be_style.dart';
import 'package:beui/src/theme/be_theme_value.dart';
import 'package:beui/src/theme/styles/be_colors_light.dart';
import 'package:beui/src/theme/styles/be_style_light.dart';
import 'package:flutter/material.dart';

@immutable
class BeThemeData extends ThemeExtension<BeThemeData> {
  const BeThemeData({
    required this.breakpoint,
    required this.inset,
    this.themeMode = ThemeMode.system,
    this.colors = const BeColorsLight(),
    this.style = const BeStyleLight(),
  });
  final ThemeMode themeMode;
  final BeStyle style;
  final BeColor colors;
  final BeThemeValue inset;
  final BeBreakpoint breakpoint;

  @override
  BeThemeData copyWith({BeBreakpoint? breakpoint, BeStyle? style, BeColor? colors, BeThemeValue? inset}) => BeThemeData(
    breakpoint: breakpoint ?? this.breakpoint,
    style: style ?? this.style,
    colors: colors ?? this.colors,
    inset: inset ?? this.inset,
  );

  @override
  BeThemeData lerp(BeThemeData? other, double t) {
    if (other is! BeThemeData) {
      return this;
    }
    return BeThemeData(
      breakpoint: other.breakpoint, // Implement breakpoint interpolation if needed
      style: other.style, // You can implement lerping for style if needed
      colors: other.colors,
      inset: other.inset, // Implement color interpolation if needed
    );
  }
}

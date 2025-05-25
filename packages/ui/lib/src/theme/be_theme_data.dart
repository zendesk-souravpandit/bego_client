import 'package:beui/src/screen/be_breakpoint.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
// @Default(BeResponsivePoints()) final BeResponsivePoints responsivePoints,

@immutable
class BeThemeData extends ThemeExtension<BeThemeData> {
  const BeThemeData({
    this.breakpoint = BeBreakpoint.md,
    this.themeMode = ThemeMode.light,
    this.styleValue = const BeMobileValue(),
    this.colors = const BeColorsLight(),
    this.style = const BeStyleLight(),
  });
  final ThemeMode themeMode;
  final BeStyle style;
  final BeColor colors;
  final BeStyleValue styleValue;
  final BeBreakpoint breakpoint;

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      extensions: <ThemeExtension<BeThemeData>>[
        const BeThemeData(
          breakpoint: BeBreakpoint.md,
          styleValue: BeMobileValue(),
          colors: BeColorsLight(),
          style: BeStyleLight(),
        ),
      ],
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      extensions: <ThemeExtension<BeThemeData>>[
        const BeThemeData(
          breakpoint: BeBreakpoint.md,
          styleValue: BeMobileValue(),
          colors: BeColorsDark(),
          style: BeStyleDark(),
        ),
      ],
    );
  }

  @override
  BeThemeData copyWith({
    final BeBreakpoint? breakpoint,
    final BeStyle? style,
    final BeColor? colors,
    final BeStyleValue? inset,
  }) => BeThemeData(
    breakpoint: breakpoint ?? this.breakpoint,
    style: style ?? this.style,
    colors: colors ?? this.colors,
    styleValue: inset ?? styleValue,
  );

  @override
  BeThemeData lerp(final BeThemeData? other, final double t) {
    if (other is! BeThemeData) {
      return this;
    }
    return BeThemeData(
      breakpoint: other.breakpoint, // Implement breakpoint interpolation if needed
      style: other.style, // You can implement lerping for style if needed
      colors: other.colors,
      styleValue: other.styleValue, // Implement color interpolation if needed
    );
  }
}

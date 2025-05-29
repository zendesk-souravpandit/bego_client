import 'package:beui/src/screen/be_breakpoint.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
// @Default(BeResponsivePoints()) final BeResponsivePoints responsivePoints,

@immutable
class BeThemeData extends ThemeExtension<BeThemeData> {
  BeThemeData({
    required this.breakpoint,
    required this.colors,
    required this.themeMode,
    final BeAdaptiveStyle? adaptiveStyle,
  }) : style =
           themeMode == ThemeMode.light
               ? BeStyleLight(color: colors, adaptiveStyle: adaptiveStyle ?? breakpoint.adaptiveStyle)
               : BeStyleDark(color: colors, adaptiveStyle: adaptiveStyle ?? breakpoint.adaptiveStyle);

  final BeBreakpoint breakpoint;
  final BeColor colors;
  final ThemeMode themeMode;
  final BeStyle style;

  static ThemeData light() {
    final betheme = BeThemeData(themeMode: ThemeMode.light, breakpoint: BeBreakpoint.md, colors: const BeColorsLight());
    return BeTheme.buildThemeData(betheme: betheme);
  }

  static ThemeData dark() {
    final betheme = BeThemeData(breakpoint: BeBreakpoint.md, themeMode: ThemeMode.dark, colors: const BeColorsDark());
    return BeTheme.buildThemeData(betheme: betheme);
  }

  @override
  BeThemeData copyWith({
    final BeBreakpoint? breakpoint,
    final ThemeMode? themeMode,
    final BeStyle? style,
    final BeColor? colors,
    final BeAdaptiveStyle? adaptiveStyle,
  }) {
    return BeThemeData(
      themeMode: themeMode ?? this.themeMode,
      breakpoint: breakpoint ?? this.breakpoint,
      colors: colors ?? this.colors,
      adaptiveStyle: adaptiveStyle ?? this.style.adaptiveStyle,
    );
  }

  @override
  BeThemeData lerp(final BeThemeData? other, final double t) {
    if (other is! BeThemeData) {
      return this;
    }
    return BeThemeData(
      breakpoint: other.breakpoint,
      colors: other.colors,
      themeMode: other.themeMode,
      adaptiveStyle: other.style.adaptiveStyle,
    );
  }
}

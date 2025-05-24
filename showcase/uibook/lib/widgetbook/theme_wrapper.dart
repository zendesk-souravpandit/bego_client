import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeThemeManager {
  static BeThemeData createThemeData({required final ThemeMode themeMode, required final BeBreakpoint breakpoint}) {
    final insets = getStyleValue(breakpoint);
    final colors = themeMode == ThemeMode.light ? const BeColorsLight() : const BeColorsDark();
    final style =
        themeMode == ThemeMode.light
            ? BeStyleLight(color: colors, inset: insets)
            : BeStyleDark(color: colors, inset: insets);

    return BeThemeData(breakpoint: breakpoint, styleValue: insets, colors: colors, style: style, themeMode: themeMode);
  }

  static ThemeData createTheme({required final ThemeMode themeMode}) {
    final colors = themeMode == ThemeMode.light ? const BeColorsLight() : const BeColorsDark();

    return ThemeData(
      scaffoldBackgroundColor: colors.background,
      appBarTheme: AppBarTheme(backgroundColor: colors.background),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: colors.background),
    );
  }
}

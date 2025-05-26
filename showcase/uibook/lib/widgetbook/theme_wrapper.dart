import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeThemeManager {
  static BeThemeData createThemeData({required final BeBreakpoint breakpoint}) {
    const themeMode = ThemeMode.light;
    const colors = themeMode == ThemeMode.light ? BeColorsLight() : BeColorsDark();

    return BeThemeData(breakpoint: breakpoint, colors: colors, themeMode: themeMode);
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

import 'package:beui/screen.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeThemeManager {
  static BeThemeData createThemeData({required ThemeMode themeMode, required BeBreakpoint breakpoint}) {
    final insets = getInsetForBreakpoint(breakpoint);
    final colors = themeMode == ThemeMode.light ? const BeColorsLight() : const BeColorsDark();
    final style =
        themeMode == ThemeMode.light
            ? BeStyleLight(color: colors, inset: insets)
            : BeStyleDark(color: colors, inset: insets);

    return BeThemeData(breakpoint: breakpoint, inset: insets, colors: colors, style: style, themeMode: themeMode);
  }
}

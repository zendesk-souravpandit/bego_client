import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class AppThemeController extends GetxController {
  final themeMode = ThemeMode.light.obs;
  final theme = BeThemeData.light().obs;
  var breakpoint = BeBreakpoint.md.obs;

  void setBreakpoint(final BeBreakpoint newBreakpoint) {
    if (breakpoint.value != newBreakpoint) {
      breakpoint.value = newBreakpoint;
      _updateTheme();
    }
  }

  void toggleTheme() {
    themeMode.value = themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _updateTheme();
  }

  void _updateTheme() {
    final colors = themeMode.value == ThemeMode.light ? const BeColorsLight() : const BeColorsDark();
    final betheme = BeThemeData(breakpoint: breakpoint.value, colors: colors, themeMode: themeMode.value);
    theme.value = BeTheme.buildThemeData(betheme: betheme);
    Get.changeTheme(theme.value);
  }
}

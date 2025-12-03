import 'package:becomponent/app.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class AppThemeController extends GetxController {
  final themeMode = ThemeMode.light.obs;
  final theme = BeThemeData.light().obs;
  late final breakpoint = Rx<BeBreakpoint?>(null);

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
    // Only update theme if breakpoint has been initialized
    if (breakpoint.value == null) return;

    final colors = themeMode.value == ThemeMode.light
        ? const BeColorsLight()
        : const BeColorsDark();
    final betheme = BeThemeData(colors: colors, breakpoint: breakpoint.value!);
    theme.value = BeTheme.buildThemeData(betheme: betheme);

    // Schedule theme change for next frame to ensure GetX MaterialApp is ready
    WidgetsBinding.instance.addPostFrameCallback((_) => Get.changeTheme(theme.value));
  }

  @override
  void onInit() {
    super.onInit();
    final theme = Get.find<AppSettingsController>().state.theme;

    themeMode.value = theme == ThemeMode.dark.name ? ThemeMode.dark : ThemeMode.light;
    // theme
  }
}

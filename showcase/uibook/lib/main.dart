import 'package:beui/layout.dart';
import 'package:beui/overlay.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:uibook/main.directories.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

final themeList = [
  WidgetbookTheme(
    name: 'Light',
    data: BeTheme.buildThemeData(
      betheme: BeThemeData(breakpoint: BeBreakpoint.md, themeMode: ThemeMode.light, colors: const BeColorsLight()),
    ),
  ),
  WidgetbookTheme(
    name: 'Dark',
    data: BeTheme.buildThemeData(
      betheme: BeThemeData(breakpoint: BeBreakpoint.md, themeMode: ThemeMode.dark, colors: const BeColorsDark()),
    ),
  ),
];

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(final BuildContext context) => Widgetbook.material(
    // themeMode: ThemeMode.system,
    directories: directories,
    addons: <WidgetbookAddon>[
      DeviceFrameAddon(
        devices: [
          Devices.ios.iPhone13,
          Devices.ios.iPadAir4,
          Devices.ios.iPad12InchesGen4,
          Devices.windows.laptop,
          Devices.android.mediumPhone,
        ],
      ),
      InspectorAddon(),

      ThemeAddon<ThemeData>(
        themes: themeList,
        initialTheme: themeList.first,
        themeBuilder: (final context, final theme, final child) => _OptimizedThemeWrapper(theme: theme, child: child),
      ),
      AlignmentAddon(),
    ],
  );
}

// Optimized theme wrapper to prevent unnecessary rebuilds
class _OptimizedThemeWrapper extends StatelessWidget {
  const _OptimizedThemeWrapper({required this.theme, required this.child});

  final ThemeData theme;
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        final themeMode = theme.brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
        final breakpoint = calculateBreakpoint(constraints.maxWidth, const BeResponsivePoints());
        final colors = themeMode == ThemeMode.light ? const BeColorsLight() : const BeColorsDark();
        final betheme = BeThemeData(breakpoint: breakpoint, colors: colors, themeMode: themeMode);

        // Memoize theme data to prevent unnecessary recalculations
        final themeData = BeTheme.buildThemeData(betheme: betheme);

        return BeTheme(
          betheme: betheme,
          child: BeNotificationsProvider(
            child: Theme(data: themeData, child: Scaffold(body: RepaintBoundary(child: child))),
          ),
        );
      },
    );
  }
}

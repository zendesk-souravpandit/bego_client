import 'package:beui/layout.dart';
import 'package:beui/overlay.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:uibook/main.directories.g.dart';
import 'package:uibook/widgetbook/theme_wrapper.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

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
        themes: [
          WidgetbookTheme(
            name: 'Dark',
            data: BeTheme.buildThemeData(
              betheme: BeThemeData(
                breakpoint: BeBreakpoint.md,
                themeMode: ThemeMode.dark,
                colors: const BeColorsDark(),
              ),
            ),
          ),
          WidgetbookTheme(
            name: 'Light',
            data: BeTheme.buildThemeData(
              betheme: BeThemeData(
                breakpoint: BeBreakpoint.md,
                themeMode: ThemeMode.light,
                colors: const BeColorsLight(),
              ),
            ),
          ),
        ],

        themeBuilder:
            (final context, final theme, final child) => LayoutBuilder(
              builder: (final context, final constraints) {
                final bebreakpoint = calculateBreakpoint(constraints.maxWidth, const BeResponsivePoints());
                final betheme = BeThemeManager.createThemeData(breakpoint: bebreakpoint);

                return BeTheme(
                  betheme: betheme,
                  child: BeNotificationsProvider(
                    maxVisible: betheme.style.adaptiveStyle.notificationMaxCount,
                    child: Builder(
                      builder: (final context) {
                        return MaterialApp(
                          // themeMode: betheme.themeMode,
                          // theme: BeTheme.buildThemeData(),
                          home: Scaffold(backgroundColor: betheme.colors.background, body: child),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
      ),
      AlignmentAddon(),
    ],
  );
}

import 'package:beui/screen.dart';
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
  Widget build(BuildContext context) => Widgetbook.material(
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

      ThemeAddon<BeThemeData>(
        themes: [
          const WidgetbookTheme(
            name: 'Dark',
            data: BeThemeData(
              breakpoint: BeBreakpoint.md,
              themeMode: ThemeMode.dark,
              inset: BeMobileInset(),
            ),
          ),
          const WidgetbookTheme(
            name: 'Light',
            data: BeThemeData(
              breakpoint: BeBreakpoint.md,
              themeMode: ThemeMode.light,
              inset: BeMobileInset(),
            ),
          ),
        ],

        themeBuilder:
            (context, theme, child) => LayoutBuilder(
              builder: (context, constraints) {
                final bebreakpoint = calculateBreakpoint(
                  constraints.maxWidth,
                  const BeResponsivePoints(),
                );
                final betheme = BeThemeManager.createThemeData(
                  themeMode: theme.themeMode,
                  breakpoint: bebreakpoint,
                );

                return MaterialApp(
                  themeMode: betheme.themeMode,
                  theme: ThemeData(
                    brightness:
                        betheme.themeMode == ThemeMode.light
                            ? Brightness.light
                            : Brightness.dark,
                    extensions: [betheme],
                  ),
                  home: Scaffold(
                    backgroundColor: betheme.colors.background,
                    body: child,
                  ),
                );
              },
            ),
      ),
      AlignmentAddon(),
    ],
  );
}

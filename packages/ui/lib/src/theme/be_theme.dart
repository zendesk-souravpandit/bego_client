// ignore_for_file: prefer_expression_function_bodies

import 'package:beui/src/theme/theme_builder.dart';
import 'package:beui/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BeTheme extends StatelessWidget {
  const BeTheme({required this.child, this.colors = const BeColorsLight(), super.key});

  // /// Deprecated constructor - use the default constructor instead
  // @Deprecated('Use BeTheme() constructor with colors parameter instead')
  // const BeTheme.withThemeData({required this.child, super.key}) : colors = null, themeMode = null;

  final Widget child;
  final BeColor colors;

  // @useResult
  static BeThemeData of(final BuildContext context) {
    final beThemeData = Theme.of(context).extension<BeThemeData>();
    if (beThemeData == null) {
      throw FlutterError('BeThemeData not found in the current Theme context.');
    }
    return beThemeData;
  }

  static ThemeData buildThemeData({required final BeThemeData betheme}) {
    return buildTheme(betheme: betheme);
  }

  @override
  Widget build(final BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final brightness = MediaQuery.platformBrightnessOf(context);

    // Theme mode is automatically determined by platform brightness
    final isDark = brightness == Brightness.dark;

    // Create responsive theme based on screen width and platform brightness
    final responsiveThemeData = BeThemeData.responsive(screenSize.width, isDark: isDark, colors: colors);

    return Theme(data: responsiveThemeData, child: child);
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BeColor>('colors', colors));
  }
}

// ignore_for_file: prefer_expression_function_bodies

import 'package:beui/src/theme/be_theme_data.dart';
import 'package:beui/src/theme/theme_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BeTheme extends StatelessWidget {
  const BeTheme({required this.child, required this.betheme, super.key});

  final Widget child;
  final BeThemeData betheme;

  // @useResult
  static BeThemeData of(BuildContext context) => Theme.of(context).extension<BeThemeData>()!;

  static ThemeData buildThemeOf(BuildContext context) {
    final betheme = of(context);
    final brightness = betheme.themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
    return buildTheme(betheme: betheme, brightness: brightness);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final materialTheme = brightness == Brightness.dark ? ThemeData.dark() : ThemeData.light();
    final themeData = materialTheme.copyWith(extensions: <ThemeExtension<BeThemeData>>[betheme]);
    return Theme(data: themeData, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BeThemeData>('betheme', betheme));
  }
}

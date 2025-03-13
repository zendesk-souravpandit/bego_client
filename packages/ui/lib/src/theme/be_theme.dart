import 'package:beui/src/theme/be_theme_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BeTheme extends StatelessWidget {
  const BeTheme({required this.child, super.key, this.themeMode = ThemeMode.system});

  final Widget child;
  final ThemeMode themeMode;

  static BeThemeData of(BuildContext context) => Theme.of(context).extension<BeThemeData>()!;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && brightness == Brightness.dark);

    return Theme(
      data: ThemeData(extensions: <ThemeExtension<BeThemeData>>[if (isDark) BeThemeData.dark else BeThemeData.light]),
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<ThemeMode>('themeMode', themeMode));
  }
}

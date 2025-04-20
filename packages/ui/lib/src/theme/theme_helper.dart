import 'package:beui/screen.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

extension ThemeStateGetter on State<dynamic> {
  BeThemeData get betheme => BeTheme.of(context);
  BeStyle get bestyles => BeTheme.of(context).style;
  BeColor get becolors => BeTheme.of(context).colors;
  BeStyleValue get beinset => BeTheme.of(context).styleValue;
}

extension ThemeGetter on StatelessWidget {
  /// [BeStyle] helper extension for obtaining [BeThemeData] contains
  /// style, insets, colors attribute
  BeThemeData betheme(BuildContext context) => BeTheme.of(context);

  /// [BeStyle] helper extension for obtaining the style of contains
  /// TextStyle, ButtonStyle, RoundedCorner, Decoration, Shadow,
  /// Elevation anount etc
  BeStyle bestyles(BuildContext context) => BeTheme.of(context).style;
  BeColor becolors(BuildContext context) => BeTheme.of(context).colors;
  BeStyleValue beinsets(BuildContext context) => BeTheme.of(context).styleValue;
}

BeStyleValue getStyleValue(BeBreakpoint? breakpoint) {
  switch (breakpoint) {
    case BeBreakpoint.xs:
    case BeBreakpoint.sm:
      return const BeMobileValue();
    case BeBreakpoint.md:
      return const BeTabletValue();
    case BeBreakpoint.lg:
    case BeBreakpoint.xl:
    case BeBreakpoint.xl2:
      return const BeDesktopValue();
    default:
      return const BeMobileValue();
  }
}

extension BeStyleValueFromBreakpoint on BeBreakpoint? {
  BeStyleValue get styleValues {
    switch (this) {
      case BeBreakpoint.xs:
      case BeBreakpoint.sm:
        return const BeMobileValue();
      case BeBreakpoint.md:
        return const BeTabletValue();
      case BeBreakpoint.lg:
      case BeBreakpoint.xl:
      case BeBreakpoint.xl2:
        return const BeDesktopValue();
      default:
        return const BeMobileValue();
    }
  }
}

import 'package:beui/src/screen/be_breakpoint.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
// @Default(BeResponsivePoints()) final BeResponsivePoints responsivePoints,

@immutable
class BeThemeData extends ThemeExtension<BeThemeData> {
  /// Create theme data that automatically detects screen size
  BeThemeData({required this.colors, final BeBreakpoint? breakpoint})
    : breakpoint = breakpoint ?? BeBreakpoint.md,
      style =
          colors.isDark
              ? BeStyleDark(
                color: colors,
                adaptiveStyle: _getResponsiveStyleForBreakpoint(breakpoint ?? BeBreakpoint.md),
              )
              : BeStyleLight(
                color: colors,
                adaptiveStyle: _getResponsiveStyleForBreakpoint(breakpoint ?? BeBreakpoint.md),
              );

  BeThemeData._internal({required this.breakpoint, required this.colors, final BeAdaptiveStyle? adaptiveStyle})
    : style =
          colors.isDark
              ? BeStyleDark(color: colors, adaptiveStyle: adaptiveStyle ?? _getResponsiveStyleForBreakpoint(breakpoint))
              : BeStyleLight(
                color: colors,
                adaptiveStyle: adaptiveStyle ?? _getResponsiveStyleForBreakpoint(breakpoint),
              );

  final BeBreakpoint breakpoint;
  final BeColor colors;
  final BeStyle style;

  /// Get isDark from colors
  bool get isDark => colors.isDark;

  /// Get responsive style based on breakpoint
  static BeAdaptiveStyle _getResponsiveStyleForBreakpoint(final BeBreakpoint breakpoint) {
    return switch (breakpoint) {
      BeBreakpoint.xs || BeBreakpoint.sm => const BeMobileValue(),
      BeBreakpoint.md => const BeTabletValue(),
      BeBreakpoint.lg || BeBreakpoint.xl || BeBreakpoint.xl2 => const BeDesktopValue(),
    };
  }

  /// Create light theme with automatic responsive behavior
  static ThemeData light({final BeColor? colors, final double? screenWidth}) {
    final breakpoint = calculateBreakpoint(screenWidth ?? 1024);
    final betheme = BeThemeData(colors: colors ?? const BeColorsLight(), breakpoint: breakpoint);
    return BeTheme.buildThemeData(betheme: betheme);
  }

  /// Create dark theme with automatic responsive behavior
  static ThemeData dark({final BeColor? colors, final double? screenWidth}) {
    final breakpoint = calculateBreakpoint(screenWidth ?? 1024);
    final betheme = BeThemeData(colors: colors ?? const BeColorsDark(), breakpoint: breakpoint);
    return BeTheme.buildThemeData(betheme: betheme);
  }

  /// Create responsive theme based on screen width and brightness
  static ThemeData responsive(final double screenWidth, {final bool isDark = false, required final BeColor colors}) {
    return isDark ? dark(colors: colors, screenWidth: screenWidth) : light(colors: colors, screenWidth: screenWidth);
  }

  @override
  BeThemeData copyWith({
    final BeBreakpoint? breakpoint,
    final BeStyle? style,
    final BeColor? colors,
    final BeAdaptiveStyle? adaptiveStyle,
  }) {
    return BeThemeData._internal(
      breakpoint: breakpoint ?? this.breakpoint,
      colors: colors ?? this.colors,
      adaptiveStyle: adaptiveStyle ?? this.style.adaptiveStyle,
    );
  }

  @override
  BeThemeData lerp(final BeThemeData? other, final double t) {
    if (other is! BeThemeData) {
      return this;
    }
    return BeThemeData._internal(
      breakpoint: other.breakpoint,
      colors: other.colors,
      adaptiveStyle: other.style.adaptiveStyle,
    );
  }
}

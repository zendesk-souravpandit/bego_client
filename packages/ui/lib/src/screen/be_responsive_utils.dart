import 'package:beui/screen.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeResponsiveUtil {
  const BeResponsiveUtil(
    this.baseSize, {
    this.mobileFactor = 0.85,
    this.tabletFactor = 1.0,
    this.desktopFactor = 1.15,
  });
  final double baseSize;
  final double mobileFactor;
  final double tabletFactor;
  final double desktopFactor;

  double _getMultiplier(BeBreakpoint breakpoint) => switch (breakpoint) {
    BeBreakpoint.xs || BeBreakpoint.sm => mobileFactor,
    BeBreakpoint.md => tabletFactor,
    BeBreakpoint.lg || BeBreakpoint.xl || BeBreakpoint.xl2 => desktopFactor,
  };

  double value(BuildContext context) {
    final breakpoint = BeTheme.of(context).breakpoint;
    return (baseSize * _getMultiplier(breakpoint)).truncateToDouble();
  }

  // Layout utilities
  SizedBox gap(BuildContext context) =>
      SizedBox.square(dimension: value(context));
  SizedBox gapW(BuildContext context) => SizedBox(width: value(context));
  SizedBox gapH(BuildContext context) => SizedBox(height: value(context));

  // Padding utilities
  EdgeInsets paddingAll(BuildContext context) => EdgeInsets.all(value(context));
  EdgeInsets paddingH(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: value(context));
  EdgeInsets paddingV(BuildContext context) =>
      EdgeInsets.symmetric(vertical: value(context));
  EdgeInsets paddingHV(BuildContext context, [double hFactor = 1.5]) =>
      EdgeInsets.symmetric(
        horizontal: value(context) * hFactor,
        vertical: value(context),
      );

  // Border radius
  BorderRadius radius(BuildContext context) =>
      BorderRadius.circular(value(context));
}

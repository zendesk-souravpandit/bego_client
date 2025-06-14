import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeResponsiveSize extends StatelessWidget {
  const BeResponsiveSize({
    super.key,
    required this.baseSize,
    this.child,
    this.mobileFactor = 0.85,
    this.tabletFactor = 1.0,
    this.desktopFactor = 1.15,
  });

  // Padding variants
  BeResponsiveSize.paddingAll({
    super.key,
    required this.baseSize,
    required final Widget child,
    this.mobileFactor = 1.0,
    this.tabletFactor = 1.15,
    this.desktopFactor = 1.25,
  }) : child = Padding(padding: EdgeInsets.all(baseSize), child: child);
  final double baseSize;
  final Widget? child;
  final double mobileFactor;
  final double tabletFactor;
  final double desktopFactor;

  double _getValue(final BuildContext context) {
    final breakpoint = BeTheme.of(context).breakpoint;
    final multiplier = switch (breakpoint) {
      BeBreakpoint.xs || BeBreakpoint.sm => mobileFactor,
      BeBreakpoint.md => tabletFactor,
      BeBreakpoint.lg || BeBreakpoint.xl || BeBreakpoint.xl2 => desktopFactor,
    };
    return (baseSize * multiplier).truncateToDouble();
  }

  @override
  Widget build(final BuildContext context) {
    final value = _getValue(context);
    return child ?? SizedBox.square(dimension: value);
  }
}

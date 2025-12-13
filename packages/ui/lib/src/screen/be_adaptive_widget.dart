import 'package:flutter/material.dart';

class BeAdaptiveWidget extends StatelessWidget {
  /// Responsive widget that shows [default] widget on smaller widths,
  /// optional [medium] widget on mid sizes, and optional [large] widget on large widths.
  /// Breakpoints for medium and large are defined by [mediumBreakpoint] and [largeBreakpoint].
  ///
  /// Widget width <= mediumBreakpoint: show [default]
  /// Widget width > mediumBreakpoint and <= largeBreakpoint: show [medium] if provided, else fallback to [default]
  /// Widget width > largeBreakpoint: show [large] if provided, else fallback to [medium] or [default]
  const BeAdaptiveWidget({
    super.key,
    required this.defaultWidget,
    this.mediumWidget,
    this.largeWidget,
    this.mediumBreakpoint = 600,
    this.largeBreakpoint = 1024,
  }) : assert(mediumBreakpoint < largeBreakpoint, 'mediumBreakpoint must be less than largeBreakpoint');

  /// Widget shown for widths ≤ mediumBreakpoint (small/default layout)
  final Widget defaultWidget;

  /// Optional widget shown for widths > mediumBreakpoint and ≤ largeBreakpoint (medium layout)
  final Widget? mediumWidget;

  /// Optional widget shown for widths > largeBreakpoint (large layout)
  final Widget? largeWidget;

  /// Upper bound for [defaultWidget] (inclusive)
  final double mediumBreakpoint;

  /// Upper bound for [mediumWidget] (inclusive)
  final double largeBreakpoint;

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        final width = constraints.maxWidth;

        if (width <= mediumBreakpoint) {
          return defaultWidget;
        } else if (width <= largeBreakpoint) {
          return mediumWidget ?? defaultWidget;
        } else {
          return largeWidget ?? mediumWidget ?? defaultWidget;
        }
      },
    );
  }
}

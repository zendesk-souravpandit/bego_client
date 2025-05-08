// ignore_for_file: lines_longer_than_80_chars

import 'package:beui/common.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

typedef ResolveWidget = Widget? Function(BeBreakpoint);

/// Responsive size widget that adjusts its size based on the current breakpoint.
/// ```
///   BeBreakpoint.xs || BeBreakpoint.sm => MobileView(),
///   BeBreakpoint.md => TabletView(),
///   BeBreakpoint.lg || BeBreakpoint.xl || BeBreakpoint.xl2 => DesktopView(),
/// ```
///
///
///  `Global` `BeResponsiveSize` is a widget that can be used to create responsive layouts
/// ``` const responsiveAppBar = BeResponsiveWidget(
///   resolver: (breakpoint) {
///     return switch (breakpoint) {
///       BeBreakpoint.xs => SlimAppBar(),
///       BeBreakpoint.sm || BeBreakpoint.md => StandardAppBar(),
///       _ => ExpandedAppBar(),
///     };
///   },
/// );
///```
/// Usage:
///```
/// const Scaffold(
///   appBar: responsiveAppBar,
///   body: ...,
/// )
/// ```
class BeResponsiveWidget extends StatelessWidget {
  const BeResponsiveWidget({super.key, required this.resolver, this.fallback});

  /// Function that returns a widget based on breakpoint
  final ResolveWidget resolver;

  /// Fallback widget if none of the breakpoints match
  final Widget? fallback;

  @override
  Widget build(BuildContext context) {
    final breakpoint = BeTheme.of(context).breakpoint;
    final resolveWidget = resolver(breakpoint);
    return resolveWidget ?? fallback ?? emptyWidget;
  }
}

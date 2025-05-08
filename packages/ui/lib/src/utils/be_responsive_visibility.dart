import 'package:beui/common.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/widgets.dart';

final class BeResponsiveVisibility {
  BeResponsiveVisibility({required this.child, this.visibleFor});

  /// Defines for which breakpoints the child should be visible
  /// If null or empty, child will be visible for all breakpoints
  final Map<BeBreakpoint, bool>? visibleFor;

  final Widget child;

  Widget resolve(BuildContext context) {
    if (visibleFor == null || visibleFor!.isEmpty) return child;

    final currentBreakpoint = BeTheme.of(context).breakpoint;
    final isVisible = visibleFor![currentBreakpoint] ?? true;

    return isVisible ? child : emptyWidget;
  }
}

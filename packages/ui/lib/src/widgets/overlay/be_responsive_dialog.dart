import 'package:beui/layout.dart';
import 'package:beui/src/decoration/be_breakpoint_radius.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

/// Shows a responsive dialog that adapts to screen width breakpoints.
///
/// The dialog width, padding and decorations change based on device size.
/// You can customize barrier behavior, shadow, padding, and decoration.
void showBeResponsiveDialog<T>({
  required final BuildContext context,
  required final Widget child,
  final bool barrierDismissible = true,
  final Color barrierColor = Colors.black54,
  final bool showShadow = true,
  final EdgeInsetsGeometry? padding,
  final Decoration? decoration,
  final DialogRadius dialogRadius = const DialogRadius(),
}) {
  final betheme = BeTheme.of(context);
  showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    useSafeArea: true,
    builder:
        (_) => ResponsiveDialog(
          betheme: betheme,
          showShadow: showShadow,
          padding: padding,
          decoration: decoration,
          radius: dialogRadius,
          child: child,
        ),
  );
}

/// A dialog widget that adjusts its size, padding and style based on screen width breakpoints.
class ResponsiveDialog extends StatelessWidget {
  const ResponsiveDialog({
    super.key,
    required this.betheme,
    required this.child,
    this.radius = const DialogRadius(),
    this.padding,
    this.decoration,
    this.showShadow = true,
  });

  final BeThemeData betheme;
  final Widget child;
  final DialogRadius radius;
  final bool showShadow;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (_, final constraints) {
        final breakpoint = calculateBreakpoint(constraints.maxWidth);
        final mediaSize = MediaQuery.of(context).size;

        // Determine max width for dialog based on breakpoint
        final double dialogWidth = _dialogWidthForBreakpoint(breakpoint, mediaSize.width);

        // Get default padding for breakpoint or override if specified
        final EdgeInsetsGeometry dialogPadding = padding ?? _paddingForBreakpoint(breakpoint);

        // Determine max height (limited on mobile, fixed otherwise)
        final double maxHeight = breakpoint.isMobile ? mediaSize.height * 0.8 : 700.0;

        return Center(
          child: Material(
            color: Colors.transparent,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: dialogWidth, maxHeight: maxHeight),
              child: Container(
                padding: dialogPadding,
                decoration:
                    decoration ??
                    BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(radius.getValue(breakpoint)),
                      boxShadow: showShadow ? _defaultShadow() : null,
                    ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper: dialog width by breakpoint
  double _dialogWidthForBreakpoint(final BeBreakpoint breakpoint, final double screenWidth) {
    switch (breakpoint) {
      case BeBreakpoint.xs:
        return screenWidth * 0.9;
      case BeBreakpoint.sm:
        return screenWidth * 0.8;
      case BeBreakpoint.md:
        return 500.0;
      default: // lg, xl, xl2
        return 600.0;
    }
  }

  // Helper: padding by breakpoint
  EdgeInsetsGeometry _paddingForBreakpoint(final BeBreakpoint breakpoint) {
    switch (breakpoint) {
      case BeBreakpoint.xs:
        return const EdgeInsets.all(16.0);
      case BeBreakpoint.sm:
        return const EdgeInsets.all(20.0);
      default:
        return const EdgeInsets.all(24.0);
    }
  }

  // Helper: default box shadow
  List<BoxShadow> _defaultShadow() => [
    BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 24.0, offset: const Offset(0, 8)),
  ];
}

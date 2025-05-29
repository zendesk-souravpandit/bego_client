import 'package:beui/layout.dart';
import 'package:beui/src/decoration/be_breakpoint_radius.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

void showBeResponsiveDialog<T>({
  required final BuildContext context,
  required final Widget child,
  final bool barrierDismissible = true,
  final Color barrierColor = Colors.black54,
  final bool showShadow = true,
}) {
  final betheme = BeTheme.of(context);

  showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    useSafeArea: true,
    builder: (final context) {
      return ResponsiveDialog(betheme: betheme, showShadow: showShadow, child: child);
    },
  );
}

class ResponsiveDialog extends StatelessWidget {
  const ResponsiveDialog({
    super.key,
    required this.betheme,
    required this.child,
    this.radius = const DialogRadius(),
    this.showShadow = true,
  });
  final BeThemeData betheme;
  final Widget child;
  final DialogRadius radius;
  final bool showShadow;

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        final breakpoint = calculateBreakpoint(constraints.maxWidth);
        final dialogWidth = switch (breakpoint) {
          BeBreakpoint.xs => MediaQuery.of(context).size.width * 0.9,
          BeBreakpoint.sm => MediaQuery.of(context).size.width * 0.8,
          BeBreakpoint.md => 500.0,
          _ => 600.0, // lg, xl, xl2
        };

        final dialogPadding = switch (breakpoint) {
          BeBreakpoint.xs => const EdgeInsets.all(16.0),
          BeBreakpoint.sm => const EdgeInsets.all(20.0),
          _ => const EdgeInsets.all(24.0),
        };
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: dialogWidth,
                maxHeight: breakpoint.isMobile ? MediaQuery.of(context).size.height * 0.8 : 700.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(radius.getValue(breakpoint)),
                  boxShadow:
                      showShadow
                          ? [
                            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 24.0, offset: const Offset(0, 8)),
                          ]
                          : null,
                ),
                padding: dialogPadding,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

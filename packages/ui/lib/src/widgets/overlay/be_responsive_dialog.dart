import 'package:beui/decoration.dart';
import 'package:beui/screen.dart';
import 'package:beui/src/theme/be_theme.dart';
import 'package:flutter/material.dart';

void showResponsiveDialog<T>({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = true,
  Color barrierColor = Colors.black54,
}) {
  final breakpoint = BeTheme.of(context).breakpoint;

  showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    builder: (context) {
      return ResponsiveDialog(breakpoint: breakpoint, child: child);
    },
  );
}

class ResponsiveDialog extends StatelessWidget {
  const ResponsiveDialog({
    super.key,
    required this.breakpoint,
    required this.child,
  });
  final BeBreakpoint breakpoint;
  final Widget child;

  @override
  Widget build(BuildContext context) {
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
            maxHeight:
                breakpoint.isMobile
                    ? MediaQuery.of(context).size.height * 0.8
                    : 700.0,
          ),
          child: Container(
            margin: p8,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(
                breakpoint.isMobile ? 16.0 : 24.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(100),
                  blurRadius: 24.0,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: dialogPadding,
            child: child,
          ),
        ),
      ),
    );
  }
}

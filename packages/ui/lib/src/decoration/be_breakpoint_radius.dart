import 'package:beui/layout.dart';

class DialogRadius {
  const DialogRadius({this.xs = 12.0, this.sm = 16.0, this.md = 20.0, this.lg = 24.0, this.xl = 28.0, this.xl2 = 32.0});
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xl2;

  double getValue(final BeBreakpoint breakpoint) => switch (breakpoint) {
    BeBreakpoint.xs => xs,
    BeBreakpoint.sm => sm,
    BeBreakpoint.md => md,
    BeBreakpoint.lg => lg,
    BeBreakpoint.xl => xl,
    BeBreakpoint.xl2 => xl2,
  };
}

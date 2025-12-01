import 'package:beui/layout.dart';

class BePanelConstants {
  static const String appBarPanel = 'be_app_bar_panel';
  static const String drawerPanel = 'be_drawer_panel';
  static const String mainPanel = 'be_main_panel';
  static const String sidePanel = 'be_side_panel';
}

//   const BeResponsivePoints({this.sm = 640, this.md = 768, this.lg = 1024, this.xl = 1280, this.xl2 = 1536});
class NavbarPanelWidth {
  const NavbarPanelWidth({
    this.xs = 320.0,
    this.sm = 340.0,
    this.md = 240.0,
    this.lg = 260.0,
    this.xl = 280.0,
    this.xl2 = 360.0,
  });

  const NavbarPanelWidth.all(final double width)
    : xs = width,
      sm = width,
      md = width,
      lg = width,
      xl = width,
      xl2 = width;

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xl2;

  double getWidth(final BeBreakpoint breakpoint) => switch (breakpoint) {
    BeBreakpoint.xs => xs,
    BeBreakpoint.sm => sm,
    BeBreakpoint.md => md,
    BeBreakpoint.lg => lg,
    BeBreakpoint.xl => xl,
    BeBreakpoint.xl2 => xl2,
  };
}

class SidePanelWidth {
  const SidePanelWidth({
    this.xs = 0.0,
    this.sm = 0.0,
    this.md = 250.0,
    this.lg = 300.0,
    this.xl = 350.0,
    this.xl2 = 400.0,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xl2;

  double getWidth(final BeBreakpoint breakpoint) => switch (breakpoint) {
    BeBreakpoint.xs => xs,
    BeBreakpoint.sm => sm,
    BeBreakpoint.md => md,
    BeBreakpoint.lg => lg,
    BeBreakpoint.xl => xl,
    BeBreakpoint.xl2 => xl2,
  };
}

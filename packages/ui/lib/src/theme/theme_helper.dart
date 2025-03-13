import 'package:beui/screen.dart';
import 'package:beui/src/theme/styles/be_desktop_insets.dart';
import 'package:beui/src/theme/styles/be_tablet_insets.dart';
import 'package:beui/theme.dart' show BeInset, BeMobileInset;

BeInset getInsetForBreakpoint(BeBreakpoint? breakpoint) {
  switch (breakpoint) {
    case BeBreakpoint.xs:
    case BeBreakpoint.sm:
      return const BeMobileInset();
    case BeBreakpoint.md:
      return const BeTabletInset();
    case BeBreakpoint.lg:
    case BeBreakpoint.xl:
    case BeBreakpoint.xl2:
      return const BeDesktopInset();
    default:
      return const BeMobileInset();
  }
}

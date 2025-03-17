import 'package:beui/screen.dart';
import 'package:beui/src/theme/be_theme_value.dart';
import 'package:beui/src/theme/styles/be_desktop_insets.dart';
import 'package:beui/src/theme/styles/be_mobile_insets.dart';
import 'package:beui/src/theme/styles/be_tablet_insets.dart';

BeThemeValue getInsetForBreakpoint(BeBreakpoint? breakpoint) {
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

import 'package:beui/src/theme/be_style_value.dart';
import 'package:beui/src/theme/styles/be_mobile_style.dart';
import 'package:beui/src/theme/styles/be_tablet_style.dart';

/// Design System Border Radius Tokens
/// Provides consistent border radius values that scale across device types
class BeBorderRadiusTokens {
  const BeBorderRadiusTokens._();

  /// Get border radius tokens for the current device type
  static BeBorderRadiusValues get(final BeAdaptiveStyle style) {
    if (style is BeMobileValue) {
      return const BeMobileBorderRadius();
    } else if (style is BeTabletValue) {
      return const BeTabletBorderRadius();
    } else {
      return const BeDesktopBorderRadius();
    }
  }
}

/// Abstract border radius values interface
abstract class BeBorderRadiusValues {
  const BeBorderRadiusValues();

  double get borderRadiusSm;
  double get borderRadiusMd;
  double get borderRadiusLg;
  double get borderRadiusCircle;
}

/// Mobile border radius tokens
class BeMobileBorderRadius extends BeBorderRadiusValues {
  const BeMobileBorderRadius();

  @override
  double get borderRadiusSm => 8.0; // Small rounding (Snackbars)
  @override
  double get borderRadiusMd => 12.0; // Medium rounding (buttons, input)
  @override
  double get borderRadiusLg => 16.0; // Large rounding (cards, dialogs)
  @override
  double get borderRadiusCircle => 9999.0; // Circular avatars, FABs
}

/// Tablet border radius tokens
class BeTabletBorderRadius extends BeBorderRadiusValues {
  const BeTabletBorderRadius();

  @override
  double get borderRadiusSm => 10.0; // Small rounding (Snackbars)
  @override
  double get borderRadiusMd => 14.0; // Medium rounding (buttons, input)
  @override
  double get borderRadiusLg => 18.0; // Large rounding (cards, dialogs)
  @override
  double get borderRadiusCircle => 9999.0; // Circular avatars, FABs
}

/// Desktop border radius tokens
class BeDesktopBorderRadius extends BeBorderRadiusValues {
  const BeDesktopBorderRadius();

  @override
  double get borderRadiusSm => 12.0; // Small rounding (Snackbars)
  @override
  double get borderRadiusMd => 16.0; // Medium rounding (buttons, input)
  @override
  double get borderRadiusLg => 20.0; // Large rounding (cards, dialogs)
  @override
  double get borderRadiusCircle => 9999.0; // Circular avatars, FABs
}

import 'package:beui/src/theme/be_style_value.dart';
import 'package:beui/src/theme/styles/be_mobile_style.dart';
import 'package:beui/src/theme/styles/be_tablet_style.dart';

/// Design System Spacing Tokens
/// Provides consistent spacing values that scale across device types
class BeSpacingTokens {
  const BeSpacingTokens._();

  /// Get spacing tokens for the current device type
  static BeSpacingValues get(final BeAdaptiveStyle style) {
    if (style is BeMobileValue) {
      return const BeMobileSpacing();
    } else if (style is BeTabletValue) {
      return const BeTabletSpacing();
    } else {
      return const BeDesktopSpacing();
    }
  }
}

/// Abstract spacing values interface
abstract class BeSpacingValues {
  const BeSpacingValues();

  double get spacingXs;
  double get spacingSm;
  double get spacingMd;
  double get spacingLg;
  double get spacingXl;
}

/// Mobile spacing tokens
class BeMobileSpacing extends BeSpacingValues {
  const BeMobileSpacing();

  @override
  double get spacingXs => 4.0; // Minimal spacing
  @override
  double get spacingSm => 8.0; // Small padding/margin
  @override
  double get spacingMd => 12.0; // Medium padding/margin
  @override
  double get spacingLg => 16.0; // Large padding
  @override
  double get spacingXl => 24.0; // Extra large padding
}

/// Tablet spacing tokens
class BeTabletSpacing extends BeSpacingValues {
  const BeTabletSpacing();

  @override
  double get spacingXs => 6.0; // Minimal spacing
  @override
  double get spacingSm => 12.0; // Small padding/margin
  @override
  double get spacingMd => 16.0; // Medium padding/margin
  @override
  double get spacingLg => 24.0; // Large padding
  @override
  double get spacingXl => 32.0; // Extra large padding
}

/// Desktop spacing tokens
class BeDesktopSpacing extends BeSpacingValues {
  const BeDesktopSpacing();

  @override
  double get spacingXs => 8.0; // Minimal spacing
  @override
  double get spacingSm => 16.0; // Small padding/margin
  @override
  double get spacingMd => 24.0; // Medium padding/margin
  @override
  double get spacingLg => 32.0; // Large padding
  @override
  double get spacingXl => 48.0; // Extra large padding
}

import 'package:beui/src/theme/be_style_value.dart';
import 'package:beui/src/theme/styles/be_mobile_style.dart';
import 'package:beui/src/theme/styles/be_tablet_style.dart';

/// Design System Elevation Tokens
/// Provides consistent elevation values that scale across device types
class BeElevationTokens {
  const BeElevationTokens._();

  /// Get elevation tokens for the current device type
  static BeElevationValues get(final BeAdaptiveStyle style) {
    if (style is BeMobileValue) {
      return const BeMobileElevation();
    } else if (style is BeTabletValue) {
      return const BeTabletElevation();
    } else {
      return const BeDesktopElevation();
    }
  }
}

/// Abstract elevation values interface
abstract class BeElevationValues {
  const BeElevationValues();

  double get elevationLow;
  double get elevationMedium;
  double get elevationHigh;
}

/// Mobile elevation tokens
class BeMobileElevation extends BeElevationValues {
  const BeMobileElevation();

  @override
  double get elevationLow => 2.0; // Soft shadows (low elevation)
  @override
  double get elevationMedium => 4.0; // Cards, Dialogs (medium elevation)
  @override
  double get elevationHigh => 8.0; // Floating elements (high elevation)
}

/// Tablet elevation tokens
class BeTabletElevation extends BeElevationValues {
  const BeTabletElevation();

  @override
  double get elevationLow => 4.0; // Soft shadows (low elevation)
  @override
  double get elevationMedium => 6.0; // Cards, Dialogs (medium elevation)
  @override
  double get elevationHigh => 10.0; // Floating elements (high elevation)
}

/// Desktop elevation tokens
class BeDesktopElevation extends BeElevationValues {
  const BeDesktopElevation();

  @override
  double get elevationLow => 8.0; // Soft shadows (low elevation)
  @override
  double get elevationMedium => 8.0; // Cards, Dialogs (medium elevation)
  @override
  double get elevationHigh => 12.0; // Floating elements (high elevation)
}

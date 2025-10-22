import 'package:beui/src/theme/be_style_value.dart';
import 'package:beui/src/theme/styles/be_mobile_style.dart';
import 'package:beui/src/theme/styles/be_tablet_style.dart';

/// Design System Typography Tokens
/// Provides consistent typography values that scale across device types
class BeTypographyTokens {
  const BeTypographyTokens._();

  /// Get typography tokens for the current device type
  static BeTypographyValues get(final BeAdaptiveStyle style) {
    if (style is BeMobileValue) {
      return const BeMobileTypography();
    } else if (style is BeTabletValue) {
      return const BeTabletTypography();
    } else {
      return const BeDesktopTypography();
    }
  }
}

/// Abstract typography values interface
abstract class BeTypographyValues {
  const BeTypographyValues();

  String get fontFamilyPrimary;
  double get fontSizeBody;
  double get fontSizeButton;
  double get fontSizeLabel;
  double get fontSizeHeadline;
  int get fontWeightRegular;
  int get fontWeightMedium;
  int get fontWeightSemiBold;
}

/// Mobile typography tokens
class BeMobileTypography extends BeTypographyValues {
  const BeMobileTypography();

  @override
  String get fontFamilyPrimary => 'Roboto';
  @override
  double get fontSizeBody => 14.0; // Main text body
  @override
  double get fontSizeButton => 16.0; // Button text
  @override
  double get fontSizeLabel => 14.0; // Input labels, captions
  @override
  double get fontSizeHeadline => 24.0; // Section headlines
  @override
  int get fontWeightRegular => 400; // Regular
  @override
  int get fontWeightMedium => 500; // Medium
  @override
  int get fontWeightSemiBold => 600; // Semi-bold
}

/// Tablet typography tokens
class BeTabletTypography extends BeTypographyValues {
  const BeTabletTypography();

  @override
  String get fontFamilyPrimary => 'Roboto';
  @override
  double get fontSizeBody => 16.0; // Main text body
  @override
  double get fontSizeButton => 18.0; // Button text
  @override
  double get fontSizeLabel => 16.0; // Input labels, captions
  @override
  double get fontSizeHeadline => 28.0; // Section headlines
  @override
  int get fontWeightRegular => 400; // Regular
  @override
  int get fontWeightMedium => 500; // Medium
  @override
  int get fontWeightSemiBold => 600; // Semi-bold
}

/// Desktop typography tokens
class BeDesktopTypography extends BeTypographyValues {
  const BeDesktopTypography();

  @override
  String get fontFamilyPrimary => 'Roboto';
  @override
  double get fontSizeBody => 18.0; // Main text body (16-18 pt)
  @override
  double get fontSizeButton => 20.0; // Button text (18-20 pt)
  @override
  double get fontSizeLabel => 16.0; // Input labels, captions
  @override
  double get fontSizeHeadline => 32.0; // Section headlines
  @override
  int get fontWeightRegular => 400; // Regular
  @override
  int get fontWeightMedium => 500; // Medium
  @override
  int get fontWeightSemiBold => 600; // Semi-bold
}

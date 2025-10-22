import 'package:beui/src/theme/be_style_value.dart';
import 'package:beui/src/theme/styles/be_mobile_style.dart';
import 'package:beui/src/theme/styles/be_tablet_style.dart';

/// Design System Component Tokens
/// Provides consistent component sizing and styling that scales across device types
class BeComponentTokens {
  const BeComponentTokens._();

  /// Get component tokens for the current device type
  static BeComponentValues get(final BeAdaptiveStyle style) {
    if (style is BeMobileValue) {
      return const BeMobileComponent();
    } else if (style is BeTabletValue) {
      return const BeTabletComponent();
    } else {
      return const BeDesktopComponent();
    }
  }
}

/// Abstract component values interface
abstract class BeComponentValues {
  const BeComponentValues();

  // Button tokens
  double get buttonPaddingVertical;
  double get buttonPaddingHorizontal;
  double get buttonFontSize;
  double get buttonBorderRadius;

  // Input tokens
  double get inputPaddingVertical;
  double get inputPaddingHorizontal;
  double get inputBorderRadius;
  double get inputFontSize;

  // Card tokens
  double get cardElevation;
  double get cardBorderRadius;
  double get cardMargin;

  // Dialog tokens
  double get dialogBorderRadius;
  double get dialogTitleFontSize;
  double get dialogContentFontSize;

  // Avatar tokens
  double get avatarRadius;
  double get avatarBorderRadiusRounded;
}

/// Mobile component tokens
class BeMobileComponent extends BeComponentValues {
  const BeMobileComponent();

  // Button tokens
  @override
  double get buttonPaddingVertical => 14.0; // Comfortable touch targets
  @override
  double get buttonPaddingHorizontal => 24.0; // Horizontal padding
  @override
  double get buttonFontSize => 16.0; // Button label font size
  @override
  double get buttonBorderRadius => 12.0; // Rounded corners

  // Input tokens
  @override
  double get inputPaddingVertical => 14.0; // TextField content padding vertically
  @override
  double get inputPaddingHorizontal => 16.0; // TextField content horizontal padding
  @override
  double get inputBorderRadius => 12.0; // TextField rounded corners
  @override
  double get inputFontSize => 14.0; // Input text font size

  // Card tokens
  @override
  double get cardElevation => 4.0; // Card shadows
  @override
  double get cardBorderRadius => 16.0; // Card rounded corners
  @override
  double get cardMargin => 12.0; // Margin around cards

  // Dialog tokens
  @override
  double get dialogBorderRadius => 16.0; // Dialog box corners
  @override
  double get dialogTitleFontSize => 20.0; // Dialog title font size
  @override
  double get dialogContentFontSize => 16.0; // Dialog content font

  // Avatar tokens
  @override
  double get avatarRadius => 24.0; // Standard avatar size (48x48)
  @override
  double get avatarBorderRadiusRounded => 12.0; // Rounded rectangle avatar corner radius
}

/// Tablet component tokens
class BeTabletComponent extends BeComponentValues {
  const BeTabletComponent();

  // Button tokens
  @override
  double get buttonPaddingVertical => 16.0; // Comfortable touch targets
  @override
  double get buttonPaddingHorizontal => 32.0; // Horizontal padding
  @override
  double get buttonFontSize => 18.0; // Button label font size
  @override
  double get buttonBorderRadius => 14.0; // Rounded corners

  // Input tokens
  @override
  double get inputPaddingVertical => 16.0; // TextField content padding vertically
  @override
  double get inputPaddingHorizontal => 20.0; // TextField content horizontal padding
  @override
  double get inputBorderRadius => 14.0; // TextField rounded corners
  @override
  double get inputFontSize => 16.0; // Input text font size

  // Card tokens
  @override
  double get cardElevation => 6.0; // Card shadows
  @override
  double get cardBorderRadius => 18.0; // Card rounded corners
  @override
  double get cardMargin => 16.0; // Margin around cards

  // Dialog tokens
  @override
  double get dialogBorderRadius => 18.0; // Dialog box corners
  @override
  double get dialogTitleFontSize => 22.0; // Dialog title font size
  @override
  double get dialogContentFontSize => 18.0; // Dialog content font

  // Avatar tokens
  @override
  double get avatarRadius => 32.0; // Standard avatar size (64x64)
  @override
  double get avatarBorderRadiusRounded => 14.0; // Rounded rectangle avatar corner radius
}

/// Desktop component tokens
class BeDesktopComponent extends BeComponentValues {
  const BeDesktopComponent();

  // Button tokens
  @override
  double get buttonPaddingVertical => 18.0; // Comfortable touch targets
  @override
  double get buttonPaddingHorizontal => 40.0; // Horizontal padding
  @override
  double get buttonFontSize => 20.0; // Button label font size (18-20 pt)
  @override
  double get buttonBorderRadius => 16.0; // Rounded corners

  // Input tokens
  @override
  double get inputPaddingVertical => 18.0; // TextField content padding vertically
  @override
  double get inputPaddingHorizontal => 24.0; // TextField content horizontal padding
  @override
  double get inputBorderRadius => 16.0; // TextField rounded corners
  @override
  double get inputFontSize => 16.0; // Input text font size

  // Card tokens
  @override
  double get cardElevation => 8.0; // Card shadows
  @override
  double get cardBorderRadius => 20.0; // Card rounded corners
  @override
  double get cardMargin => 24.0; // Margin around cards

  // Dialog tokens
  @override
  double get dialogBorderRadius => 20.0; // Dialog box corners
  @override
  double get dialogTitleFontSize => 28.0; // Dialog title font size (24-28 pt)
  @override
  double get dialogContentFontSize => 18.0; // Dialog content font

  // Avatar tokens
  @override
  double get avatarRadius => 40.0; // Standard avatar size (80x80)
  @override
  double get avatarBorderRadiusRounded => 16.0; // Rounded rectangle avatar corner radius
}

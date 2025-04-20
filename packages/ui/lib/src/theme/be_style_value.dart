/// BeInsets should build responsive padding and margin based on device type of screen size
/// Yet to be developed based on design system
///
abstract class BeStyleValue {
  // Display
  double get displayLargeTextSize;
  double get displayLargeLineHeight;
  double get displayMediumTextSize;
  double get displayMediumLineHeight;
  double get displaySmallTextSize;
  double get displaySmallLineHeight;

  // Headline
  double get headlineLargeTextSize;
  double get headlineLargeLineHeight;
  double get headlineMediumTextSize;
  double get headlineMediumLineHeight;
  double get headlineSmallTextSize;
  double get headlineSmallLineHeight;

  // Title
  double get titleLargeTextSize;
  double get titleLargeLineHeight;
  double get titleMediumTextSize;
  double get titleMediumLineHeight;
  double get titleSmallTextSize;
  double get titleSmallLineHeight;

  // Body
  double get bodyLargeTextSize;
  double get bodyLargeLineHeight;
  double get bodyMediumTextSize;
  double get bodyMediumLineHeight;
  double get bodySmallTextSize;
  double get bodySmallLineHeight;

  // Label
  double get labelLargeTextSize;
  double get labelLargeLineHeight;
  double get labelMediumTextSize;
  double get labelMediumLineHeight;
  double get labelSmallTextSize;
  double get labelSmallLineHeight;

  // Notification
  double get notificationMaxWidth;
  double get notificationMaxCount;
}

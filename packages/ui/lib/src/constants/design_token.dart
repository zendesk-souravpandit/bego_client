import 'package:flutter/material.dart';

/// BeUI Design Tokens for consistent design system
class BeDesignToken {
  const BeDesignToken._();

  // ========== Motion Tokens ==========

  /// Quick motion for micro-interactions (100ms)
  static const Duration motionQuick = Duration(milliseconds: 100);

  /// Standard motion for most transitions (300ms)
  static const Duration motionStandard = Duration(milliseconds: 300);

  /// Emphasized motion for important state changes (500ms)
  static const Duration motionEmphasized = Duration(milliseconds: 500);

  /// Extended motion for complex animations (700ms)
  static const Duration motionExtended = Duration(milliseconds: 700);

  // ========== Curve Tokens ==========

  /// Standard curve for most animations
  static const Curve curveStandard = Curves.easeInOut;

  /// Emphasized curve for important transitions
  static const Curve curveEmphasized = Curves.easeInOutCubic;

  /// Quick curve for micro-interactions
  static const Curve curveQuick = Curves.easeOut;

  /// Slow curve for deliberate animations
  static const Curve curveSlow = Curves.easeInOutQuart;

  // ========== Interaction State Tokens ==========

  /// Opacity for hover states
  static const double hoverOpacity = 0.08;

  /// Opacity for pressed states
  static const double pressedOpacity = 0.12;

  /// Opacity for focused states
  static const double focusedOpacity = 0.12;

  /// Opacity for disabled states
  static const double disabledOpacity = 0.38;

  // ========== Spacing Tokens ==========

  /// Extra small spacing (4px)
  static const double spacingXs = 4.0;

  /// Small spacing (8px)
  static const double spacingSm = 8.0;

  /// Medium spacing (16px)
  static const double spacingMd = 16.0;

  /// Large spacing (24px)
  static const double spacingLg = 24.0;

  /// Extra large spacing (32px)
  static const double spacingXl = 32.0;

  // ========== Border Radius Tokens ==========

  /// Small border radius (4px)
  static const double radiusSmall = 4.0;

  /// Medium border radius (8px)
  static const double radiusMedium = 8.0;

  /// Large border radius (12px)
  static const double radiusLarge = 12.0;

  /// Extra large border radius (16px)
  static const double radiusExtraLarge = 16.0;

  // ========== Elevation Tokens ==========

  /// Level 0 elevation (0dp)
  static const double elevation0 = 0.0;

  /// Level 1 elevation (1dp)
  static const double elevation1 = 1.0;

  /// Level 2 elevation (3dp)
  static const double elevation2 = 3.0;

  /// Level 3 elevation (6dp)
  static const double elevation3 = 6.0;

  /// Level 4 elevation (8dp)
  static const double elevation4 = 8.0;

  /// Level 5 elevation (12dp)
  static const double elevation5 = 12.0;
}

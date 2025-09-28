import 'package:flutter/material.dart';

abstract class BeColor {
  // Core properties
  bool get isDark;

  // Primary Color System
  Color get primary;
  Color get primaryDark;
  Color get primaryLight;
  Color get primaryContainer;
  Color get primaryFixed;
  Color get primaryFixedDim;
  Color get onPrimary;
  Color get onPrimaryContainer;
  Color get onPrimaryFixed;
  Color get onPrimaryFixedVariant;

  // Secondary Color System
  Color get secondary;
  Color get secondaryDark;
  Color get secondaryLight;
  Color get secondaryContainer;
  Color get onSecondary;
  Color get onSecondaryContainer;

  // Tertiary Color System
  Color get tertiary;
  Color get tertiaryDark;
  Color get tertiaryLight;
  Color get tertiaryContainer;
  Color get onTertiary;
  Color get onTertiaryContainer;

  // Semantic Colors
  Color get success;
  Color get successDark;
  Color get successLight;
  Color get successContainer;
  Color get onSuccess;
  Color get onSuccessContainer;

  Color get error;
  Color get errorDark;
  Color get errorLight;
  Color get errorContainer;
  Color get onError;
  Color get onErrorContainer;

  Color get warning;
  Color get warningDark;
  Color get warningLight;
  Color get warningContainer;
  Color get onWarning;
  Color get onWarningContainer;

  Color get info;
  Color get infoDark;
  Color get infoLight;
  Color get infoContainer;
  Color get onInfo;
  Color get onInfoContainer;

  // Neutral System (Tailwind-inspired)
  Color get neutral10;
  Color get neutral20;
  Color get neutral30;
  Color get neutral40;
  Color get neutral50;
  Color get neutral60;
  Color get neutral80;
  Color get neutral90;
  Color get neutral95;
  Color get neutral99;

  // Neutral Variant System
  Color get neutralVariant30;
  Color get neutralVariant50;
  Color get neutralVariant80;
  Color get neutralVariant90;

  // Surface System
  Color get surface;
  Color get surfaceDim;
  Color get surfaceBright;
  Color get surfaceContainer;
  Color get surfaceContainerHigh;
  Color get surfaceContainerHighest;
  Color get surfaceContainerLow;
  Color get surfaceContainerLowest;
  Color get surfaceVariant;
  Color get onSurface;
  Color get onSurfaceVariant;

  // Background (legacy support)
  Color get background;

  // Text Colors (computed from neutral system)
  Color get textPrimary;
  Color get textSecondary;

  // Icon Colors
  Color get icon;

  // Outline System
  Color get outline;
  Color get outlineVariant;

  // Form-specific colors
  Color get formFillColor;

  // Disabled state
  Color get disabled;
}

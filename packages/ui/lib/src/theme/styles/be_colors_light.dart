import 'package:beui/src/theme/be_color.dart';
import 'package:beui/src/theme/colors/be_colors.dart';
import 'package:flutter/material.dart';

class BeColorsLight implements BeColor {
  const BeColorsLight();

  @override
  bool get isDark => false;

  // Primary Color System
  @override
  Color get primary => BeColors.primary;
  @override
  Color get primaryDark => BeColors.primaryDark;
  @override
  Color get primaryLight => BeColors.primaryLight;
  @override
  Color get primaryContainer => BeColors.primaryContainer;
  @override
  Color get primaryFixed => BeColors.primaryFixed;
  @override
  Color get primaryFixedDim => BeColors.primaryFixedDim;
  @override
  Color get onPrimary => BeColors.onPrimary;
  @override
  Color get onPrimaryContainer => BeColors.onPrimaryContainer;
  @override
  Color get onPrimaryFixed => BeColors.onPrimaryFixed;
  @override
  Color get onPrimaryFixedVariant => BeColors.onPrimaryFixedVariant;

  // Secondary Color System
  @override
  Color get secondary => BeColors.secondary;
  @override
  Color get secondaryDark => BeColors.secondaryDark;
  @override
  Color get secondaryLight => BeColors.secondaryLight;
  @override
  Color get secondaryContainer => BeColors.secondaryContainer;
  @override
  Color get onSecondary => BeColors.onSecondary;
  @override
  Color get onSecondaryContainer => BeColors.onSecondaryContainer;

  // Tertiary Color System
  @override
  Color get tertiary => BeColors.tertiary;
  @override
  Color get tertiaryDark => BeColors.tertiaryDark;
  @override
  Color get tertiaryLight => BeColors.tertiaryLight;
  @override
  Color get tertiaryContainer => BeColors.tertiaryContainer;
  @override
  Color get onTertiary => BeColors.onTertiary;
  @override
  Color get onTertiaryContainer => BeColors.onTertiaryContainer;

  // Semantic Colors
  @override
  Color get success => BeColors.success;
  @override
  Color get successDark => BeColors.successDark;
  @override
  Color get successLight => BeColors.successLight;
  @override
  Color get successContainer => BeColors.successContainer;
  @override
  Color get onSuccess => BeColors.onSuccess;
  @override
  Color get onSuccessContainer => BeColors.onSuccessContainer;

  @override
  Color get error => BeColors.error;
  @override
  Color get errorDark => BeColors.errorDark;
  @override
  Color get errorLight => BeColors.errorLight;
  @override
  Color get errorContainer => BeColors.errorContainer;
  @override
  Color get onError => BeColors.onError;
  @override
  Color get onErrorContainer => BeColors.onErrorContainer;

  @override
  Color get warning => BeColors.warning;
  @override
  Color get warningDark => BeColors.warningDark;
  @override
  Color get warningLight => BeColors.warningLight;
  @override
  Color get warningContainer => BeColors.warningContainer;
  @override
  Color get onWarning => BeColors.onWarning;
  @override
  Color get onWarningContainer => BeColors.onWarningContainer;

  @override
  Color get info => BeColors.info;
  @override
  Color get infoDark => BeColors.infoDark;
  @override
  Color get infoLight => BeColors.infoLight;
  @override
  Color get infoContainer => BeColors.infoContainer;
  @override
  Color get onInfo => BeColors.onInfo;
  @override
  Color get onInfoContainer => BeColors.onInfoContainer;

  // Neutral System
  @override
  Color get neutral10 => BeColors.neutral10;
  @override
  Color get neutral20 => BeColors.neutral20;
  @override
  Color get neutral30 => BeColors.neutral30;
  @override
  Color get neutral40 => BeColors.neutral40;
  @override
  Color get neutral50 => BeColors.neutral50;
  @override
  Color get neutral60 => BeColors.neutral60;
  @override
  Color get neutral80 => BeColors.neutral80;
  @override
  Color get neutral90 => BeColors.neutral90;
  @override
  Color get neutral95 => BeColors.neutral95;
  @override
  Color get neutral99 => BeColors.neutral99;

  // Neutral Variant System
  @override
  Color get neutralVariant30 => BeColors.neutralVariant30;
  @override
  Color get neutralVariant50 => BeColors.neutralVariant50;
  @override
  Color get neutralVariant80 => BeColors.neutralVariant80;
  @override
  Color get neutralVariant90 => BeColors.neutralVariant90;

  // Surface System
  @override
  Color get surface => BeColors.surface;
  @override
  Color get surfaceDim => BeColors.surfaceDim;
  @override
  Color get surfaceBright => BeColors.surfaceBright;
  @override
  Color get surfaceContainer => BeColors.surfaceContainer;
  @override
  Color get surfaceContainerHigh => BeColors.surfaceContainerHigh;
  @override
  Color get surfaceContainerHighest => BeColors.surfaceContainerHighest;
  @override
  Color get surfaceContainerLow => BeColors.surfaceContainerLow;
  @override
  Color get surfaceContainerLowest => BeColors.surfaceContainerLowest;
  @override
  Color get surfaceVariant => BeColors.surfaceVariant;
  @override
  Color get onSurface => BeColors.onSurface;
  @override
  Color get onSurfaceVariant => BeColors.onSurfaceVariant;

  // Legacy support
  @override
  Color get background => surface;

  // Text Colors (computed from neutral system)
  @override
  Color get textPrimary => BeColors.textPrimary; // Design system primary text
  @override
  Color get textSecondary => BeColors.textSecondary; // Design system secondary text

  // Icon Colors
  @override
  Color get icon => BeColors.onSurfaceVariant;

  // Outline System
  @override
  Color get outline => BeColors.outline;
  @override
  Color get outlineVariant => BeColors.outlineVariant;

  // Form-specific colors
  @override
  Color get formFillColor => surfaceContainerLowest; // Pure white for form backgrounds

  // Disabled state
  @override
  Color get disabled => BeColors.disabledColor;
}

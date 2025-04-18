import 'package:beui/screen.dart' show BeBreakpoint, BeResponsivePoints;
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required String appName,
    required String packageName,
    required String version,
    required String? deviceId,
    required double screenWidth,
    @Default(ThemeMode.light) ThemeMode themeMode,
    @Default(Locale('en', 'US')) Locale locale,
    @Default(BeBreakpoint.md) BeBreakpoint breakpoint,
    @Default(
      BeThemeData(styleValue: BeMobileValues(), breakpoint: BeBreakpoint.md),
    )
    BeThemeData bethemeData,
    @Default(BeResponsivePoints()) BeResponsivePoints responsivePoints,
    // @Default(BeColorsLight()) BeColor color,
    // @Default(BeStyleLight()) BeStyle style,
    // @Default(BeMobileInset()) BeInset inset,
    // Add other state properties here
  }) = _AppState;

  factory AppState.initial() => const AppState(
    appName: 'Bego App reload',
    packageName: 'com.example.bego',
    version: '1.0.0',
    screenWidth: 768,
    deviceId: null,
    // Initialize other state properties here
  );
}

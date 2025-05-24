import 'package:beui/layout.dart' show BeBreakpoint, BeResponsivePoints;
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

const _defaultTheme = BeThemeData(styleValue: BeMobileValue(), breakpoint: BeBreakpoint.md);

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required String name,
    required String package,
    required String version,
    required String? deviceId,
    required double screenWidth,
    @Default(ThemeMode.light) ThemeMode themeMode,
    @Default(Locale('en', 'US')) Locale locale,
    @Default(BeBreakpoint.md) BeBreakpoint breakpoint,
    @Default(_defaultTheme) BeThemeData bethemeData,
    @Default(BeResponsivePoints()) BeResponsivePoints responsivePoints,
  }) = _AppState;

  factory AppState.initial() => const AppState(
    name: 'Bego App reload',
    package: 'com.example.bego',
    version: '1.0.0',
    screenWidth: 768,
    deviceId: null,
  );
}

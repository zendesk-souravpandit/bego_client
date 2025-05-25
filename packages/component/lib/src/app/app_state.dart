import 'package:beui/layout.dart' show BeBreakpoint, BeResponsivePoints;
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required final String name,
    required final String package,
    required final String version,
    required final String? deviceId,
    required final double screenWidth,
    @Default(ThemeMode.light) final ThemeMode themeMode,
    @Default(Locale('en', 'US')) final Locale locale,
    @Default(BeBreakpoint.md) final BeBreakpoint breakpoint,
    @Default(BeThemeData()) final BeThemeData bethemeData,
    @Default(BeResponsivePoints()) final BeResponsivePoints responsivePoints,
  }) = _AppState;

  factory AppState.initial() => const AppState(
    name: 'Bego App reload',
    package: 'com.example.bego',
    version: '1.0.0',
    screenWidth: 768,
    deviceId: null,
  );
}

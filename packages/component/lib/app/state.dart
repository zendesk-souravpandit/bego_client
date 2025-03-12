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
    required ThemeMode themeMode,
    required Locale locale,
    // Add other state properties here
  }) = _AppState;

  factory AppState.initial() => const AppState(
    themeMode: ThemeMode.system,
    locale: Locale('en', 'US'),
    appName: 'Bego App reload',
    packageName: 'com.example.bego',
    version: '1.0.0',
    deviceId: null,
    // Initialize other state properties here
  );
}

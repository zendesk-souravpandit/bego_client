import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required final String appName,
    required final String package,
    required final String version,
    required final String? deviceId,
    required final String? appLocale,
    required final String? appTheme,
  }) = _AppState;

  factory AppState.initial() => const AppState(
    appName: 'Bego App reload',
    package: 'com.example.bego',
    version: '0.0.1',
    deviceId: null,
    appLocale: null,
    appTheme: null,
  );

  factory AppState.fromJson(final Map<String, dynamic> json) => _$AppStateFromJson(json);
}

import 'package:becomponent/src/app/app_info.dart';
import 'package:becore/modal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required final AppInfo appInfo,
    required final String? deviceId,
    @KeyValueSSConverter() required final KeyValueSS? locale,
    required final String? theme,
  }) = _AppState;

  factory AppState.initial() => AppState(
    appInfo: const AppInfo(
      appName: 'Business Ocean (Bego)',
      packageName: 'com.example.bego',
      version: '0.0.1',
      buildNumber: '1',
      buildSignature: null,
      installerStore: null,
    ),
    deviceId: null,
    locale: KeyValueSS(key: 'ja_JP', value: 'Japanese (JP)'),
    theme: 'light',
  );

  factory AppState.fromJson(final Map<String, dynamic> json) => _$AppStateFromJson(json);
}

import 'package:becore/modal.dart';
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
    @KeyValueSSConverter() required final KeyValueSS? locale,
    required final String? theme,
  }) = _AppState;

  factory AppState.initial() => AppState(
    appName: 'Business Ocean (Bego)',
    package: 'com.example.bego',
    version: '0.0.1',
    deviceId: null,
    locale: KeyValueSS(key: 'en_IN', value: 'English (IN)'),
    theme: 'light',
  );

  factory AppState.fromJson(final Map<String, dynamic> json) => _$AppStateFromJson(json);
}

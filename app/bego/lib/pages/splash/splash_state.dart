import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';
part 'splash_state.g.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState({
    required final bool isInitialized,
    required final bool isAuthenticated,
  }) = _SplashState;

  factory SplashState.initial() =>
      const SplashState(isInitialized: false, isAuthenticated: false);

  factory SplashState.fromJson(Map<String, dynamic> json) =>
      _$SplashStateFromJson(json);
}

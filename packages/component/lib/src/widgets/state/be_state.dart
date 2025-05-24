import 'package:freezed_annotation/freezed_annotation.dart';

part 'be_state.freezed.dart';

/// @freezed
/// ```
/// sealed class BeCounterPageState with _$BeCounterPageState, BePageState {
///   BeCounterPageState._();
///   const factory BeCounterPageState.initial({
///     @Default(BeStatus.empty()) BeStatus status,
///   }) = _Initial;
///   const factory BeCounterPageState.loaded({
///     required int counter,
///     @Default(BeStatus.success()) BeStatus status,
///   }) = _Loaded;
/// }
/// ```
mixin BeState {
  BeStatus get status;

  bool get isLoading => status is _BeStatusLoading;
  bool get hasError => status is _BeStatusError;
}

@freezed
sealed class BeStatus with _$BeStatus {
  const factory BeStatus.empty() = _BeStatusEmpty;
  const factory BeStatus.loading() = _BeStatusLoading;
  const factory BeStatus.error({required final String title, required final String description}) = _BeStatusError;
  const factory BeStatus.success({@Default('') final String title, @Default('') final String description}) = _BeStatusSuccess;
}

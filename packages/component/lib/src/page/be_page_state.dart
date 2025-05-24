import 'package:freezed_annotation/freezed_annotation.dart';

part 'be_page_state.freezed.dart';

/// @freezed
/// ```
/// sealed class BeCounterPageState with _$BeCounterPageState, BePageState {
///   BeCounterPageState._();
///   const factory BeCounterPageState.initial({
///     @Default(BePageStatus.empty()) BePageStatus status,
///   }) = _Initial;
///   const factory BeCounterPageState.loaded({
///     required int counter,
///     @Default(BePageStatus.success()) BePageStatus status,
///   }) = _Loaded;
/// }
/// ```
mixin BePageState {
  BePageStatus get status;

  bool get isLoading => status is BePageStatusLoading;
  bool get hasError => status is BePageStatusError;
}

@freezed
sealed class BePageStatus with _$BePageStatus {
  const factory BePageStatus.empty() = BePageStatusEmpty;
  const factory BePageStatus.loading() = BePageStatusLoading;
  const factory BePageStatus.error({required final String title, required final String description}) = BePageStatusError;
  const factory BePageStatus.success({@Default('') final String title, @Default('') final String description}) =
      BePageStatusSuccess;
}

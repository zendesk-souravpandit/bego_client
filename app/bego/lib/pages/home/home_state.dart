import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required final List<String> categories,
    required final bool isLoading,
    required final String? errorMessage,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    categories: [
      'Decoration',
      'Venue',
      'Rent Car',
      'Parlour',
      'Chef',
      'Photography',
      'Music Band',
      'Catering',
    ],
    isLoading: false,
    errorMessage: null,
  );

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}

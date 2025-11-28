import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.freezed.dart';
part 'categories_state.g.dart';

@freezed
abstract class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    required final String category,
    required final List<String> items,
    required final bool isLoading,
    required final String? errorMessage,
  }) = _CategoriesState;

  factory CategoriesState.initial({final String category = 'Decoration'}) =>
      CategoriesState(
        category: category,
        items: ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6'],
        isLoading: false,
        errorMessage: null,
      );

  factory CategoriesState.fromJson(Map<String, dynamic> json) =>
      _$CategoriesStateFromJson(json);
}

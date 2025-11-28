import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_details_state.freezed.dart';
part 'category_details_state.g.dart';

@freezed
abstract class CategoryDetailsState with _$CategoryDetailsState {
  const factory CategoryDetailsState({
    required final String category,
    required final String itemId,
    required final String itemName,
    required final double price,
    required final String description,
    required final double rating,
    required final int quantity,
    required final bool isLoading,
    required final String? errorMessage,
  }) = _CategoryDetailsState;

  factory CategoryDetailsState.initial({
    required final String category,
    required final String itemId,
  }) => CategoryDetailsState(
    category: category,
    itemId: itemId,
    itemName: 'Premium Service',
    price: 15000.0,
    description:
        'Professional and high-quality service to make your event memorable.',
    rating: 4.5,
    quantity: 1,
    isLoading: false,
    errorMessage: null,
  );

  factory CategoryDetailsState.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailsStateFromJson(json);
}

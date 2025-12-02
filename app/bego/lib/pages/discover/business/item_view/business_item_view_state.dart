import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_item_view_state.freezed.dart';
part 'business_item_view_state.g.dart';

@freezed
abstract class BusinessItemViewState with _$BusinessItemViewState {
  const factory BusinessItemViewState({
    required String itemId,
    required String itemName,
    required String itemDescription,
    required double itemPrice,
    @Default('') String itemImage,
    @Default({}) Map<String, dynamic> itemDetails,
    @Default(false) bool isLoading,
  }) = _BusinessItemViewState;

  const BusinessItemViewState._();

  factory BusinessItemViewState.fromJson(final Map<String, dynamic> json) =>
      _$BusinessItemViewStateFromJson(json);

  factory BusinessItemViewState.initial({required final String itemId}) {
    return BusinessItemViewState(
      itemId: itemId,
      itemName: 'Item $itemId',
      itemDescription: 'Item description',
      itemPrice: 0.0,
      itemImage: '',
      itemDetails: {},
      isLoading: false,
    );
  }
}

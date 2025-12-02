import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_item_state.freezed.dart';
part 'edit_item_state.g.dart';

@freezed
abstract class EditItemState with _$EditItemState {
  const factory EditItemState({
    required String tenantId,
    required String businessId,
    required String itemId,
    @Default('') String itemName,
    @Default('') String itemDescription,
    @Default(0.0) double itemPrice,
    @Default({}) Map<String, dynamic> itemDetails,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
  }) = _EditItemState;

  const EditItemState._();

  factory EditItemState.fromJson(final Map<String, dynamic> json) =>
      _$EditItemStateFromJson(json);

  factory EditItemState.initial({
    required final String tenantId,
    required final String businessId,
    required final String itemId,
  }) {
    return EditItemState(
      tenantId: tenantId,
      businessId: businessId,
      itemId: itemId,
      itemName: 'Item $itemId',
      itemDescription: '',
      itemPrice: 0.0,
      itemDetails: {},
      isLoading: false,
      isSaving: false,
    );
  }
}

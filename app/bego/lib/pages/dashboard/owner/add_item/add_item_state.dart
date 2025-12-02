import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_item_state.freezed.dart';
part 'add_item_state.g.dart';

@freezed
abstract class AddItemState with _$AddItemState {
  const factory AddItemState({
    required String tenantId,
    required String businessId,
    @Default('') String itemName,
    @Default('') String itemDescription,
    @Default(0.0) double itemPrice,
    @Default({}) Map<String, dynamic> itemDetails,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
  }) = _AddItemState;

  const AddItemState._();

  factory AddItemState.fromJson(final Map<String, dynamic> json) =>
      _$AddItemStateFromJson(json);

  factory AddItemState.initial({
    required final String tenantId,
    required final String businessId,
  }) {
    return AddItemState(
      tenantId: tenantId,
      businessId: businessId,
      itemName: '',
      itemDescription: '',
      itemPrice: 0.0,
      itemDetails: {},
      isLoading: false,
      isSaving: false,
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_business_state.freezed.dart';
part 'edit_business_state.g.dart';

@freezed
abstract class EditBusinessState with _$EditBusinessState {
  const factory EditBusinessState({
    required String tenantId,
    required String businessId,
    @Default('') String businessName,
    @Default('') String businessDescription,
    @Default({}) Map<String, dynamic> businessDetails,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
  }) = _EditBusinessState;

  const EditBusinessState._();

  factory EditBusinessState.fromJson(final Map<String, dynamic> json) =>
      _$EditBusinessStateFromJson(json);

  factory EditBusinessState.initial({
    required final String tenantId,
    required final String businessId,
  }) {
    return EditBusinessState(
      tenantId: tenantId,
      businessId: businessId,
      businessName: 'Business $businessId',
      businessDescription: '',
      businessDetails: {},
      isLoading: false,
      isSaving: false,
    );
  }
}

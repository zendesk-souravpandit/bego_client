import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_owner_state.freezed.dart';
part 'business_owner_state.g.dart';

@freezed
abstract class BusinessOwnerState with _$BusinessOwnerState {
  const factory BusinessOwnerState({
    required String tenantId,
    required String businessId,
    @Default('') String name,
    @Default('') String description,
  }) = _BusinessOwnerState;

  factory BusinessOwnerState.initial({
    required String tenantId,
    required String businessId,
  }) => BusinessOwnerState(
    tenantId: tenantId,
    businessId: businessId,
    name: businessId,
    description: 'Business Description',
  );

  factory BusinessOwnerState.fromJson(Map<String, dynamic> json) =>
      _$BusinessOwnerStateFromJson(json);
}

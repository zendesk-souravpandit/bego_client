import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_view_state.freezed.dart';
part 'business_view_state.g.dart';

@freezed
abstract class BusinessViewState with _$BusinessViewState {
  const factory BusinessViewState({
    required String tenantId,
    required String businessId,
    @Default([]) List<String> services,
  }) = _BusinessViewState;

  factory BusinessViewState.initial({
    required String tenantId,
    required String businessId,
  }) => BusinessViewState(
    tenantId: tenantId,
    businessId: businessId,
    services: ['Service-1', 'Service-2', 'Service-3'],
  );

  factory BusinessViewState.fromJson(Map<String, dynamic> json) =>
      _$BusinessViewStateFromJson(json);
}

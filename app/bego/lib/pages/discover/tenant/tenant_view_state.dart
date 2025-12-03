import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_view_state.freezed.dart';
part 'tenant_view_state.g.dart';

@freezed
abstract class TenantViewState with _$TenantViewState {
  const factory TenantViewState({
    @Default('') String tenantId,
    @Default([]) List<String> businesses,
  }) = _TenantViewState;

  factory TenantViewState.initial(final String tenantId) => TenantViewState(
    tenantId: tenantId,
    businesses: ['Business-A', 'Business-B', 'Business-C'],
  );

  factory TenantViewState.fromJson(Map<String, dynamic> json) =>
      _$TenantViewStateFromJson(json);
}

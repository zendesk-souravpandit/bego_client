import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';
part 'dashboard_state.g.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    required String tenantId,
    @Default([]) List<String> businesses,
  }) = _DashboardState;

  factory DashboardState.initial({required String tenantId}) => DashboardState(
    tenantId: tenantId,
    businesses: ['Business-1', 'Business-2', 'Business-3'],
  );

  factory DashboardState.fromJson(Map<String, dynamic> json) =>
      _$DashboardStateFromJson(json);
}

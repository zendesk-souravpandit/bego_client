import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_state.freezed.dart';
part 'discover_state.g.dart';

@freezed
abstract class DiscoverState with _$DiscoverState {
  const factory DiscoverState({@Default([]) List<String> tenants}) =
      _DiscoverState;

  factory DiscoverState.initial() =>
      const DiscoverState(tenants: ['Tenant-1', 'Tenant-2', 'Tenant-3']);

  factory DiscoverState.fromJson(Map<String, dynamic> json) =>
      _$DiscoverStateFromJson(json);
}

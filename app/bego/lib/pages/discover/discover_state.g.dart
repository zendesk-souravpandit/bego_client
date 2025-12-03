// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiscoverState _$DiscoverStateFromJson(Map<String, dynamic> json) =>
    _DiscoverState(
      tenants:
          (json['tenants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DiscoverStateToJson(_DiscoverState instance) =>
    <String, dynamic>{'tenants': instance.tenants};

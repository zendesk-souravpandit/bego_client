// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_view_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantViewState _$TenantViewStateFromJson(Map<String, dynamic> json) =>
    _TenantViewState(
      tenantId: json['tenantId'] as String? ?? '',
      businesses:
          (json['businesses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TenantViewStateToJson(_TenantViewState instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'businesses': instance.businesses,
    };

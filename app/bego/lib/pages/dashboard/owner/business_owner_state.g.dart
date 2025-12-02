// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_owner_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessOwnerState _$BusinessOwnerStateFromJson(Map<String, dynamic> json) =>
    _BusinessOwnerState(
      tenantId: json['tenantId'] as String,
      businessId: json['businessId'] as String,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$BusinessOwnerStateToJson(_BusinessOwnerState instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'businessId': instance.businessId,
      'name': instance.name,
      'description': instance.description,
    };

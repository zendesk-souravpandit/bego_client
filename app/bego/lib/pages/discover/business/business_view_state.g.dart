// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_view_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessViewState _$BusinessViewStateFromJson(Map<String, dynamic> json) =>
    _BusinessViewState(
      tenantId: json['tenantId'] as String,
      businessId: json['businessId'] as String,
      services:
          (json['services'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BusinessViewStateToJson(_BusinessViewState instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'businessId': instance.businessId,
      'services': instance.services,
    };

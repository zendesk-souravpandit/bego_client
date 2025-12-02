// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_business_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EditBusinessState _$EditBusinessStateFromJson(Map<String, dynamic> json) =>
    _EditBusinessState(
      tenantId: json['tenantId'] as String,
      businessId: json['businessId'] as String,
      businessName: json['businessName'] as String? ?? '',
      businessDescription: json['businessDescription'] as String? ?? '',
      businessDetails:
          json['businessDetails'] as Map<String, dynamic>? ?? const {},
      isLoading: json['isLoading'] as bool? ?? false,
      isSaving: json['isSaving'] as bool? ?? false,
    );

Map<String, dynamic> _$EditBusinessStateToJson(_EditBusinessState instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'businessId': instance.businessId,
      'businessName': instance.businessName,
      'businessDescription': instance.businessDescription,
      'businessDetails': instance.businessDetails,
      'isLoading': instance.isLoading,
      'isSaving': instance.isSaving,
    };

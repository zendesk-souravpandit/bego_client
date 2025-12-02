// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_item_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddItemState _$AddItemStateFromJson(Map<String, dynamic> json) =>
    _AddItemState(
      tenantId: json['tenantId'] as String,
      businessId: json['businessId'] as String,
      itemName: json['itemName'] as String? ?? '',
      itemDescription: json['itemDescription'] as String? ?? '',
      itemPrice: (json['itemPrice'] as num?)?.toDouble() ?? 0.0,
      itemDetails: json['itemDetails'] as Map<String, dynamic>? ?? const {},
      isLoading: json['isLoading'] as bool? ?? false,
      isSaving: json['isSaving'] as bool? ?? false,
    );

Map<String, dynamic> _$AddItemStateToJson(_AddItemState instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'businessId': instance.businessId,
      'itemName': instance.itemName,
      'itemDescription': instance.itemDescription,
      'itemPrice': instance.itemPrice,
      'itemDetails': instance.itemDetails,
      'isLoading': instance.isLoading,
      'isSaving': instance.isSaving,
    };

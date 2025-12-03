// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_item_view_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessItemViewState _$BusinessItemViewStateFromJson(
  Map<String, dynamic> json,
) => _BusinessItemViewState(
  itemId: json['itemId'] as String,
  itemName: json['itemName'] as String,
  itemDescription: json['itemDescription'] as String,
  itemPrice: (json['itemPrice'] as num).toDouble(),
  itemImage: json['itemImage'] as String? ?? '',
  itemDetails: json['itemDetails'] as Map<String, dynamic>? ?? const {},
  isLoading: json['isLoading'] as bool? ?? false,
);

Map<String, dynamic> _$BusinessItemViewStateToJson(
  _BusinessItemViewState instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'itemName': instance.itemName,
  'itemDescription': instance.itemDescription,
  'itemPrice': instance.itemPrice,
  'itemImage': instance.itemImage,
  'itemDetails': instance.itemDetails,
  'isLoading': instance.isLoading,
};

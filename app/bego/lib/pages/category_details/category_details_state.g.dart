// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_details_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryDetailsState _$CategoryDetailsStateFromJson(
  Map<String, dynamic> json,
) => _CategoryDetailsState(
  category: json['category'] as String,
  itemId: json['itemId'] as String,
  itemName: json['itemName'] as String,
  price: (json['price'] as num).toDouble(),
  description: json['description'] as String,
  rating: (json['rating'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  isLoading: json['isLoading'] as bool,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$CategoryDetailsStateToJson(
  _CategoryDetailsState instance,
) => <String, dynamic>{
  'category': instance.category,
  'itemId': instance.itemId,
  'itemName': instance.itemName,
  'price': instance.price,
  'description': instance.description,
  'rating': instance.rating,
  'quantity': instance.quantity,
  'isLoading': instance.isLoading,
  'errorMessage': instance.errorMessage,
};

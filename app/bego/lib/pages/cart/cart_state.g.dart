// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartState _$CartStateFromJson(Map<String, dynamic> json) => _CartState(
  cartItems: (json['cartItems'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  currentStep: (json['currentStep'] as num).toInt(),
  shippingAddress: json['shippingAddress'] as String?,
  paymentMethod: json['paymentMethod'] as String?,
  totalPrice: (json['totalPrice'] as num).toDouble(),
  isLoading: json['isLoading'] as bool,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$CartStateToJson(_CartState instance) =>
    <String, dynamic>{
      'cartItems': instance.cartItems,
      'currentStep': instance.currentStep,
      'shippingAddress': instance.shippingAddress,
      'paymentMethod': instance.paymentMethod,
      'totalPrice': instance.totalPrice,
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
    };

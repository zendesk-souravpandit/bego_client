// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileState _$ProfileStateFromJson(Map<String, dynamic> json) =>
    _ProfileState(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      orderHistory: (json['orderHistory'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isLoading: json['isLoading'] as bool,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ProfileStateToJson(_ProfileState instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'orderHistory': instance.orderHistory,
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
    };

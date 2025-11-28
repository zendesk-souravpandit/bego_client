// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeState _$HomeStateFromJson(Map<String, dynamic> json) => _HomeState(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  isLoading: json['isLoading'] as bool,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$HomeStateToJson(_HomeState instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
    };

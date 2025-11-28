// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesState _$CategoriesStateFromJson(Map<String, dynamic> json) =>
    _CategoriesState(
      category: json['category'] as String,
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
      isLoading: json['isLoading'] as bool,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$CategoriesStateToJson(_CategoriesState instance) =>
    <String, dynamic>{
      'category': instance.category,
      'items': instance.items,
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
    };

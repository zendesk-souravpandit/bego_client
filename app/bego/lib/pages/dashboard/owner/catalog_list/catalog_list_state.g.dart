// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogListState _$CatalogListStateFromJson(Map<String, dynamic> json) =>
    _CatalogListState(
      tenantId: json['tenantId'] as String,
      businessId: json['businessId'] as String,
      items:
          (json['items'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$CatalogListStateToJson(_CatalogListState instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'businessId': instance.businessId,
      'items': instance.items,
      'isLoading': instance.isLoading,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcements_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnouncementsState _$AnnouncementsStateFromJson(Map<String, dynamic> json) =>
    _AnnouncementsState(
      tenantId: json['tenantId'] as String,
      businessId: json['businessId'] as String,
      announcements:
          (json['announcements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      isCreating: json['isCreating'] as bool? ?? false,
    );

Map<String, dynamic> _$AnnouncementsStateToJson(_AnnouncementsState instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'businessId': instance.businessId,
      'announcements': instance.announcements,
      'isLoading': instance.isLoading,
      'isCreating': instance.isCreating,
    };

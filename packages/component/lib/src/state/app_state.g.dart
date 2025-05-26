// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppState _$AppStateFromJson(Map<String, dynamic> json) => _AppState(
  appName: json['appName'] as String,
  package: json['package'] as String,
  version: json['version'] as String,
  deviceId: json['deviceId'] as String?,
  appLocale: json['appLocale'] as String?,
  appTheme: json['appTheme'] as String?,
);

Map<String, dynamic> _$AppStateToJson(_AppState instance) => <String, dynamic>{
  'appName': instance.appName,
  'package': instance.package,
  'version': instance.version,
  'deviceId': instance.deviceId,
  'appLocale': instance.appLocale,
  'appTheme': instance.appTheme,
};

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppState {

 String get appName; String get package; String get version; String? get deviceId;@KeyValueSSConverter() KeyValueSS? get locale; String? get theme;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.package, package) || other.package == package)&&(identical(other.version, version) || other.version == version)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.theme, theme) || other.theme == theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appName,package,version,deviceId,locale,theme);

@override
String toString() {
  return 'AppState(appName: $appName, package: $package, version: $version, deviceId: $deviceId, locale: $locale, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 String appName, String package, String version, String? deviceId,@KeyValueSSConverter() KeyValueSS? locale, String? theme
});




}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appName = null,Object? package = null,Object? version = null,Object? deviceId = freezed,Object? locale = freezed,Object? theme = freezed,}) {
  return _then(_self.copyWith(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as KeyValueSS?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AppState implements AppState {
  const _AppState({required this.appName, required this.package, required this.version, required this.deviceId, @KeyValueSSConverter() required this.locale, required this.theme});
  factory _AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

@override final  String appName;
@override final  String package;
@override final  String version;
@override final  String? deviceId;
@override@KeyValueSSConverter() final  KeyValueSS? locale;
@override final  String? theme;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.package, package) || other.package == package)&&(identical(other.version, version) || other.version == version)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.theme, theme) || other.theme == theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appName,package,version,deviceId,locale,theme);

@override
String toString() {
  return 'AppState(appName: $appName, package: $package, version: $version, deviceId: $deviceId, locale: $locale, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 String appName, String package, String version, String? deviceId,@KeyValueSSConverter() KeyValueSS? locale, String? theme
});




}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appName = null,Object? package = null,Object? version = null,Object? deviceId = freezed,Object? locale = freezed,Object? theme = freezed,}) {
  return _then(_AppState(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as KeyValueSS?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

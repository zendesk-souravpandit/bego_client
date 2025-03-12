// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppState {

 String get appName; String get packageName; String get version; String? get deviceId; ThemeMode get themeMode; Locale get locale; double get screenWidth; BeBreakpoint get breakpoint; BeResponsivePoints get responsivePoints;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.version, version) || other.version == version)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.screenWidth, screenWidth) || other.screenWidth == screenWidth)&&(identical(other.breakpoint, breakpoint) || other.breakpoint == breakpoint)&&(identical(other.responsivePoints, responsivePoints) || other.responsivePoints == responsivePoints));
}


@override
int get hashCode => Object.hash(runtimeType,appName,packageName,version,deviceId,themeMode,locale,screenWidth,breakpoint,responsivePoints);

@override
String toString() {
  return 'AppState(appName: $appName, packageName: $packageName, version: $version, deviceId: $deviceId, themeMode: $themeMode, locale: $locale, screenWidth: $screenWidth, breakpoint: $breakpoint, responsivePoints: $responsivePoints)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 String appName, String packageName, String version, String? deviceId, ThemeMode themeMode, Locale locale, double screenWidth, BeBreakpoint breakpoint, BeResponsivePoints responsivePoints
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
@pragma('vm:prefer-inline') @override $Res call({Object? appName = null,Object? packageName = null,Object? version = null,Object? deviceId = freezed,Object? themeMode = null,Object? locale = null,Object? screenWidth = null,Object? breakpoint = null,Object? responsivePoints = null,}) {
  return _then(_self.copyWith(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,screenWidth: null == screenWidth ? _self.screenWidth : screenWidth // ignore: cast_nullable_to_non_nullable
as double,breakpoint: null == breakpoint ? _self.breakpoint : breakpoint // ignore: cast_nullable_to_non_nullable
as BeBreakpoint,responsivePoints: null == responsivePoints ? _self.responsivePoints : responsivePoints // ignore: cast_nullable_to_non_nullable
as BeResponsivePoints,
  ));
}

}


/// @nodoc


class _AppState implements AppState {
  const _AppState({required this.appName, required this.packageName, required this.version, required this.deviceId, required this.themeMode, required this.locale, required this.screenWidth, required this.breakpoint, required this.responsivePoints});
  

@override final  String appName;
@override final  String packageName;
@override final  String version;
@override final  String? deviceId;
@override final  ThemeMode themeMode;
@override final  Locale locale;
@override final  double screenWidth;
@override final  BeBreakpoint breakpoint;
@override final  BeResponsivePoints responsivePoints;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.version, version) || other.version == version)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.screenWidth, screenWidth) || other.screenWidth == screenWidth)&&(identical(other.breakpoint, breakpoint) || other.breakpoint == breakpoint)&&(identical(other.responsivePoints, responsivePoints) || other.responsivePoints == responsivePoints));
}


@override
int get hashCode => Object.hash(runtimeType,appName,packageName,version,deviceId,themeMode,locale,screenWidth,breakpoint,responsivePoints);

@override
String toString() {
  return 'AppState(appName: $appName, packageName: $packageName, version: $version, deviceId: $deviceId, themeMode: $themeMode, locale: $locale, screenWidth: $screenWidth, breakpoint: $breakpoint, responsivePoints: $responsivePoints)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 String appName, String packageName, String version, String? deviceId, ThemeMode themeMode, Locale locale, double screenWidth, BeBreakpoint breakpoint, BeResponsivePoints responsivePoints
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
@override @pragma('vm:prefer-inline') $Res call({Object? appName = null,Object? packageName = null,Object? version = null,Object? deviceId = freezed,Object? themeMode = null,Object? locale = null,Object? screenWidth = null,Object? breakpoint = null,Object? responsivePoints = null,}) {
  return _then(_AppState(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,screenWidth: null == screenWidth ? _self.screenWidth : screenWidth // ignore: cast_nullable_to_non_nullable
as double,breakpoint: null == breakpoint ? _self.breakpoint : breakpoint // ignore: cast_nullable_to_non_nullable
as BeBreakpoint,responsivePoints: null == responsivePoints ? _self.responsivePoints : responsivePoints // ignore: cast_nullable_to_non_nullable
as BeResponsivePoints,
  ));
}


}

// dart format on

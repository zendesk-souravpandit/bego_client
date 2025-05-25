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

 String get name; String get package; String get version; String? get deviceId; double get screenWidth; ThemeMode get themeMode; Locale get locale; BeBreakpoint get breakpoint; BeThemeData get bethemeData; BeResponsivePoints get responsivePoints;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.name, name) || other.name == name)&&(identical(other.package, package) || other.package == package)&&(identical(other.version, version) || other.version == version)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.screenWidth, screenWidth) || other.screenWidth == screenWidth)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.breakpoint, breakpoint) || other.breakpoint == breakpoint)&&(identical(other.bethemeData, bethemeData) || other.bethemeData == bethemeData)&&(identical(other.responsivePoints, responsivePoints) || other.responsivePoints == responsivePoints));
}


@override
int get hashCode => Object.hash(runtimeType,name,package,version,deviceId,screenWidth,themeMode,locale,breakpoint,bethemeData,responsivePoints);

@override
String toString() {
  return 'AppState(name: $name, package: $package, version: $version, deviceId: $deviceId, screenWidth: $screenWidth, themeMode: $themeMode, locale: $locale, breakpoint: $breakpoint, bethemeData: $bethemeData, responsivePoints: $responsivePoints)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 String name, String package, String version, String? deviceId, double screenWidth, ThemeMode themeMode, Locale locale, BeBreakpoint breakpoint, BeThemeData bethemeData, BeResponsivePoints responsivePoints
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? package = null,Object? version = null,Object? deviceId = freezed,Object? screenWidth = null,Object? themeMode = null,Object? locale = null,Object? breakpoint = null,Object? bethemeData = null,Object? responsivePoints = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,screenWidth: null == screenWidth ? _self.screenWidth : screenWidth // ignore: cast_nullable_to_non_nullable
as double,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,breakpoint: null == breakpoint ? _self.breakpoint : breakpoint // ignore: cast_nullable_to_non_nullable
as BeBreakpoint,bethemeData: null == bethemeData ? _self.bethemeData : bethemeData // ignore: cast_nullable_to_non_nullable
as BeThemeData,responsivePoints: null == responsivePoints ? _self.responsivePoints : responsivePoints // ignore: cast_nullable_to_non_nullable
as BeResponsivePoints,
  ));
}

}


/// @nodoc


class _AppState implements AppState {
  const _AppState({required this.name, required this.package, required this.version, required this.deviceId, required this.screenWidth, this.themeMode = ThemeMode.light, this.locale = const Locale('en', 'US'), this.breakpoint = BeBreakpoint.md, this.bethemeData = const BeThemeData(), this.responsivePoints = const BeResponsivePoints()});
  

@override final  String name;
@override final  String package;
@override final  String version;
@override final  String? deviceId;
@override final  double screenWidth;
@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  Locale locale;
@override@JsonKey() final  BeBreakpoint breakpoint;
@override@JsonKey() final  BeThemeData bethemeData;
@override@JsonKey() final  BeResponsivePoints responsivePoints;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.name, name) || other.name == name)&&(identical(other.package, package) || other.package == package)&&(identical(other.version, version) || other.version == version)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.screenWidth, screenWidth) || other.screenWidth == screenWidth)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.breakpoint, breakpoint) || other.breakpoint == breakpoint)&&(identical(other.bethemeData, bethemeData) || other.bethemeData == bethemeData)&&(identical(other.responsivePoints, responsivePoints) || other.responsivePoints == responsivePoints));
}


@override
int get hashCode => Object.hash(runtimeType,name,package,version,deviceId,screenWidth,themeMode,locale,breakpoint,bethemeData,responsivePoints);

@override
String toString() {
  return 'AppState(name: $name, package: $package, version: $version, deviceId: $deviceId, screenWidth: $screenWidth, themeMode: $themeMode, locale: $locale, breakpoint: $breakpoint, bethemeData: $bethemeData, responsivePoints: $responsivePoints)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String package, String version, String? deviceId, double screenWidth, ThemeMode themeMode, Locale locale, BeBreakpoint breakpoint, BeThemeData bethemeData, BeResponsivePoints responsivePoints
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? package = null,Object? version = null,Object? deviceId = freezed,Object? screenWidth = null,Object? themeMode = null,Object? locale = null,Object? breakpoint = null,Object? bethemeData = null,Object? responsivePoints = null,}) {
  return _then(_AppState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,screenWidth: null == screenWidth ? _self.screenWidth : screenWidth // ignore: cast_nullable_to_non_nullable
as double,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,breakpoint: null == breakpoint ? _self.breakpoint : breakpoint // ignore: cast_nullable_to_non_nullable
as BeBreakpoint,bethemeData: null == bethemeData ? _self.bethemeData : bethemeData // ignore: cast_nullable_to_non_nullable
as BeThemeData,responsivePoints: null == responsivePoints ? _self.responsivePoints : responsivePoints // ignore: cast_nullable_to_non_nullable
as BeResponsivePoints,
  ));
}


}

// dart format on

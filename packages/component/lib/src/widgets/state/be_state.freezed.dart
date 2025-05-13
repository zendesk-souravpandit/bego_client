// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'be_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BeStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BeStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BeStatus()';
}


}

/// @nodoc
class $BeStatusCopyWith<$Res>  {
$BeStatusCopyWith(BeStatus _, $Res Function(BeStatus) __);
}


/// @nodoc


class _BeStatusEmpty implements BeStatus {
  const _BeStatusEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BeStatusEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BeStatus.empty()';
}


}




/// @nodoc


class _BeStatusLoading implements BeStatus {
  const _BeStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BeStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BeStatus.loading()';
}


}




/// @nodoc


class _BeStatusError implements BeStatus {
  const _BeStatusError({required this.title, required this.description});
  

 final  String title;
 final  String description;

/// Create a copy of BeStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BeStatusErrorCopyWith<_BeStatusError> get copyWith => __$BeStatusErrorCopyWithImpl<_BeStatusError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BeStatusError&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'BeStatus.error(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$BeStatusErrorCopyWith<$Res> implements $BeStatusCopyWith<$Res> {
  factory _$BeStatusErrorCopyWith(_BeStatusError value, $Res Function(_BeStatusError) _then) = __$BeStatusErrorCopyWithImpl;
@useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class __$BeStatusErrorCopyWithImpl<$Res>
    implements _$BeStatusErrorCopyWith<$Res> {
  __$BeStatusErrorCopyWithImpl(this._self, this._then);

  final _BeStatusError _self;
  final $Res Function(_BeStatusError) _then;

/// Create a copy of BeStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,}) {
  return _then(_BeStatusError(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BeStatusSuccess implements BeStatus {
  const _BeStatusSuccess({this.title = '', this.description = ''});
  

@JsonKey() final  String title;
@JsonKey() final  String description;

/// Create a copy of BeStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BeStatusSuccessCopyWith<_BeStatusSuccess> get copyWith => __$BeStatusSuccessCopyWithImpl<_BeStatusSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BeStatusSuccess&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'BeStatus.success(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$BeStatusSuccessCopyWith<$Res> implements $BeStatusCopyWith<$Res> {
  factory _$BeStatusSuccessCopyWith(_BeStatusSuccess value, $Res Function(_BeStatusSuccess) _then) = __$BeStatusSuccessCopyWithImpl;
@useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class __$BeStatusSuccessCopyWithImpl<$Res>
    implements _$BeStatusSuccessCopyWith<$Res> {
  __$BeStatusSuccessCopyWithImpl(this._self, this._then);

  final _BeStatusSuccess _self;
  final $Res Function(_BeStatusSuccess) _then;

/// Create a copy of BeStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,}) {
  return _then(_BeStatusSuccess(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

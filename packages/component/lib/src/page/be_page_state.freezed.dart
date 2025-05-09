// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'be_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BePageStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BePageStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BePageStatus()';
}


}

/// @nodoc
class $BePageStatusCopyWith<$Res>  {
$BePageStatusCopyWith(BePageStatus _, $Res Function(BePageStatus) __);
}


/// @nodoc


class BePageStatusEmpty implements BePageStatus {
  const BePageStatusEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BePageStatusEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BePageStatus.empty()';
}


}




/// @nodoc


class BePageStatusLoading implements BePageStatus {
  const BePageStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BePageStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BePageStatus.loading()';
}


}




/// @nodoc


class BePageStatusError implements BePageStatus {
  const BePageStatusError({required this.title, required this.description});
  

 final  String title;
 final  String description;

/// Create a copy of BePageStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BePageStatusErrorCopyWith<BePageStatusError> get copyWith => _$BePageStatusErrorCopyWithImpl<BePageStatusError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BePageStatusError&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'BePageStatus.error(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $BePageStatusErrorCopyWith<$Res> implements $BePageStatusCopyWith<$Res> {
  factory $BePageStatusErrorCopyWith(BePageStatusError value, $Res Function(BePageStatusError) _then) = _$BePageStatusErrorCopyWithImpl;
@useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class _$BePageStatusErrorCopyWithImpl<$Res>
    implements $BePageStatusErrorCopyWith<$Res> {
  _$BePageStatusErrorCopyWithImpl(this._self, this._then);

  final BePageStatusError _self;
  final $Res Function(BePageStatusError) _then;

/// Create a copy of BePageStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,}) {
  return _then(BePageStatusError(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BePageStatusSuccess implements BePageStatus {
  const BePageStatusSuccess({this.title = '', this.description = ''});
  

@JsonKey() final  String title;
@JsonKey() final  String description;

/// Create a copy of BePageStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BePageStatusSuccessCopyWith<BePageStatusSuccess> get copyWith => _$BePageStatusSuccessCopyWithImpl<BePageStatusSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BePageStatusSuccess&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'BePageStatus.success(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $BePageStatusSuccessCopyWith<$Res> implements $BePageStatusCopyWith<$Res> {
  factory $BePageStatusSuccessCopyWith(BePageStatusSuccess value, $Res Function(BePageStatusSuccess) _then) = _$BePageStatusSuccessCopyWithImpl;
@useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class _$BePageStatusSuccessCopyWithImpl<$Res>
    implements $BePageStatusSuccessCopyWith<$Res> {
  _$BePageStatusSuccessCopyWithImpl(this._self, this._then);

  final BePageStatusSuccess _self;
  final $Res Function(BePageStatusSuccess) _then;

/// Create a copy of BePageStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,}) {
  return _then(BePageStatusSuccess(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

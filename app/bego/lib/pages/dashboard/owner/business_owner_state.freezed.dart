// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_owner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessOwnerState {

 String get tenantId; String get businessId; String get name; String get description;
/// Create a copy of BusinessOwnerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessOwnerStateCopyWith<BusinessOwnerState> get copyWith => _$BusinessOwnerStateCopyWithImpl<BusinessOwnerState>(this as BusinessOwnerState, _$identity);

  /// Serializes this BusinessOwnerState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessOwnerState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,name,description);

@override
String toString() {
  return 'BusinessOwnerState(tenantId: $tenantId, businessId: $businessId, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $BusinessOwnerStateCopyWith<$Res>  {
  factory $BusinessOwnerStateCopyWith(BusinessOwnerState value, $Res Function(BusinessOwnerState) _then) = _$BusinessOwnerStateCopyWithImpl;
@useResult
$Res call({
 String tenantId, String businessId, String name, String description
});




}
/// @nodoc
class _$BusinessOwnerStateCopyWithImpl<$Res>
    implements $BusinessOwnerStateCopyWith<$Res> {
  _$BusinessOwnerStateCopyWithImpl(this._self, this._then);

  final BusinessOwnerState _self;
  final $Res Function(BusinessOwnerState) _then;

/// Create a copy of BusinessOwnerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? businessId = null,Object? name = null,Object? description = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessOwnerState].
extension BusinessOwnerStatePatterns on BusinessOwnerState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessOwnerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessOwnerState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessOwnerState value)  $default,){
final _that = this;
switch (_that) {
case _BusinessOwnerState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessOwnerState value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessOwnerState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  String name,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessOwnerState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.name,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  String name,  String description)  $default,) {final _that = this;
switch (_that) {
case _BusinessOwnerState():
return $default(_that.tenantId,_that.businessId,_that.name,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantId,  String businessId,  String name,  String description)?  $default,) {final _that = this;
switch (_that) {
case _BusinessOwnerState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessOwnerState implements BusinessOwnerState {
  const _BusinessOwnerState({required this.tenantId, required this.businessId, this.name = '', this.description = ''});
  factory _BusinessOwnerState.fromJson(Map<String, dynamic> json) => _$BusinessOwnerStateFromJson(json);

@override final  String tenantId;
@override final  String businessId;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;

/// Create a copy of BusinessOwnerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessOwnerStateCopyWith<_BusinessOwnerState> get copyWith => __$BusinessOwnerStateCopyWithImpl<_BusinessOwnerState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessOwnerStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessOwnerState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,name,description);

@override
String toString() {
  return 'BusinessOwnerState(tenantId: $tenantId, businessId: $businessId, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$BusinessOwnerStateCopyWith<$Res> implements $BusinessOwnerStateCopyWith<$Res> {
  factory _$BusinessOwnerStateCopyWith(_BusinessOwnerState value, $Res Function(_BusinessOwnerState) _then) = __$BusinessOwnerStateCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, String businessId, String name, String description
});




}
/// @nodoc
class __$BusinessOwnerStateCopyWithImpl<$Res>
    implements _$BusinessOwnerStateCopyWith<$Res> {
  __$BusinessOwnerStateCopyWithImpl(this._self, this._then);

  final _BusinessOwnerState _self;
  final $Res Function(_BusinessOwnerState) _then;

/// Create a copy of BusinessOwnerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? businessId = null,Object? name = null,Object? description = null,}) {
  return _then(_BusinessOwnerState(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

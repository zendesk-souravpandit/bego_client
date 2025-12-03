// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessViewState {

 String get tenantId; String get businessId; List<String> get services;
/// Create a copy of BusinessViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessViewStateCopyWith<BusinessViewState> get copyWith => _$BusinessViewStateCopyWithImpl<BusinessViewState>(this as BusinessViewState, _$identity);

  /// Serializes this BusinessViewState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessViewState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&const DeepCollectionEquality().equals(other.services, services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,const DeepCollectionEquality().hash(services));

@override
String toString() {
  return 'BusinessViewState(tenantId: $tenantId, businessId: $businessId, services: $services)';
}


}

/// @nodoc
abstract mixin class $BusinessViewStateCopyWith<$Res>  {
  factory $BusinessViewStateCopyWith(BusinessViewState value, $Res Function(BusinessViewState) _then) = _$BusinessViewStateCopyWithImpl;
@useResult
$Res call({
 String tenantId, String businessId, List<String> services
});




}
/// @nodoc
class _$BusinessViewStateCopyWithImpl<$Res>
    implements $BusinessViewStateCopyWith<$Res> {
  _$BusinessViewStateCopyWithImpl(this._self, this._then);

  final BusinessViewState _self;
  final $Res Function(BusinessViewState) _then;

/// Create a copy of BusinessViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? businessId = null,Object? services = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessViewState].
extension BusinessViewStatePatterns on BusinessViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessViewState value)  $default,){
final _that = this;
switch (_that) {
case _BusinessViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessViewState value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  List<String> services)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessViewState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.services);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  List<String> services)  $default,) {final _that = this;
switch (_that) {
case _BusinessViewState():
return $default(_that.tenantId,_that.businessId,_that.services);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantId,  String businessId,  List<String> services)?  $default,) {final _that = this;
switch (_that) {
case _BusinessViewState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.services);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessViewState implements BusinessViewState {
  const _BusinessViewState({required this.tenantId, required this.businessId, final  List<String> services = const []}): _services = services;
  factory _BusinessViewState.fromJson(Map<String, dynamic> json) => _$BusinessViewStateFromJson(json);

@override final  String tenantId;
@override final  String businessId;
 final  List<String> _services;
@override@JsonKey() List<String> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}


/// Create a copy of BusinessViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessViewStateCopyWith<_BusinessViewState> get copyWith => __$BusinessViewStateCopyWithImpl<_BusinessViewState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessViewStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessViewState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&const DeepCollectionEquality().equals(other._services, _services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,const DeepCollectionEquality().hash(_services));

@override
String toString() {
  return 'BusinessViewState(tenantId: $tenantId, businessId: $businessId, services: $services)';
}


}

/// @nodoc
abstract mixin class _$BusinessViewStateCopyWith<$Res> implements $BusinessViewStateCopyWith<$Res> {
  factory _$BusinessViewStateCopyWith(_BusinessViewState value, $Res Function(_BusinessViewState) _then) = __$BusinessViewStateCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, String businessId, List<String> services
});




}
/// @nodoc
class __$BusinessViewStateCopyWithImpl<$Res>
    implements _$BusinessViewStateCopyWith<$Res> {
  __$BusinessViewStateCopyWithImpl(this._self, this._then);

  final _BusinessViewState _self;
  final $Res Function(_BusinessViewState) _then;

/// Create a copy of BusinessViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? businessId = null,Object? services = null,}) {
  return _then(_BusinessViewState(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenantViewState {

 String get tenantId; List<String> get businesses;
/// Create a copy of TenantViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantViewStateCopyWith<TenantViewState> get copyWith => _$TenantViewStateCopyWithImpl<TenantViewState>(this as TenantViewState, _$identity);

  /// Serializes this TenantViewState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantViewState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&const DeepCollectionEquality().equals(other.businesses, businesses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,const DeepCollectionEquality().hash(businesses));

@override
String toString() {
  return 'TenantViewState(tenantId: $tenantId, businesses: $businesses)';
}


}

/// @nodoc
abstract mixin class $TenantViewStateCopyWith<$Res>  {
  factory $TenantViewStateCopyWith(TenantViewState value, $Res Function(TenantViewState) _then) = _$TenantViewStateCopyWithImpl;
@useResult
$Res call({
 String tenantId, List<String> businesses
});




}
/// @nodoc
class _$TenantViewStateCopyWithImpl<$Res>
    implements $TenantViewStateCopyWith<$Res> {
  _$TenantViewStateCopyWithImpl(this._self, this._then);

  final TenantViewState _self;
  final $Res Function(TenantViewState) _then;

/// Create a copy of TenantViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? businesses = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businesses: null == businesses ? _self.businesses : businesses // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TenantViewState].
extension TenantViewStatePatterns on TenantViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantViewState value)  $default,){
final _that = this;
switch (_that) {
case _TenantViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantViewState value)?  $default,){
final _that = this;
switch (_that) {
case _TenantViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantId,  List<String> businesses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantViewState() when $default != null:
return $default(_that.tenantId,_that.businesses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantId,  List<String> businesses)  $default,) {final _that = this;
switch (_that) {
case _TenantViewState():
return $default(_that.tenantId,_that.businesses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantId,  List<String> businesses)?  $default,) {final _that = this;
switch (_that) {
case _TenantViewState() when $default != null:
return $default(_that.tenantId,_that.businesses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantViewState implements TenantViewState {
  const _TenantViewState({this.tenantId = '', final  List<String> businesses = const []}): _businesses = businesses;
  factory _TenantViewState.fromJson(Map<String, dynamic> json) => _$TenantViewStateFromJson(json);

@override@JsonKey() final  String tenantId;
 final  List<String> _businesses;
@override@JsonKey() List<String> get businesses {
  if (_businesses is EqualUnmodifiableListView) return _businesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_businesses);
}


/// Create a copy of TenantViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantViewStateCopyWith<_TenantViewState> get copyWith => __$TenantViewStateCopyWithImpl<_TenantViewState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantViewStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantViewState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&const DeepCollectionEquality().equals(other._businesses, _businesses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,const DeepCollectionEquality().hash(_businesses));

@override
String toString() {
  return 'TenantViewState(tenantId: $tenantId, businesses: $businesses)';
}


}

/// @nodoc
abstract mixin class _$TenantViewStateCopyWith<$Res> implements $TenantViewStateCopyWith<$Res> {
  factory _$TenantViewStateCopyWith(_TenantViewState value, $Res Function(_TenantViewState) _then) = __$TenantViewStateCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, List<String> businesses
});




}
/// @nodoc
class __$TenantViewStateCopyWithImpl<$Res>
    implements _$TenantViewStateCopyWith<$Res> {
  __$TenantViewStateCopyWithImpl(this._self, this._then);

  final _TenantViewState _self;
  final $Res Function(_TenantViewState) _then;

/// Create a copy of TenantViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? businesses = null,}) {
  return _then(_TenantViewState(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businesses: null == businesses ? _self._businesses : businesses // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

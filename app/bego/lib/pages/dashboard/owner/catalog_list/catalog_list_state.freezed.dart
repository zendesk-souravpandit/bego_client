// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogListState {

 String get tenantId; String get businessId; List<String> get items; bool get isLoading;
/// Create a copy of CatalogListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogListStateCopyWith<CatalogListState> get copyWith => _$CatalogListStateCopyWithImpl<CatalogListState>(this as CatalogListState, _$identity);

  /// Serializes this CatalogListState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogListState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,const DeepCollectionEquality().hash(items),isLoading);

@override
String toString() {
  return 'CatalogListState(tenantId: $tenantId, businessId: $businessId, items: $items, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $CatalogListStateCopyWith<$Res>  {
  factory $CatalogListStateCopyWith(CatalogListState value, $Res Function(CatalogListState) _then) = _$CatalogListStateCopyWithImpl;
@useResult
$Res call({
 String tenantId, String businessId, List<String> items, bool isLoading
});




}
/// @nodoc
class _$CatalogListStateCopyWithImpl<$Res>
    implements $CatalogListStateCopyWith<$Res> {
  _$CatalogListStateCopyWithImpl(this._self, this._then);

  final CatalogListState _self;
  final $Res Function(CatalogListState) _then;

/// Create a copy of CatalogListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? businessId = null,Object? items = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogListState].
extension CatalogListStatePatterns on CatalogListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogListState value)  $default,){
final _that = this;
switch (_that) {
case _CatalogListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogListState value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  List<String> items,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogListState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.items,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  List<String> items,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _CatalogListState():
return $default(_that.tenantId,_that.businessId,_that.items,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantId,  String businessId,  List<String> items,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _CatalogListState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.items,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogListState extends CatalogListState {
  const _CatalogListState({required this.tenantId, required this.businessId, final  List<String> items = const [], this.isLoading = false}): _items = items,super._();
  factory _CatalogListState.fromJson(Map<String, dynamic> json) => _$CatalogListStateFromJson(json);

@override final  String tenantId;
@override final  String businessId;
 final  List<String> _items;
@override@JsonKey() List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isLoading;

/// Create a copy of CatalogListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogListStateCopyWith<_CatalogListState> get copyWith => __$CatalogListStateCopyWithImpl<_CatalogListState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogListStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogListState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,const DeepCollectionEquality().hash(_items),isLoading);

@override
String toString() {
  return 'CatalogListState(tenantId: $tenantId, businessId: $businessId, items: $items, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$CatalogListStateCopyWith<$Res> implements $CatalogListStateCopyWith<$Res> {
  factory _$CatalogListStateCopyWith(_CatalogListState value, $Res Function(_CatalogListState) _then) = __$CatalogListStateCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, String businessId, List<String> items, bool isLoading
});




}
/// @nodoc
class __$CatalogListStateCopyWithImpl<$Res>
    implements _$CatalogListStateCopyWith<$Res> {
  __$CatalogListStateCopyWithImpl(this._self, this._then);

  final _CatalogListState _self;
  final $Res Function(_CatalogListState) _then;

/// Create a copy of CatalogListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? businessId = null,Object? items = null,Object? isLoading = null,}) {
  return _then(_CatalogListState(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

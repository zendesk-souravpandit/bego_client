// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditItemState {

 String get tenantId; String get businessId; String get itemId; String get itemName; String get itemDescription; double get itemPrice; Map<String, dynamic> get itemDetails; bool get isLoading; bool get isSaving;
/// Create a copy of EditItemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditItemStateCopyWith<EditItemState> get copyWith => _$EditItemStateCopyWithImpl<EditItemState>(this as EditItemState, _$identity);

  /// Serializes this EditItemState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditItemState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemDescription, itemDescription) || other.itemDescription == itemDescription)&&(identical(other.itemPrice, itemPrice) || other.itemPrice == itemPrice)&&const DeepCollectionEquality().equals(other.itemDetails, itemDetails)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,itemId,itemName,itemDescription,itemPrice,const DeepCollectionEquality().hash(itemDetails),isLoading,isSaving);

@override
String toString() {
  return 'EditItemState(tenantId: $tenantId, businessId: $businessId, itemId: $itemId, itemName: $itemName, itemDescription: $itemDescription, itemPrice: $itemPrice, itemDetails: $itemDetails, isLoading: $isLoading, isSaving: $isSaving)';
}


}

/// @nodoc
abstract mixin class $EditItemStateCopyWith<$Res>  {
  factory $EditItemStateCopyWith(EditItemState value, $Res Function(EditItemState) _then) = _$EditItemStateCopyWithImpl;
@useResult
$Res call({
 String tenantId, String businessId, String itemId, String itemName, String itemDescription, double itemPrice, Map<String, dynamic> itemDetails, bool isLoading, bool isSaving
});




}
/// @nodoc
class _$EditItemStateCopyWithImpl<$Res>
    implements $EditItemStateCopyWith<$Res> {
  _$EditItemStateCopyWithImpl(this._self, this._then);

  final EditItemState _self;
  final $Res Function(EditItemState) _then;

/// Create a copy of EditItemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? businessId = null,Object? itemId = null,Object? itemName = null,Object? itemDescription = null,Object? itemPrice = null,Object? itemDetails = null,Object? isLoading = null,Object? isSaving = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemDescription: null == itemDescription ? _self.itemDescription : itemDescription // ignore: cast_nullable_to_non_nullable
as String,itemPrice: null == itemPrice ? _self.itemPrice : itemPrice // ignore: cast_nullable_to_non_nullable
as double,itemDetails: null == itemDetails ? _self.itemDetails : itemDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EditItemState].
extension EditItemStatePatterns on EditItemState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditItemState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditItemState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditItemState value)  $default,){
final _that = this;
switch (_that) {
case _EditItemState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditItemState value)?  $default,){
final _that = this;
switch (_that) {
case _EditItemState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  String itemId,  String itemName,  String itemDescription,  double itemPrice,  Map<String, dynamic> itemDetails,  bool isLoading,  bool isSaving)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditItemState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.itemId,_that.itemName,_that.itemDescription,_that.itemPrice,_that.itemDetails,_that.isLoading,_that.isSaving);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  String itemId,  String itemName,  String itemDescription,  double itemPrice,  Map<String, dynamic> itemDetails,  bool isLoading,  bool isSaving)  $default,) {final _that = this;
switch (_that) {
case _EditItemState():
return $default(_that.tenantId,_that.businessId,_that.itemId,_that.itemName,_that.itemDescription,_that.itemPrice,_that.itemDetails,_that.isLoading,_that.isSaving);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantId,  String businessId,  String itemId,  String itemName,  String itemDescription,  double itemPrice,  Map<String, dynamic> itemDetails,  bool isLoading,  bool isSaving)?  $default,) {final _that = this;
switch (_that) {
case _EditItemState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.itemId,_that.itemName,_that.itemDescription,_that.itemPrice,_that.itemDetails,_that.isLoading,_that.isSaving);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditItemState extends EditItemState {
  const _EditItemState({required this.tenantId, required this.businessId, required this.itemId, this.itemName = '', this.itemDescription = '', this.itemPrice = 0.0, final  Map<String, dynamic> itemDetails = const {}, this.isLoading = false, this.isSaving = false}): _itemDetails = itemDetails,super._();
  factory _EditItemState.fromJson(Map<String, dynamic> json) => _$EditItemStateFromJson(json);

@override final  String tenantId;
@override final  String businessId;
@override final  String itemId;
@override@JsonKey() final  String itemName;
@override@JsonKey() final  String itemDescription;
@override@JsonKey() final  double itemPrice;
 final  Map<String, dynamic> _itemDetails;
@override@JsonKey() Map<String, dynamic> get itemDetails {
  if (_itemDetails is EqualUnmodifiableMapView) return _itemDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_itemDetails);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;

/// Create a copy of EditItemState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditItemStateCopyWith<_EditItemState> get copyWith => __$EditItemStateCopyWithImpl<_EditItemState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditItemStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditItemState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemDescription, itemDescription) || other.itemDescription == itemDescription)&&(identical(other.itemPrice, itemPrice) || other.itemPrice == itemPrice)&&const DeepCollectionEquality().equals(other._itemDetails, _itemDetails)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,itemId,itemName,itemDescription,itemPrice,const DeepCollectionEquality().hash(_itemDetails),isLoading,isSaving);

@override
String toString() {
  return 'EditItemState(tenantId: $tenantId, businessId: $businessId, itemId: $itemId, itemName: $itemName, itemDescription: $itemDescription, itemPrice: $itemPrice, itemDetails: $itemDetails, isLoading: $isLoading, isSaving: $isSaving)';
}


}

/// @nodoc
abstract mixin class _$EditItemStateCopyWith<$Res> implements $EditItemStateCopyWith<$Res> {
  factory _$EditItemStateCopyWith(_EditItemState value, $Res Function(_EditItemState) _then) = __$EditItemStateCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, String businessId, String itemId, String itemName, String itemDescription, double itemPrice, Map<String, dynamic> itemDetails, bool isLoading, bool isSaving
});




}
/// @nodoc
class __$EditItemStateCopyWithImpl<$Res>
    implements _$EditItemStateCopyWith<$Res> {
  __$EditItemStateCopyWithImpl(this._self, this._then);

  final _EditItemState _self;
  final $Res Function(_EditItemState) _then;

/// Create a copy of EditItemState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? businessId = null,Object? itemId = null,Object? itemName = null,Object? itemDescription = null,Object? itemPrice = null,Object? itemDetails = null,Object? isLoading = null,Object? isSaving = null,}) {
  return _then(_EditItemState(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemDescription: null == itemDescription ? _self.itemDescription : itemDescription // ignore: cast_nullable_to_non_nullable
as String,itemPrice: null == itemPrice ? _self.itemPrice : itemPrice // ignore: cast_nullable_to_non_nullable
as double,itemDetails: null == itemDetails ? _self._itemDetails : itemDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

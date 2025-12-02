// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_item_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessItemViewState {

 String get itemId; String get itemName; String get itemDescription; double get itemPrice; String get itemImage; Map<String, dynamic> get itemDetails; bool get isLoading;
/// Create a copy of BusinessItemViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessItemViewStateCopyWith<BusinessItemViewState> get copyWith => _$BusinessItemViewStateCopyWithImpl<BusinessItemViewState>(this as BusinessItemViewState, _$identity);

  /// Serializes this BusinessItemViewState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessItemViewState&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemDescription, itemDescription) || other.itemDescription == itemDescription)&&(identical(other.itemPrice, itemPrice) || other.itemPrice == itemPrice)&&(identical(other.itemImage, itemImage) || other.itemImage == itemImage)&&const DeepCollectionEquality().equals(other.itemDetails, itemDetails)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemName,itemDescription,itemPrice,itemImage,const DeepCollectionEquality().hash(itemDetails),isLoading);

@override
String toString() {
  return 'BusinessItemViewState(itemId: $itemId, itemName: $itemName, itemDescription: $itemDescription, itemPrice: $itemPrice, itemImage: $itemImage, itemDetails: $itemDetails, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $BusinessItemViewStateCopyWith<$Res>  {
  factory $BusinessItemViewStateCopyWith(BusinessItemViewState value, $Res Function(BusinessItemViewState) _then) = _$BusinessItemViewStateCopyWithImpl;
@useResult
$Res call({
 String itemId, String itemName, String itemDescription, double itemPrice, String itemImage, Map<String, dynamic> itemDetails, bool isLoading
});




}
/// @nodoc
class _$BusinessItemViewStateCopyWithImpl<$Res>
    implements $BusinessItemViewStateCopyWith<$Res> {
  _$BusinessItemViewStateCopyWithImpl(this._self, this._then);

  final BusinessItemViewState _self;
  final $Res Function(BusinessItemViewState) _then;

/// Create a copy of BusinessItemViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? itemName = null,Object? itemDescription = null,Object? itemPrice = null,Object? itemImage = null,Object? itemDetails = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemDescription: null == itemDescription ? _self.itemDescription : itemDescription // ignore: cast_nullable_to_non_nullable
as String,itemPrice: null == itemPrice ? _self.itemPrice : itemPrice // ignore: cast_nullable_to_non_nullable
as double,itemImage: null == itemImage ? _self.itemImage : itemImage // ignore: cast_nullable_to_non_nullable
as String,itemDetails: null == itemDetails ? _self.itemDetails : itemDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessItemViewState].
extension BusinessItemViewStatePatterns on BusinessItemViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessItemViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessItemViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessItemViewState value)  $default,){
final _that = this;
switch (_that) {
case _BusinessItemViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessItemViewState value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessItemViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  String itemName,  String itemDescription,  double itemPrice,  String itemImage,  Map<String, dynamic> itemDetails,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessItemViewState() when $default != null:
return $default(_that.itemId,_that.itemName,_that.itemDescription,_that.itemPrice,_that.itemImage,_that.itemDetails,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  String itemName,  String itemDescription,  double itemPrice,  String itemImage,  Map<String, dynamic> itemDetails,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _BusinessItemViewState():
return $default(_that.itemId,_that.itemName,_that.itemDescription,_that.itemPrice,_that.itemImage,_that.itemDetails,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  String itemName,  String itemDescription,  double itemPrice,  String itemImage,  Map<String, dynamic> itemDetails,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _BusinessItemViewState() when $default != null:
return $default(_that.itemId,_that.itemName,_that.itemDescription,_that.itemPrice,_that.itemImage,_that.itemDetails,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessItemViewState extends BusinessItemViewState {
  const _BusinessItemViewState({required this.itemId, required this.itemName, required this.itemDescription, required this.itemPrice, this.itemImage = '', final  Map<String, dynamic> itemDetails = const {}, this.isLoading = false}): _itemDetails = itemDetails,super._();
  factory _BusinessItemViewState.fromJson(Map<String, dynamic> json) => _$BusinessItemViewStateFromJson(json);

@override final  String itemId;
@override final  String itemName;
@override final  String itemDescription;
@override final  double itemPrice;
@override@JsonKey() final  String itemImage;
 final  Map<String, dynamic> _itemDetails;
@override@JsonKey() Map<String, dynamic> get itemDetails {
  if (_itemDetails is EqualUnmodifiableMapView) return _itemDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_itemDetails);
}

@override@JsonKey() final  bool isLoading;

/// Create a copy of BusinessItemViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessItemViewStateCopyWith<_BusinessItemViewState> get copyWith => __$BusinessItemViewStateCopyWithImpl<_BusinessItemViewState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessItemViewStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessItemViewState&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemDescription, itemDescription) || other.itemDescription == itemDescription)&&(identical(other.itemPrice, itemPrice) || other.itemPrice == itemPrice)&&(identical(other.itemImage, itemImage) || other.itemImage == itemImage)&&const DeepCollectionEquality().equals(other._itemDetails, _itemDetails)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemName,itemDescription,itemPrice,itemImage,const DeepCollectionEquality().hash(_itemDetails),isLoading);

@override
String toString() {
  return 'BusinessItemViewState(itemId: $itemId, itemName: $itemName, itemDescription: $itemDescription, itemPrice: $itemPrice, itemImage: $itemImage, itemDetails: $itemDetails, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$BusinessItemViewStateCopyWith<$Res> implements $BusinessItemViewStateCopyWith<$Res> {
  factory _$BusinessItemViewStateCopyWith(_BusinessItemViewState value, $Res Function(_BusinessItemViewState) _then) = __$BusinessItemViewStateCopyWithImpl;
@override @useResult
$Res call({
 String itemId, String itemName, String itemDescription, double itemPrice, String itemImage, Map<String, dynamic> itemDetails, bool isLoading
});




}
/// @nodoc
class __$BusinessItemViewStateCopyWithImpl<$Res>
    implements _$BusinessItemViewStateCopyWith<$Res> {
  __$BusinessItemViewStateCopyWithImpl(this._self, this._then);

  final _BusinessItemViewState _self;
  final $Res Function(_BusinessItemViewState) _then;

/// Create a copy of BusinessItemViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? itemName = null,Object? itemDescription = null,Object? itemPrice = null,Object? itemImage = null,Object? itemDetails = null,Object? isLoading = null,}) {
  return _then(_BusinessItemViewState(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemDescription: null == itemDescription ? _self.itemDescription : itemDescription // ignore: cast_nullable_to_non_nullable
as String,itemPrice: null == itemPrice ? _self.itemPrice : itemPrice // ignore: cast_nullable_to_non_nullable
as double,itemImage: null == itemImage ? _self.itemImage : itemImage // ignore: cast_nullable_to_non_nullable
as String,itemDetails: null == itemDetails ? _self._itemDetails : itemDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

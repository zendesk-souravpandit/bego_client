// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryDetailsState {

 String get category; String get itemId; String get itemName; double get price; String get description; double get rating; int get quantity; bool get isLoading; String? get errorMessage;
/// Create a copy of CategoryDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDetailsStateCopyWith<CategoryDetailsState> get copyWith => _$CategoryDetailsStateCopyWithImpl<CategoryDetailsState>(this as CategoryDetailsState, _$identity);

  /// Serializes this CategoryDetailsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDetailsState&&(identical(other.category, category) || other.category == category)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,itemId,itemName,price,description,rating,quantity,isLoading,errorMessage);

@override
String toString() {
  return 'CategoryDetailsState(category: $category, itemId: $itemId, itemName: $itemName, price: $price, description: $description, rating: $rating, quantity: $quantity, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CategoryDetailsStateCopyWith<$Res>  {
  factory $CategoryDetailsStateCopyWith(CategoryDetailsState value, $Res Function(CategoryDetailsState) _then) = _$CategoryDetailsStateCopyWithImpl;
@useResult
$Res call({
 String category, String itemId, String itemName, double price, String description, double rating, int quantity, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$CategoryDetailsStateCopyWithImpl<$Res>
    implements $CategoryDetailsStateCopyWith<$Res> {
  _$CategoryDetailsStateCopyWithImpl(this._self, this._then);

  final CategoryDetailsState _self;
  final $Res Function(CategoryDetailsState) _then;

/// Create a copy of CategoryDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? itemId = null,Object? itemName = null,Object? price = null,Object? description = null,Object? rating = null,Object? quantity = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryDetailsState].
extension CategoryDetailsStatePatterns on CategoryDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _CategoryDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  String itemId,  String itemName,  double price,  String description,  double rating,  int quantity,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryDetailsState() when $default != null:
return $default(_that.category,_that.itemId,_that.itemName,_that.price,_that.description,_that.rating,_that.quantity,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  String itemId,  String itemName,  double price,  String description,  double rating,  int quantity,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CategoryDetailsState():
return $default(_that.category,_that.itemId,_that.itemName,_that.price,_that.description,_that.rating,_that.quantity,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  String itemId,  String itemName,  double price,  String description,  double rating,  int quantity,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CategoryDetailsState() when $default != null:
return $default(_that.category,_that.itemId,_that.itemName,_that.price,_that.description,_that.rating,_that.quantity,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryDetailsState implements CategoryDetailsState {
  const _CategoryDetailsState({required this.category, required this.itemId, required this.itemName, required this.price, required this.description, required this.rating, required this.quantity, required this.isLoading, required this.errorMessage});
  factory _CategoryDetailsState.fromJson(Map<String, dynamic> json) => _$CategoryDetailsStateFromJson(json);

@override final  String category;
@override final  String itemId;
@override final  String itemName;
@override final  double price;
@override final  String description;
@override final  double rating;
@override final  int quantity;
@override final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of CategoryDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryDetailsStateCopyWith<_CategoryDetailsState> get copyWith => __$CategoryDetailsStateCopyWithImpl<_CategoryDetailsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryDetailsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryDetailsState&&(identical(other.category, category) || other.category == category)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,itemId,itemName,price,description,rating,quantity,isLoading,errorMessage);

@override
String toString() {
  return 'CategoryDetailsState(category: $category, itemId: $itemId, itemName: $itemName, price: $price, description: $description, rating: $rating, quantity: $quantity, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CategoryDetailsStateCopyWith<$Res> implements $CategoryDetailsStateCopyWith<$Res> {
  factory _$CategoryDetailsStateCopyWith(_CategoryDetailsState value, $Res Function(_CategoryDetailsState) _then) = __$CategoryDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 String category, String itemId, String itemName, double price, String description, double rating, int quantity, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$CategoryDetailsStateCopyWithImpl<$Res>
    implements _$CategoryDetailsStateCopyWith<$Res> {
  __$CategoryDetailsStateCopyWithImpl(this._self, this._then);

  final _CategoryDetailsState _self;
  final $Res Function(_CategoryDetailsState) _then;

/// Create a copy of CategoryDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? itemId = null,Object? itemName = null,Object? price = null,Object? description = null,Object? rating = null,Object? quantity = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_CategoryDetailsState(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

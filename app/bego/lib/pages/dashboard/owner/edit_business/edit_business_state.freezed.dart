// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_business_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditBusinessState {

 String get tenantId; String get businessId; String get businessName; String get businessDescription; Map<String, dynamic> get businessDetails; bool get isLoading; bool get isSaving;
/// Create a copy of EditBusinessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditBusinessStateCopyWith<EditBusinessState> get copyWith => _$EditBusinessStateCopyWithImpl<EditBusinessState>(this as EditBusinessState, _$identity);

  /// Serializes this EditBusinessState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditBusinessState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.businessDescription, businessDescription) || other.businessDescription == businessDescription)&&const DeepCollectionEquality().equals(other.businessDetails, businessDetails)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,businessName,businessDescription,const DeepCollectionEquality().hash(businessDetails),isLoading,isSaving);

@override
String toString() {
  return 'EditBusinessState(tenantId: $tenantId, businessId: $businessId, businessName: $businessName, businessDescription: $businessDescription, businessDetails: $businessDetails, isLoading: $isLoading, isSaving: $isSaving)';
}


}

/// @nodoc
abstract mixin class $EditBusinessStateCopyWith<$Res>  {
  factory $EditBusinessStateCopyWith(EditBusinessState value, $Res Function(EditBusinessState) _then) = _$EditBusinessStateCopyWithImpl;
@useResult
$Res call({
 String tenantId, String businessId, String businessName, String businessDescription, Map<String, dynamic> businessDetails, bool isLoading, bool isSaving
});




}
/// @nodoc
class _$EditBusinessStateCopyWithImpl<$Res>
    implements $EditBusinessStateCopyWith<$Res> {
  _$EditBusinessStateCopyWithImpl(this._self, this._then);

  final EditBusinessState _self;
  final $Res Function(EditBusinessState) _then;

/// Create a copy of EditBusinessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? businessId = null,Object? businessName = null,Object? businessDescription = null,Object? businessDetails = null,Object? isLoading = null,Object? isSaving = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,businessName: null == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String,businessDescription: null == businessDescription ? _self.businessDescription : businessDescription // ignore: cast_nullable_to_non_nullable
as String,businessDetails: null == businessDetails ? _self.businessDetails : businessDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EditBusinessState].
extension EditBusinessStatePatterns on EditBusinessState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditBusinessState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditBusinessState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditBusinessState value)  $default,){
final _that = this;
switch (_that) {
case _EditBusinessState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditBusinessState value)?  $default,){
final _that = this;
switch (_that) {
case _EditBusinessState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  String businessName,  String businessDescription,  Map<String, dynamic> businessDetails,  bool isLoading,  bool isSaving)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditBusinessState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.businessName,_that.businessDescription,_that.businessDetails,_that.isLoading,_that.isSaving);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  String businessName,  String businessDescription,  Map<String, dynamic> businessDetails,  bool isLoading,  bool isSaving)  $default,) {final _that = this;
switch (_that) {
case _EditBusinessState():
return $default(_that.tenantId,_that.businessId,_that.businessName,_that.businessDescription,_that.businessDetails,_that.isLoading,_that.isSaving);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantId,  String businessId,  String businessName,  String businessDescription,  Map<String, dynamic> businessDetails,  bool isLoading,  bool isSaving)?  $default,) {final _that = this;
switch (_that) {
case _EditBusinessState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.businessName,_that.businessDescription,_that.businessDetails,_that.isLoading,_that.isSaving);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditBusinessState extends EditBusinessState {
  const _EditBusinessState({required this.tenantId, required this.businessId, this.businessName = '', this.businessDescription = '', final  Map<String, dynamic> businessDetails = const {}, this.isLoading = false, this.isSaving = false}): _businessDetails = businessDetails,super._();
  factory _EditBusinessState.fromJson(Map<String, dynamic> json) => _$EditBusinessStateFromJson(json);

@override final  String tenantId;
@override final  String businessId;
@override@JsonKey() final  String businessName;
@override@JsonKey() final  String businessDescription;
 final  Map<String, dynamic> _businessDetails;
@override@JsonKey() Map<String, dynamic> get businessDetails {
  if (_businessDetails is EqualUnmodifiableMapView) return _businessDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_businessDetails);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;

/// Create a copy of EditBusinessState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditBusinessStateCopyWith<_EditBusinessState> get copyWith => __$EditBusinessStateCopyWithImpl<_EditBusinessState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditBusinessStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditBusinessState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.businessDescription, businessDescription) || other.businessDescription == businessDescription)&&const DeepCollectionEquality().equals(other._businessDetails, _businessDetails)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,businessName,businessDescription,const DeepCollectionEquality().hash(_businessDetails),isLoading,isSaving);

@override
String toString() {
  return 'EditBusinessState(tenantId: $tenantId, businessId: $businessId, businessName: $businessName, businessDescription: $businessDescription, businessDetails: $businessDetails, isLoading: $isLoading, isSaving: $isSaving)';
}


}

/// @nodoc
abstract mixin class _$EditBusinessStateCopyWith<$Res> implements $EditBusinessStateCopyWith<$Res> {
  factory _$EditBusinessStateCopyWith(_EditBusinessState value, $Res Function(_EditBusinessState) _then) = __$EditBusinessStateCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, String businessId, String businessName, String businessDescription, Map<String, dynamic> businessDetails, bool isLoading, bool isSaving
});




}
/// @nodoc
class __$EditBusinessStateCopyWithImpl<$Res>
    implements _$EditBusinessStateCopyWith<$Res> {
  __$EditBusinessStateCopyWithImpl(this._self, this._then);

  final _EditBusinessState _self;
  final $Res Function(_EditBusinessState) _then;

/// Create a copy of EditBusinessState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? businessId = null,Object? businessName = null,Object? businessDescription = null,Object? businessDetails = null,Object? isLoading = null,Object? isSaving = null,}) {
  return _then(_EditBusinessState(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,businessName: null == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String,businessDescription: null == businessDescription ? _self.businessDescription : businessDescription // ignore: cast_nullable_to_non_nullable
as String,businessDetails: null == businessDetails ? _self._businessDetails : businessDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

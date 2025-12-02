// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcements_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnouncementsState {

 String get tenantId; String get businessId; List<String> get announcements; bool get isLoading; bool get isCreating;
/// Create a copy of AnnouncementsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnouncementsStateCopyWith<AnnouncementsState> get copyWith => _$AnnouncementsStateCopyWithImpl<AnnouncementsState>(this as AnnouncementsState, _$identity);

  /// Serializes this AnnouncementsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnouncementsState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&const DeepCollectionEquality().equals(other.announcements, announcements)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,const DeepCollectionEquality().hash(announcements),isLoading,isCreating);

@override
String toString() {
  return 'AnnouncementsState(tenantId: $tenantId, businessId: $businessId, announcements: $announcements, isLoading: $isLoading, isCreating: $isCreating)';
}


}

/// @nodoc
abstract mixin class $AnnouncementsStateCopyWith<$Res>  {
  factory $AnnouncementsStateCopyWith(AnnouncementsState value, $Res Function(AnnouncementsState) _then) = _$AnnouncementsStateCopyWithImpl;
@useResult
$Res call({
 String tenantId, String businessId, List<String> announcements, bool isLoading, bool isCreating
});




}
/// @nodoc
class _$AnnouncementsStateCopyWithImpl<$Res>
    implements $AnnouncementsStateCopyWith<$Res> {
  _$AnnouncementsStateCopyWithImpl(this._self, this._then);

  final AnnouncementsState _self;
  final $Res Function(AnnouncementsState) _then;

/// Create a copy of AnnouncementsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? businessId = null,Object? announcements = null,Object? isLoading = null,Object? isCreating = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,announcements: null == announcements ? _self.announcements : announcements // ignore: cast_nullable_to_non_nullable
as List<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnouncementsState].
extension AnnouncementsStatePatterns on AnnouncementsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnouncementsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnouncementsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnouncementsState value)  $default,){
final _that = this;
switch (_that) {
case _AnnouncementsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnouncementsState value)?  $default,){
final _that = this;
switch (_that) {
case _AnnouncementsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  List<String> announcements,  bool isLoading,  bool isCreating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnouncementsState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.announcements,_that.isLoading,_that.isCreating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantId,  String businessId,  List<String> announcements,  bool isLoading,  bool isCreating)  $default,) {final _that = this;
switch (_that) {
case _AnnouncementsState():
return $default(_that.tenantId,_that.businessId,_that.announcements,_that.isLoading,_that.isCreating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantId,  String businessId,  List<String> announcements,  bool isLoading,  bool isCreating)?  $default,) {final _that = this;
switch (_that) {
case _AnnouncementsState() when $default != null:
return $default(_that.tenantId,_that.businessId,_that.announcements,_that.isLoading,_that.isCreating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnouncementsState extends AnnouncementsState {
  const _AnnouncementsState({required this.tenantId, required this.businessId, final  List<String> announcements = const [], this.isLoading = false, this.isCreating = false}): _announcements = announcements,super._();
  factory _AnnouncementsState.fromJson(Map<String, dynamic> json) => _$AnnouncementsStateFromJson(json);

@override final  String tenantId;
@override final  String businessId;
 final  List<String> _announcements;
@override@JsonKey() List<String> get announcements {
  if (_announcements is EqualUnmodifiableListView) return _announcements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_announcements);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isCreating;

/// Create a copy of AnnouncementsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnouncementsStateCopyWith<_AnnouncementsState> get copyWith => __$AnnouncementsStateCopyWithImpl<_AnnouncementsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnouncementsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnouncementsState&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&const DeepCollectionEquality().equals(other._announcements, _announcements)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,businessId,const DeepCollectionEquality().hash(_announcements),isLoading,isCreating);

@override
String toString() {
  return 'AnnouncementsState(tenantId: $tenantId, businessId: $businessId, announcements: $announcements, isLoading: $isLoading, isCreating: $isCreating)';
}


}

/// @nodoc
abstract mixin class _$AnnouncementsStateCopyWith<$Res> implements $AnnouncementsStateCopyWith<$Res> {
  factory _$AnnouncementsStateCopyWith(_AnnouncementsState value, $Res Function(_AnnouncementsState) _then) = __$AnnouncementsStateCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, String businessId, List<String> announcements, bool isLoading, bool isCreating
});




}
/// @nodoc
class __$AnnouncementsStateCopyWithImpl<$Res>
    implements _$AnnouncementsStateCopyWith<$Res> {
  __$AnnouncementsStateCopyWithImpl(this._self, this._then);

  final _AnnouncementsState _self;
  final $Res Function(_AnnouncementsState) _then;

/// Create a copy of AnnouncementsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? businessId = null,Object? announcements = null,Object? isLoading = null,Object? isCreating = null,}) {
  return _then(_AnnouncementsState(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,announcements: null == announcements ? _self._announcements : announcements // ignore: cast_nullable_to_non_nullable
as List<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

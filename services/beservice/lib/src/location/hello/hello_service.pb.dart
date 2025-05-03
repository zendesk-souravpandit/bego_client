//
//  Generated code. Do not modify.
//  source: location/hello/hello_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $4;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Persion extends $pb.GeneratedMessage {
  factory Persion({
    $core.int? id,
    $core.String? title,
    $core.String? description,
    $core.bool? completed,
    $core.String? name,
    $core.int? age,
    $4.Timestamp? purchaseDate,
    $4.Timestamp? deliveryDate,
    $core.String? price,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (completed != null) {
      $result.completed = completed;
    }
    if (name != null) {
      $result.name = name;
    }
    if (age != null) {
      $result.age = age;
    }
    if (purchaseDate != null) {
      $result.purchaseDate = purchaseDate;
    }
    if (deliveryDate != null) {
      $result.deliveryDate = deliveryDate;
    }
    if (price != null) {
      $result.price = price;
    }
    return $result;
  }
  Persion._() : super();
  factory Persion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Persion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Persion', package: const $pb.PackageName(_omitMessageNames ? '' : 'location.hello'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOB(4, _omitFieldNames ? '' : 'completed')
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'age', $pb.PbFieldType.O3)
    ..aOM<$4.Timestamp>(7, _omitFieldNames ? '' : 'purchaseDate', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(8, _omitFieldNames ? '' : 'deliveryDate', subBuilder: $4.Timestamp.create)
    ..aOS(9, _omitFieldNames ? '' : 'price')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Persion clone() => Persion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Persion copyWith(void Function(Persion) updates) => super.copyWith((message) => updates(message as Persion)) as Persion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Persion create() => Persion._();
  Persion createEmptyInstance() => create();
  static $pb.PbList<Persion> createRepeated() => $pb.PbList<Persion>();
  @$core.pragma('dart2js:noInline')
  static Persion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Persion>(create);
  static Persion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// User's title, must be at least 1 character long.
  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get completed => $_getBF(3);
  @$pb.TagNumber(4)
  set completed($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompleted() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompleted() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get age => $_getIZ(5);
  @$pb.TagNumber(6)
  set age($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAge() => $_clearField(6);

  @$pb.TagNumber(7)
  $4.Timestamp get purchaseDate => $_getN(6);
  @$pb.TagNumber(7)
  set purchaseDate($4.Timestamp v) { $_setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPurchaseDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearPurchaseDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $4.Timestamp ensurePurchaseDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $4.Timestamp get deliveryDate => $_getN(7);
  @$pb.TagNumber(8)
  set deliveryDate($4.Timestamp v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDeliveryDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeliveryDate() => $_clearField(8);
  @$pb.TagNumber(8)
  $4.Timestamp ensureDeliveryDate() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get price => $_getSZ(8);
  @$pb.TagNumber(9)
  set price($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrice() => $_clearField(9);
}

class CreatePersionRequest extends $pb.GeneratedMessage {
  factory CreatePersionRequest({
    $core.String? title,
    $core.String? description,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  CreatePersionRequest._() : super();
  factory CreatePersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePersionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'location.hello'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePersionRequest clone() => CreatePersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePersionRequest copyWith(void Function(CreatePersionRequest) updates) => super.copyWith((message) => updates(message as CreatePersionRequest)) as CreatePersionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePersionRequest create() => CreatePersionRequest._();
  CreatePersionRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePersionRequest> createRepeated() => $pb.PbList<CreatePersionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePersionRequest>(create);
  static CreatePersionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);
}

class CreatePersionResponse extends $pb.GeneratedMessage {
  factory CreatePersionResponse({
    Persion? persion,
  }) {
    final $result = create();
    if (persion != null) {
      $result.persion = persion;
    }
    return $result;
  }
  CreatePersionResponse._() : super();
  factory CreatePersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePersionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'location.hello'), createEmptyInstance: create)
    ..aOM<Persion>(1, _omitFieldNames ? '' : 'persion', subBuilder: Persion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePersionResponse clone() => CreatePersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePersionResponse copyWith(void Function(CreatePersionResponse) updates) => super.copyWith((message) => updates(message as CreatePersionResponse)) as CreatePersionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePersionResponse create() => CreatePersionResponse._();
  CreatePersionResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePersionResponse> createRepeated() => $pb.PbList<CreatePersionResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePersionResponse>(create);
  static CreatePersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Persion get persion => $_getN(0);
  @$pb.TagNumber(1)
  set persion(Persion v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersion() => $_clearField(1);
  @$pb.TagNumber(1)
  Persion ensurePersion() => $_ensure(0);
}

class ReadPersionRequest extends $pb.GeneratedMessage {
  factory ReadPersionRequest({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  ReadPersionRequest._() : super();
  factory ReadPersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadPersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadPersionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'location.hello'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadPersionRequest clone() => ReadPersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadPersionRequest copyWith(void Function(ReadPersionRequest) updates) => super.copyWith((message) => updates(message as ReadPersionRequest)) as ReadPersionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadPersionRequest create() => ReadPersionRequest._();
  ReadPersionRequest createEmptyInstance() => create();
  static $pb.PbList<ReadPersionRequest> createRepeated() => $pb.PbList<ReadPersionRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadPersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadPersionRequest>(create);
  static ReadPersionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class ReadPersionResponse extends $pb.GeneratedMessage {
  factory ReadPersionResponse({
    Persion? persion,
  }) {
    final $result = create();
    if (persion != null) {
      $result.persion = persion;
    }
    return $result;
  }
  ReadPersionResponse._() : super();
  factory ReadPersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadPersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadPersionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'location.hello'), createEmptyInstance: create)
    ..aOM<Persion>(1, _omitFieldNames ? '' : 'persion', subBuilder: Persion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadPersionResponse clone() => ReadPersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadPersionResponse copyWith(void Function(ReadPersionResponse) updates) => super.copyWith((message) => updates(message as ReadPersionResponse)) as ReadPersionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadPersionResponse create() => ReadPersionResponse._();
  ReadPersionResponse createEmptyInstance() => create();
  static $pb.PbList<ReadPersionResponse> createRepeated() => $pb.PbList<ReadPersionResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadPersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadPersionResponse>(create);
  static ReadPersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Persion get persion => $_getN(0);
  @$pb.TagNumber(1)
  set persion(Persion v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersion() => $_clearField(1);
  @$pb.TagNumber(1)
  Persion ensurePersion() => $_ensure(0);
}

class UpdatePersionRequest extends $pb.GeneratedMessage {
  factory UpdatePersionRequest({
    $core.int? id,
    $core.String? title,
    $core.String? description,
    $core.bool? completed,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (completed != null) {
      $result.completed = completed;
    }
    return $result;
  }
  UpdatePersionRequest._() : super();
  factory UpdatePersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePersionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'location.hello'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOB(4, _omitFieldNames ? '' : 'completed')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePersionRequest clone() => UpdatePersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePersionRequest copyWith(void Function(UpdatePersionRequest) updates) => super.copyWith((message) => updates(message as UpdatePersionRequest)) as UpdatePersionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePersionRequest create() => UpdatePersionRequest._();
  UpdatePersionRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePersionRequest> createRepeated() => $pb.PbList<UpdatePersionRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePersionRequest>(create);
  static UpdatePersionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get completed => $_getBF(3);
  @$pb.TagNumber(4)
  set completed($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompleted() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompleted() => $_clearField(4);
}

class UpdatePersionResponse extends $pb.GeneratedMessage {
  factory UpdatePersionResponse({
    Persion? persion,
  }) {
    final $result = create();
    if (persion != null) {
      $result.persion = persion;
    }
    return $result;
  }
  UpdatePersionResponse._() : super();
  factory UpdatePersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePersionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'location.hello'), createEmptyInstance: create)
    ..aOM<Persion>(1, _omitFieldNames ? '' : 'persion', subBuilder: Persion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePersionResponse clone() => UpdatePersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePersionResponse copyWith(void Function(UpdatePersionResponse) updates) => super.copyWith((message) => updates(message as UpdatePersionResponse)) as UpdatePersionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePersionResponse create() => UpdatePersionResponse._();
  UpdatePersionResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePersionResponse> createRepeated() => $pb.PbList<UpdatePersionResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePersionResponse>(create);
  static UpdatePersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Persion get persion => $_getN(0);
  @$pb.TagNumber(1)
  set persion(Persion v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersion() => $_clearField(1);
  @$pb.TagNumber(1)
  Persion ensurePersion() => $_ensure(0);
}

class DeletePersionRequest extends $pb.GeneratedMessage {
  factory DeletePersionRequest({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeletePersionRequest._() : super();
  factory DeletePersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePersionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'location.hello'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePersionRequest clone() => DeletePersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePersionRequest copyWith(void Function(DeletePersionRequest) updates) => super.copyWith((message) => updates(message as DeletePersionRequest)) as DeletePersionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePersionRequest create() => DeletePersionRequest._();
  DeletePersionRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePersionRequest> createRepeated() => $pb.PbList<DeletePersionRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePersionRequest>(create);
  static DeletePersionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class DeletePersionResponse extends $pb.GeneratedMessage {
  factory DeletePersionResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeletePersionResponse._() : super();
  factory DeletePersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePersionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'location.hello'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePersionResponse clone() => DeletePersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePersionResponse copyWith(void Function(DeletePersionResponse) updates) => super.copyWith((message) => updates(message as DeletePersionResponse)) as DeletePersionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePersionResponse create() => DeletePersionResponse._();
  DeletePersionResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePersionResponse> createRepeated() => $pb.PbList<DeletePersionResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePersionResponse>(create);
  static DeletePersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class PersionServiceApi {
  $pb.RpcClient _client;
  PersionServiceApi(this._client);

  $async.Future<CreatePersionResponse> createPersion($pb.ClientContext? ctx, CreatePersionRequest request) =>
    _client.invoke<CreatePersionResponse>(ctx, 'PersionService', 'CreatePersion', request, CreatePersionResponse())
  ;
  $async.Future<ReadPersionResponse> readPersion($pb.ClientContext? ctx, ReadPersionRequest request) =>
    _client.invoke<ReadPersionResponse>(ctx, 'PersionService', 'ReadPersion', request, ReadPersionResponse())
  ;
  $async.Future<UpdatePersionResponse> updatePersion($pb.ClientContext? ctx, UpdatePersionRequest request) =>
    _client.invoke<UpdatePersionResponse>(ctx, 'PersionService', 'UpdatePersion', request, UpdatePersionResponse())
  ;
  $async.Future<DeletePersionResponse> deletePersion($pb.ClientContext? ctx, DeletePersionRequest request) =>
    _client.invoke<DeletePersionResponse>(ctx, 'PersionService', 'DeletePersion', request, DeletePersionResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

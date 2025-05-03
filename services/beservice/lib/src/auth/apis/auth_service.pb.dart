//
//  Generated code. Do not modify.
//  source: auth/apis/auth_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'auth_service.pbenum.dart';

export 'auth_service.pbenum.dart';

/// HealthCheckRequest represents a request to check the health of a service.
class AuthStartRequest extends $pb.GeneratedMessage {
  factory AuthStartRequest() => create();
  AuthStartRequest._() : super();
  factory AuthStartRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthStartRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthStartRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'auth.apis'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthStartRequest clone() => AuthStartRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthStartRequest copyWith(void Function(AuthStartRequest) updates) => super.copyWith((message) => updates(message as AuthStartRequest)) as AuthStartRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthStartRequest create() => AuthStartRequest._();
  AuthStartRequest createEmptyInstance() => create();
  static $pb.PbList<AuthStartRequest> createRepeated() => $pb.PbList<AuthStartRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthStartRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthStartRequest>(create);
  static AuthStartRequest? _defaultInstance;
}

/// HealthCheckResponse represents a response indicating the health status of a service.
class AuthStartResponse extends $pb.GeneratedMessage {
  factory AuthStartResponse({
    AuthStartResponse_Status? status,
    $core.String? message,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  AuthStartResponse._() : super();
  factory AuthStartResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthStartResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthStartResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'auth.apis'), createEmptyInstance: create)
    ..e<AuthStartResponse_Status>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: AuthStartResponse_Status.STATUS_UNSPECIFIED, valueOf: AuthStartResponse_Status.valueOf, enumValues: AuthStartResponse_Status.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthStartResponse clone() => AuthStartResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthStartResponse copyWith(void Function(AuthStartResponse) updates) => super.copyWith((message) => updates(message as AuthStartResponse)) as AuthStartResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthStartResponse create() => AuthStartResponse._();
  AuthStartResponse createEmptyInstance() => create();
  static $pb.PbList<AuthStartResponse> createRepeated() => $pb.PbList<AuthStartResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthStartResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthStartResponse>(create);
  static AuthStartResponse? _defaultInstance;

  /// Status of the service.
  @$pb.TagNumber(1)
  AuthStartResponse_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(AuthStartResponse_Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  /// Additional details or error messages can be included here.
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

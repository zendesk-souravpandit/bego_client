//
//  Generated code. Do not modify.
//  source: healthcheck/apis/health_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'health_service.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'health_service.pbenum.dart';

/// HealthCheckRequest represents a request to check the health of a service.
class CheckHealthServiceRequest extends $pb.GeneratedMessage {
  factory CheckHealthServiceRequest() => create();
  CheckHealthServiceRequest._() : super();
  factory CheckHealthServiceRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CheckHealthServiceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckHealthServiceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'healthcheck.apis'), createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CheckHealthServiceRequest clone() => CheckHealthServiceRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CheckHealthServiceRequest copyWith(void Function(CheckHealthServiceRequest) updates) =>
      super.copyWith((message) => updates(message as CheckHealthServiceRequest)) as CheckHealthServiceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckHealthServiceRequest create() => CheckHealthServiceRequest._();
  CheckHealthServiceRequest createEmptyInstance() => create();
  static $pb.PbList<CheckHealthServiceRequest> createRepeated() => $pb.PbList<CheckHealthServiceRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckHealthServiceRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckHealthServiceRequest>(create);
  static CheckHealthServiceRequest? _defaultInstance;
}

/// HealthCheckResponse represents a response indicating the health status of a service.
class CheckHealthServiceResponse extends $pb.GeneratedMessage {
  factory CheckHealthServiceResponse({
    CheckHealthServiceResponse_Status? status,
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
  CheckHealthServiceResponse._() : super();
  factory CheckHealthServiceResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CheckHealthServiceResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckHealthServiceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'healthcheck.apis'), createEmptyInstance: create)
    ..e<CheckHealthServiceResponse_Status>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: CheckHealthServiceResponse_Status.STATUS_UNSPECIFIED,
        valueOf: CheckHealthServiceResponse_Status.valueOf,
        enumValues: CheckHealthServiceResponse_Status.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CheckHealthServiceResponse clone() => CheckHealthServiceResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CheckHealthServiceResponse copyWith(void Function(CheckHealthServiceResponse) updates) =>
      super.copyWith((message) => updates(message as CheckHealthServiceResponse)) as CheckHealthServiceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckHealthServiceResponse create() => CheckHealthServiceResponse._();
  CheckHealthServiceResponse createEmptyInstance() => create();
  static $pb.PbList<CheckHealthServiceResponse> createRepeated() => $pb.PbList<CheckHealthServiceResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckHealthServiceResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckHealthServiceResponse>(create);
  static CheckHealthServiceResponse? _defaultInstance;

  /// Status of the service.
  @$pb.TagNumber(1)
  CheckHealthServiceResponse_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(CheckHealthServiceResponse_Status v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  /// Additional details or error messages can be included here.
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// HealthCheckService is the service definition for health check operations.
class HealthCheckServiceApi {
  $pb.RpcClient _client;
  HealthCheckServiceApi(this._client);

  /// CheckHealthService is the RPC method to check the health of the service.
  $async.Future<CheckHealthServiceResponse> checkHealthService(
          $pb.ClientContext? ctx, CheckHealthServiceRequest request) =>
      _client.invoke<CheckHealthServiceResponse>(
          ctx, 'HealthCheckService', 'CheckHealthService', request, CheckHealthServiceResponse());
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

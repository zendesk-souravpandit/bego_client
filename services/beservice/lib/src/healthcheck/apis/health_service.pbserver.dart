//
//  Generated code. Do not modify.
//  source: healthcheck/apis/health_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'health_service.pb.dart' as $6;
import 'health_service.pbjson.dart';

export 'health_service.pb.dart';

abstract class HealthCheckServiceBase extends $pb.GeneratedService {
  $async.Future<$6.CheckHealthServiceResponse> checkHealthService($pb.ServerContext ctx, $6.CheckHealthServiceRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CheckHealthService': return $6.CheckHealthServiceRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CheckHealthService': return this.checkHealthService(ctx, request as $6.CheckHealthServiceRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => HealthCheckServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => HealthCheckServiceBase$messageJson;
}


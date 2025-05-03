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

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'health_service.pb.dart' as $1;

export 'health_service.pb.dart';

@$pb.GrpcServiceName('healthcheck.apis.HealthCheckService')
class HealthCheckServiceClient extends $grpc.Client {
  static final _$checkHealthService = $grpc.ClientMethod<$1.CheckHealthServiceRequest, $1.CheckHealthServiceResponse>(
      '/healthcheck.apis.HealthCheckService/CheckHealthService',
      ($1.CheckHealthServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CheckHealthServiceResponse.fromBuffer(value));

  HealthCheckServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.CheckHealthServiceResponse> checkHealthService($1.CheckHealthServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkHealthService, request, options: options);
  }
}

@$pb.GrpcServiceName('healthcheck.apis.HealthCheckService')
abstract class HealthCheckServiceBase extends $grpc.Service {
  $core.String get $name => 'healthcheck.apis.HealthCheckService';

  HealthCheckServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.CheckHealthServiceRequest, $1.CheckHealthServiceResponse>(
        'CheckHealthService',
        checkHealthService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CheckHealthServiceRequest.fromBuffer(value),
        ($1.CheckHealthServiceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.CheckHealthServiceResponse> checkHealthService_Pre($grpc.ServiceCall $call, $async.Future<$1.CheckHealthServiceRequest> $request) async {
    return checkHealthService($call, await $request);
  }

  $async.Future<$1.CheckHealthServiceResponse> checkHealthService($grpc.ServiceCall call, $1.CheckHealthServiceRequest request);
}

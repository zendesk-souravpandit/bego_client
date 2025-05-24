//
//  Generated code. Do not modify.
//  source: auth/apis/auth_service.proto
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

import 'auth_service.pb.dart' as $2;

export 'auth_service.pb.dart';

@$pb.GrpcServiceName('auth.apis.AuthService')
class AuthServiceClient extends $grpc.Client {
  static final _$authStart = $grpc.ClientMethod<$2.AuthStartRequest, $2.AuthStartResponse>(
      '/auth.apis.AuthService/AuthStart',
      ($2.AuthStartRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.AuthStartResponse.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options, $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.AuthStartResponse> authStart($2.AuthStartRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authStart, request, options: options);
  }
}

@$pb.GrpcServiceName('auth.apis.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.apis.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.AuthStartRequest, $2.AuthStartResponse>(
        'AuthStart',
        authStart_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.AuthStartRequest.fromBuffer(value),
        ($2.AuthStartResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.AuthStartResponse> authStart_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.AuthStartRequest> $request) async {
    return authStart($call, await $request);
  }

  $async.Future<$2.AuthStartResponse> authStart($grpc.ServiceCall call, $2.AuthStartRequest request);
}

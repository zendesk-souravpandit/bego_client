//
//  Generated code. Do not modify.
//  source: location/hello/hello_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'hello_service.pb.dart' as $0;

export 'hello_service.pb.dart';

@$pb.GrpcServiceName('location.hello.PersionService')
class PersionServiceClient extends $grpc.Client {
  static final _$createPersion = $grpc.ClientMethod<$0.CreatePersionRequest, $0.CreatePersionResponse>(
      '/location.hello.PersionService/CreatePersion',
      ($0.CreatePersionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreatePersionResponse.fromBuffer(value));
  static final _$readPersion = $grpc.ClientMethod<$0.ReadPersionRequest, $0.ReadPersionResponse>(
      '/location.hello.PersionService/ReadPersion',
      ($0.ReadPersionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReadPersionResponse.fromBuffer(value));
  static final _$updatePersion = $grpc.ClientMethod<$0.UpdatePersionRequest, $0.UpdatePersionResponse>(
      '/location.hello.PersionService/UpdatePersion',
      ($0.UpdatePersionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdatePersionResponse.fromBuffer(value));
  static final _$deletePersion = $grpc.ClientMethod<$0.DeletePersionRequest, $0.DeletePersionResponse>(
      '/location.hello.PersionService/DeletePersion',
      ($0.DeletePersionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeletePersionResponse.fromBuffer(value));

  PersionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreatePersionResponse> createPersion($0.CreatePersionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPersion, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReadPersionResponse> readPersion($0.ReadPersionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readPersion, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePersionResponse> updatePersion($0.UpdatePersionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePersion, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeletePersionResponse> deletePersion($0.DeletePersionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePersion, request, options: options);
  }
}

@$pb.GrpcServiceName('location.hello.PersionService')
abstract class PersionServiceBase extends $grpc.Service {
  $core.String get $name => 'location.hello.PersionService';

  PersionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreatePersionRequest, $0.CreatePersionResponse>(
        'CreatePersion',
        createPersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreatePersionRequest.fromBuffer(value),
        ($0.CreatePersionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReadPersionRequest, $0.ReadPersionResponse>(
        'ReadPersion',
        readPersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReadPersionRequest.fromBuffer(value),
        ($0.ReadPersionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePersionRequest, $0.UpdatePersionResponse>(
        'UpdatePersion',
        updatePersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdatePersionRequest.fromBuffer(value),
        ($0.UpdatePersionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeletePersionRequest, $0.DeletePersionResponse>(
        'DeletePersion',
        deletePersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeletePersionRequest.fromBuffer(value),
        ($0.DeletePersionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreatePersionResponse> createPersion_Pre($grpc.ServiceCall call, $async.Future<$0.CreatePersionRequest> request) async {
    return createPersion(call, await request);
  }

  $async.Future<$0.ReadPersionResponse> readPersion_Pre($grpc.ServiceCall call, $async.Future<$0.ReadPersionRequest> request) async {
    return readPersion(call, await request);
  }

  $async.Future<$0.UpdatePersionResponse> updatePersion_Pre($grpc.ServiceCall call, $async.Future<$0.UpdatePersionRequest> request) async {
    return updatePersion(call, await request);
  }

  $async.Future<$0.DeletePersionResponse> deletePersion_Pre($grpc.ServiceCall call, $async.Future<$0.DeletePersionRequest> request) async {
    return deletePersion(call, await request);
  }

  $async.Future<$0.CreatePersionResponse> createPersion($grpc.ServiceCall call, $0.CreatePersionRequest request);
  $async.Future<$0.ReadPersionResponse> readPersion($grpc.ServiceCall call, $0.ReadPersionRequest request);
  $async.Future<$0.UpdatePersionResponse> updatePersion($grpc.ServiceCall call, $0.UpdatePersionRequest request);
  $async.Future<$0.DeletePersionResponse> deletePersion($grpc.ServiceCall call, $0.DeletePersionRequest request);
}

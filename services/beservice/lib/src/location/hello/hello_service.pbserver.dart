//
//  Generated code. Do not modify.
//  source: location/hello/hello_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'hello_service.pb.dart' as $7;
import 'hello_service.pbjson.dart';

export 'hello_service.pb.dart';

abstract class PersionServiceBase extends $pb.GeneratedService {
  $async.Future<$7.CreatePersionResponse> createPersion($pb.ServerContext ctx, $7.CreatePersionRequest request);
  $async.Future<$7.ReadPersionResponse> readPersion($pb.ServerContext ctx, $7.ReadPersionRequest request);
  $async.Future<$7.UpdatePersionResponse> updatePersion($pb.ServerContext ctx, $7.UpdatePersionRequest request);
  $async.Future<$7.DeletePersionResponse> deletePersion($pb.ServerContext ctx, $7.DeletePersionRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreatePersion': return $7.CreatePersionRequest();
      case 'ReadPersion': return $7.ReadPersionRequest();
      case 'UpdatePersion': return $7.UpdatePersionRequest();
      case 'DeletePersion': return $7.DeletePersionRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreatePersion': return this.createPersion(ctx, request as $7.CreatePersionRequest);
      case 'ReadPersion': return this.readPersion(ctx, request as $7.ReadPersionRequest);
      case 'UpdatePersion': return this.updatePersion(ctx, request as $7.UpdatePersionRequest);
      case 'DeletePersion': return this.deletePersion(ctx, request as $7.DeletePersionRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => PersionServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => PersionServiceBase$messageJson;
}


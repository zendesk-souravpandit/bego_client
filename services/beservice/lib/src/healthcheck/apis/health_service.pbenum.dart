//
//  Generated code. Do not modify.
//  source: healthcheck/apis/health_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Status indicates the health status of the service.
class CheckHealthServiceResponse_Status extends $pb.ProtobufEnum {
  static const CheckHealthServiceResponse_Status STATUS_UNSPECIFIED = CheckHealthServiceResponse_Status._(0, _omitEnumNames ? '' : 'STATUS_UNSPECIFIED');
  static const CheckHealthServiceResponse_Status STATUS_UNKNOWN = CheckHealthServiceResponse_Status._(1, _omitEnumNames ? '' : 'STATUS_UNKNOWN');
  static const CheckHealthServiceResponse_Status STATUS_HEALTHY = CheckHealthServiceResponse_Status._(2, _omitEnumNames ? '' : 'STATUS_HEALTHY');
  static const CheckHealthServiceResponse_Status STATUS_UNHEALTHY = CheckHealthServiceResponse_Status._(3, _omitEnumNames ? '' : 'STATUS_UNHEALTHY');

  static const $core.List<CheckHealthServiceResponse_Status> values = <CheckHealthServiceResponse_Status> [
    STATUS_UNSPECIFIED,
    STATUS_UNKNOWN,
    STATUS_HEALTHY,
    STATUS_UNHEALTHY,
  ];

  static final $core.Map<$core.int, CheckHealthServiceResponse_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CheckHealthServiceResponse_Status? valueOf($core.int value) => _byValue[value];

  const CheckHealthServiceResponse_Status._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

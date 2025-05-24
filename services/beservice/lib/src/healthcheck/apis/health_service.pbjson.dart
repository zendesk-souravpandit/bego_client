//
//  Generated code. Do not modify.
//  source: healthcheck/apis/health_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use checkHealthServiceRequestDescriptor instead')
const CheckHealthServiceRequest$json = {
  '1': 'CheckHealthServiceRequest',
};

/// Descriptor for `CheckHealthServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkHealthServiceRequestDescriptor =
    $convert.base64Decode('ChlDaGVja0hlYWx0aFNlcnZpY2VSZXF1ZXN0');

@$core.Deprecated('Use checkHealthServiceResponseDescriptor instead')
const CheckHealthServiceResponse$json = {
  '1': 'CheckHealthServiceResponse',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.healthcheck.apis.CheckHealthServiceResponse.Status',
      '10': 'status'
    },
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
  '4': [CheckHealthServiceResponse_Status$json],
};

@$core.Deprecated('Use checkHealthServiceResponseDescriptor instead')
const CheckHealthServiceResponse_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'STATUS_UNSPECIFIED', '2': 0},
    {'1': 'STATUS_UNKNOWN', '2': 1},
    {'1': 'STATUS_HEALTHY', '2': 2},
    {'1': 'STATUS_UNHEALTHY', '2': 3},
  ],
};

/// Descriptor for `CheckHealthServiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkHealthServiceResponseDescriptor =
    $convert.base64Decode('ChpDaGVja0hlYWx0aFNlcnZpY2VSZXNwb25zZRJLCgZzdGF0dXMYASABKA4yMy5oZWFsdGhjaG'
        'Vjay5hcGlzLkNoZWNrSGVhbHRoU2VydmljZVJlc3BvbnNlLlN0YXR1c1IGc3RhdHVzEhgKB21l'
        'c3NhZ2UYAiABKAlSB21lc3NhZ2UiXgoGU3RhdHVzEhYKElNUQVRVU19VTlNQRUNJRklFRBAAEh'
        'IKDlNUQVRVU19VTktOT1dOEAESEgoOU1RBVFVTX0hFQUxUSFkQAhIUChBTVEFUVVNfVU5IRUFM'
        'VEhZEAM=');

const $core.Map<$core.String, $core.dynamic> HealthCheckServiceBase$json = {
  '1': 'HealthCheckService',
  '2': [
    {
      '1': 'CheckHealthService',
      '2': '.healthcheck.apis.CheckHealthServiceRequest',
      '3': '.healthcheck.apis.CheckHealthServiceResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use healthCheckServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> HealthCheckServiceBase$messageJson = {
  '.healthcheck.apis.CheckHealthServiceRequest': CheckHealthServiceRequest$json,
  '.healthcheck.apis.CheckHealthServiceResponse': CheckHealthServiceResponse$json,
};

/// Descriptor for `HealthCheckService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List healthCheckServiceDescriptor =
    $convert.base64Decode('ChJIZWFsdGhDaGVja1NlcnZpY2UScQoSQ2hlY2tIZWFsdGhTZXJ2aWNlEisuaGVhbHRoY2hlY2'
        'suYXBpcy5DaGVja0hlYWx0aFNlcnZpY2VSZXF1ZXN0GiwuaGVhbHRoY2hlY2suYXBpcy5DaGVj'
        'a0hlYWx0aFNlcnZpY2VSZXNwb25zZSIA');

//
//  Generated code. Do not modify.
//  source: auth/apis/auth_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use authStartRequestDescriptor instead')
const AuthStartRequest$json = {
  '1': 'AuthStartRequest',
};

/// Descriptor for `AuthStartRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authStartRequestDescriptor = $convert.base64Decode(
    'ChBBdXRoU3RhcnRSZXF1ZXN0');

@$core.Deprecated('Use authStartResponseDescriptor instead')
const AuthStartResponse$json = {
  '1': 'AuthStartResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.auth.apis.AuthStartResponse.Status', '10': 'status'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
  '4': [AuthStartResponse_Status$json],
};

@$core.Deprecated('Use authStartResponseDescriptor instead')
const AuthStartResponse_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'STATUS_UNSPECIFIED', '2': 0},
    {'1': 'STATUS_UNKNOWN', '2': 1},
    {'1': 'STATUS_HEALTHY', '2': 2},
    {'1': 'STATUS_UNHEALTHY', '2': 3},
  ],
};

/// Descriptor for `AuthStartResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authStartResponseDescriptor = $convert.base64Decode(
    'ChFBdXRoU3RhcnRSZXNwb25zZRI7CgZzdGF0dXMYASABKA4yIy5hdXRoLmFwaXMuQXV0aFN0YX'
    'J0UmVzcG9uc2UuU3RhdHVzUgZzdGF0dXMSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZSJeCgZT'
    'dGF0dXMSFgoSU1RBVFVTX1VOU1BFQ0lGSUVEEAASEgoOU1RBVFVTX1VOS05PV04QARISCg5TVE'
    'FUVVNfSEVBTFRIWRACEhQKEFNUQVRVU19VTkhFQUxUSFkQAw==');


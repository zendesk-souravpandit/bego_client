//
//  Generated code. Do not modify.
//  source: location/hello/hello_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../google/protobuf/timestamp.pbjson.dart' as $4;

@$core.Deprecated('Use persionDescriptor instead')
const Persion$json = {
  '1': 'Persion',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'completed', '3': 4, '4': 1, '5': 8, '10': 'completed'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'age', '3': 6, '4': 1, '5': 5, '8': {}, '10': 'age'},
    {'1': 'purchase_date', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'purchaseDate'},
    {'1': 'delivery_date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'deliveryDate'},
    {'1': 'price', '3': 9, '4': 1, '5': 9, '8': {}, '10': 'price'},
  ],
  '7': {},
};

/// Descriptor for `Persion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List persionDescriptor =
    $convert.base64Decode('CgdQZXJzaW9uEg4KAmlkGAEgASgFUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSIAoLZGVzY3'
        'JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEhwKCWNvbXBsZXRlZBgEIAEoCFIJY29tcGxldGVk'
        'EhsKBG5hbWUYBSABKAlCB7pIBHICEAFSBG5hbWUSWAoDYWdlGAYgASgFQka6SEO6AUAKCHVzZX'
        'IuYWdlGjR0aGlzIDwgMTggPyAnVXNlciBtdXN0IGJlIGF0IGxlYXN0IDE4IHllYXJzIG9sZCc6'
        'ICcnUgNhZ2USPwoNcHVyY2hhc2VfZGF0ZRgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
        'RhbXBSDHB1cmNoYXNlRGF0ZRI/Cg1kZWxpdmVyeV9kYXRlGAggASgLMhouZ29vZ2xlLnByb3Rv'
        'YnVmLlRpbWVzdGFtcFIMZGVsaXZlcnlEYXRlEsoBCgVwcmljZRgJIAEoCUKzAbpIrwG6AasBCh'
        'F0cmFuc2FjdGlvbi5wcmljZRJEcHJpY2UgbXVzdCBiZSBwb3NpdGl2ZSBhbmQgaW5jbHVkZSBh'
        'IHZhbGlkIGN1cnJlbmN5IHN5bWJvbCAoJCBvciDCoykaUCh0aGlzLnN0YXJ0c1dpdGgoJyQnKS'
        'B8fCB0aGlzLnN0YXJ0c1dpdGgoJ8KjJykpICYmIGRvdWJsZSh0aGlzLnN1YnN0cmluZygxKSkg'
        'PiAwUgVwcmljZTp0ukhxGm8KGXRyYW5zYWN0aW9uLmRlbGl2ZXJ5X2RhdGUSKWRlbGl2ZXJ5IG'
        'RhdGUgbXVzdCBiZSBhZnRlciBwdXJjaGFzZSBkYXRlGid0aGlzLmRlbGl2ZXJ5X2RhdGUgPiB0'
        'aGlzLnB1cmNoYXNlX2RhdGU=');

@$core.Deprecated('Use createPersionRequestDescriptor instead')
const CreatePersionRequest$json = {
  '1': 'CreatePersionRequest',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CreatePersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPersionRequestDescriptor =
    $convert.base64Decode('ChRDcmVhdGVQZXJzaW9uUmVxdWVzdBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLZGVzY3JpcH'
        'Rpb24YAiABKAlSC2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use createPersionResponseDescriptor instead')
const CreatePersionResponse$json = {
  '1': 'CreatePersionResponse',
  '2': [
    {'1': 'persion', '3': 1, '4': 1, '5': 11, '6': '.location.hello.Persion', '10': 'persion'},
  ],
};

/// Descriptor for `CreatePersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPersionResponseDescriptor =
    $convert.base64Decode('ChVDcmVhdGVQZXJzaW9uUmVzcG9uc2USMQoHcGVyc2lvbhgBIAEoCzIXLmxvY2F0aW9uLmhlbG'
        'xvLlBlcnNpb25SB3BlcnNpb24=');

@$core.Deprecated('Use readPersionRequestDescriptor instead')
const ReadPersionRequest$json = {
  '1': 'ReadPersionRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `ReadPersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readPersionRequestDescriptor =
    $convert.base64Decode('ChJSZWFkUGVyc2lvblJlcXVlc3QSDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use readPersionResponseDescriptor instead')
const ReadPersionResponse$json = {
  '1': 'ReadPersionResponse',
  '2': [
    {'1': 'persion', '3': 1, '4': 1, '5': 11, '6': '.location.hello.Persion', '10': 'persion'},
  ],
};

/// Descriptor for `ReadPersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readPersionResponseDescriptor =
    $convert.base64Decode('ChNSZWFkUGVyc2lvblJlc3BvbnNlEjEKB3BlcnNpb24YASABKAsyFy5sb2NhdGlvbi5oZWxsby'
        '5QZXJzaW9uUgdwZXJzaW9u');

@$core.Deprecated('Use updatePersionRequestDescriptor instead')
const UpdatePersionRequest$json = {
  '1': 'UpdatePersionRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'completed', '3': 4, '4': 1, '5': 8, '10': 'completed'},
  ],
};

/// Descriptor for `UpdatePersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePersionRequestDescriptor =
    $convert.base64Decode('ChRVcGRhdGVQZXJzaW9uUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBX'
        'RpdGxlEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIcCgljb21wbGV0ZWQYBCAB'
        'KAhSCWNvbXBsZXRlZA==');

@$core.Deprecated('Use updatePersionResponseDescriptor instead')
const UpdatePersionResponse$json = {
  '1': 'UpdatePersionResponse',
  '2': [
    {'1': 'persion', '3': 1, '4': 1, '5': 11, '6': '.location.hello.Persion', '10': 'persion'},
  ],
};

/// Descriptor for `UpdatePersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePersionResponseDescriptor =
    $convert.base64Decode('ChVVcGRhdGVQZXJzaW9uUmVzcG9uc2USMQoHcGVyc2lvbhgBIAEoCzIXLmxvY2F0aW9uLmhlbG'
        'xvLlBlcnNpb25SB3BlcnNpb24=');

@$core.Deprecated('Use deletePersionRequestDescriptor instead')
const DeletePersionRequest$json = {
  '1': 'DeletePersionRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `DeletePersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePersionRequestDescriptor =
    $convert.base64Decode('ChREZWxldGVQZXJzaW9uUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');

@$core.Deprecated('Use deletePersionResponseDescriptor instead')
const DeletePersionResponse$json = {
  '1': 'DeletePersionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeletePersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePersionResponseDescriptor =
    $convert.base64Decode('ChVEZWxldGVQZXJzaW9uUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

const $core.Map<$core.String, $core.dynamic> PersionServiceBase$json = {
  '1': 'PersionService',
  '2': [
    {'1': 'CreatePersion', '2': '.location.hello.CreatePersionRequest', '3': '.location.hello.CreatePersionResponse'},
    {'1': 'ReadPersion', '2': '.location.hello.ReadPersionRequest', '3': '.location.hello.ReadPersionResponse'},
    {'1': 'UpdatePersion', '2': '.location.hello.UpdatePersionRequest', '3': '.location.hello.UpdatePersionResponse'},
    {'1': 'DeletePersion', '2': '.location.hello.DeletePersionRequest', '3': '.location.hello.DeletePersionResponse'},
  ],
};

@$core.Deprecated('Use persionServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> PersionServiceBase$messageJson = {
  '.location.hello.CreatePersionRequest': CreatePersionRequest$json,
  '.location.hello.CreatePersionResponse': CreatePersionResponse$json,
  '.location.hello.Persion': Persion$json,
  '.google.protobuf.Timestamp': $4.Timestamp$json,
  '.location.hello.ReadPersionRequest': ReadPersionRequest$json,
  '.location.hello.ReadPersionResponse': ReadPersionResponse$json,
  '.location.hello.UpdatePersionRequest': UpdatePersionRequest$json,
  '.location.hello.UpdatePersionResponse': UpdatePersionResponse$json,
  '.location.hello.DeletePersionRequest': DeletePersionRequest$json,
  '.location.hello.DeletePersionResponse': DeletePersionResponse$json,
};

/// Descriptor for `PersionService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List persionServiceDescriptor =
    $convert.base64Decode('Cg5QZXJzaW9uU2VydmljZRJcCg1DcmVhdGVQZXJzaW9uEiQubG9jYXRpb24uaGVsbG8uQ3JlYX'
        'RlUGVyc2lvblJlcXVlc3QaJS5sb2NhdGlvbi5oZWxsby5DcmVhdGVQZXJzaW9uUmVzcG9uc2US'
        'VgoLUmVhZFBlcnNpb24SIi5sb2NhdGlvbi5oZWxsby5SZWFkUGVyc2lvblJlcXVlc3QaIy5sb2'
        'NhdGlvbi5oZWxsby5SZWFkUGVyc2lvblJlc3BvbnNlElwKDVVwZGF0ZVBlcnNpb24SJC5sb2Nh'
        'dGlvbi5oZWxsby5VcGRhdGVQZXJzaW9uUmVxdWVzdBolLmxvY2F0aW9uLmhlbGxvLlVwZGF0ZV'
        'BlcnNpb25SZXNwb25zZRJcCg1EZWxldGVQZXJzaW9uEiQubG9jYXRpb24uaGVsbG8uRGVsZXRl'
        'UGVyc2lvblJlcXVlc3QaJS5sb2NhdGlvbi5oZWxsby5EZWxldGVQZXJzaW9uUmVzcG9uc2U=');

//
//  Generated code. Do not modify.
//  source: validate/expression.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use constraintDescriptor instead')
const Constraint$json = {
  '1': 'Constraint',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'expression', '3': 3, '4': 1, '5': 9, '10': 'expression'},
  ],
};

/// Descriptor for `Constraint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List constraintDescriptor =
    $convert.base64Decode('CgpDb25zdHJhaW50Eg4KAmlkGAEgASgJUgJpZBIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEh'
        '4KCmV4cHJlc3Npb24YAyABKAlSCmV4cHJlc3Npb24=');

@$core.Deprecated('Use violationsDescriptor instead')
const Violations$json = {
  '1': 'Violations',
  '2': [
    {'1': 'violations', '3': 1, '4': 3, '5': 11, '6': '.validate.Violation', '10': 'violations'},
  ],
};

/// Descriptor for `Violations`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List violationsDescriptor =
    $convert.base64Decode('CgpWaW9sYXRpb25zEjMKCnZpb2xhdGlvbnMYASADKAsyEy52YWxpZGF0ZS5WaW9sYXRpb25SCn'
        'Zpb2xhdGlvbnM=');

@$core.Deprecated('Use violationDescriptor instead')
const Violation$json = {
  '1': 'Violation',
  '2': [
    {'1': 'field_path', '3': 1, '4': 1, '5': 9, '10': 'fieldPath'},
    {'1': 'constraint_id', '3': 2, '4': 1, '5': 9, '10': 'constraintId'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {'1': 'for_key', '3': 4, '4': 1, '5': 8, '10': 'forKey'},
  ],
};

/// Descriptor for `Violation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List violationDescriptor =
    $convert.base64Decode('CglWaW9sYXRpb24SHQoKZmllbGRfcGF0aBgBIAEoCVIJZmllbGRQYXRoEiMKDWNvbnN0cmFpbn'
        'RfaWQYAiABKAlSDGNvbnN0cmFpbnRJZBIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEhcKB2Zv'
        'cl9rZXkYBCABKAhSBmZvcktleQ==');

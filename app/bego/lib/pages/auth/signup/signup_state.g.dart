// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupState _$SignupStateFromJson(Map<String, dynamic> json) => _SignupState(
  name: json['name'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
  agreeToTerms: json['agreeToTerms'] as bool,
  isLoading: json['isLoading'] as bool,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$SignupStateToJson(_SignupState instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'agreeToTerms': instance.agreeToTerms,
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
    };

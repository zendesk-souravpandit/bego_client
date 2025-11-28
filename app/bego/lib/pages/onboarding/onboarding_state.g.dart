// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) =>
    _OnboardingState(
      currentStep: (json['currentStep'] as num).toInt(),
      onboardingCompleted: json['onboardingCompleted'] as bool,
    );

Map<String, dynamic> _$OnboardingStateToJson(_OnboardingState instance) =>
    <String, dynamic>{
      'currentStep': instance.currentStep,
      'onboardingCompleted': instance.onboardingCompleted,
    };

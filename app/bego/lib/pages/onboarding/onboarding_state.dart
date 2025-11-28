import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    required final int currentStep,
    required final bool onboardingCompleted,
  }) = _OnboardingState;

  factory OnboardingState.initial() =>
      const OnboardingState(currentStep: 0, onboardingCompleted: false);

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);
}

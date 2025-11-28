import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';
part 'signup_state.g.dart';

@freezed
abstract class SignupState with _$SignupState {
  const factory SignupState({
    required final String name,
    required final String email,
    required final String password,
    required final String confirmPassword,
    required final bool agreeToTerms,
    required final bool isLoading,
    required final String? errorMessage,
  }) = _SignupState;

  factory SignupState.initial() => const SignupState(
    name: '',
    email: '',
    password: '',
    confirmPassword: '',
    agreeToTerms: false,
    isLoading: false,
    errorMessage: null,
  );

  factory SignupState.fromJson(Map<String, dynamic> json) =>
      _$SignupStateFromJson(json);
}

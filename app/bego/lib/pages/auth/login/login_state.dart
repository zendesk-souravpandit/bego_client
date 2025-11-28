import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';
part 'login_state.g.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required final String email,
    required final String password,
    required final bool isLoading,
    required final String? errorMessage,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
    email: '',
    password: '',
    isLoading: false,
    errorMessage: null,
  );

  factory LoginState.fromJson(Map<String, dynamic> json) =>
      _$LoginStateFromJson(json);
}

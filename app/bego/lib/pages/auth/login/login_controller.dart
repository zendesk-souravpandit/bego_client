import 'package:bego/pages/auth/login/login_state.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';
import 'package:flutter/foundation.dart' show debugPrint;

class LoginController extends BePageController<LoginState> {
  LoginController();

  @override
  void onInit() {
    super.onInit();
    change(SuccessStatus(LoginState.initial()));
  }

  void updateEmail(final String email) {
    change(SuccessStatus(state.copyWith(email: email)));
  }

  void updatePassword(final String password) {
    change(SuccessStatus(state.copyWith(password: password)));
  }

  Future<void> login() async {
    final currentState = state;

    if (currentState.email.isEmpty || currentState.password.isEmpty) {
      change(
        SuccessStatus(
          currentState.copyWith(
            errorMessage: 'Email and password are required',
          ),
        ),
      );
      return;
    }

    change(
      SuccessStatus(currentState.copyWith(isLoading: true, errorMessage: null)),
    );

    try {
      // Simulate login API call
      await Future<void>.delayed(const Duration(seconds: 2));

      debugPrint('Login successful for: ${currentState.email}');

      change(SuccessStatus(currentState.copyWith(isLoading: false)));

      // Navigate to home
      await Get.offNamed<void>('/home');
    } catch (e) {
      debugPrint('Login error: $e');
      change(
        SuccessStatus(
          currentState.copyWith(
            isLoading: false,
            errorMessage: 'Login failed. Please try again.',
          ),
        ),
      );
    }
  }

  void goToSignup() {
    Get.toNamed<void>('/signup');
  }

  void forgotPassword() {
    Get.toNamed<void>('/forgot-password');
  }
}

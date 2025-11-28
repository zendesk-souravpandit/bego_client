import 'package:bego/pages/auth/signup/signup_state.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';
import 'package:flutter/foundation.dart' show debugPrint;

class SignupController extends BePageController<SignupState> {
  SignupController();

  @override
  void onInit() {
    super.onInit();
    change(SuccessStatus(SignupState.initial()));
  }

  void updateName(final String name) {
    change(SuccessStatus(state.copyWith(name: name)));
  }

  void updateEmail(final String email) {
    change(SuccessStatus(state.copyWith(email: email)));
  }

  void updatePassword(final String password) {
    change(SuccessStatus(state.copyWith(password: password)));
  }

  void updateConfirmPassword(final String confirmPassword) {
    change(SuccessStatus(state.copyWith(confirmPassword: confirmPassword)));
  }

  void toggleTerms(final bool? value) {
    change(SuccessStatus(state.copyWith(agreeToTerms: value ?? false)));
  }

  Future<void> signup() async {
    final currentState = state;

    if (currentState.name.isEmpty ||
        currentState.email.isEmpty ||
        currentState.password.isEmpty) {
      change(
        SuccessStatus(
          currentState.copyWith(errorMessage: 'All fields are required'),
        ),
      );
      return;
    }

    if (currentState.password != currentState.confirmPassword) {
      change(
        SuccessStatus(
          currentState.copyWith(errorMessage: 'Passwords do not match'),
        ),
      );
      return;
    }

    if (!currentState.agreeToTerms) {
      change(
        SuccessStatus(
          currentState.copyWith(
            errorMessage: 'Please accept terms and conditions',
          ),
        ),
      );
      return;
    }

    change(
      SuccessStatus(currentState.copyWith(isLoading: true, errorMessage: null)),
    );

    try {
      // Simulate signup API call
      await Future<void>.delayed(const Duration(seconds: 2));

      debugPrint('Signup successful for: ${currentState.email}');

      change(SuccessStatus(currentState.copyWith(isLoading: false)));

      // Navigate to login
      await Get.offNamed<void>('/login');
    } catch (e) {
      debugPrint('Signup error: $e');
      change(
        SuccessStatus(
          currentState.copyWith(
            isLoading: false,
            errorMessage: 'Signup failed. Please try again.',
          ),
        ),
      );
    }
  }

  void goToLogin() {
    Get.toNamed<void>('/login');
  }
}

import 'package:bego/pages/splash/splash_state.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';
import 'package:flutter/foundation.dart' show debugPrint;

class SplashController extends BePageController<SplashState> {
  SplashController();

  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // Simulate app initialization (2-3 seconds)
      await Future<void>.delayed(const Duration(seconds: 2));

      // Check authentication status
      final isAuthenticated = false; // Replace with actual auth check

      change(
        SuccessStatus(
          SplashState(isInitialized: true, isAuthenticated: isAuthenticated),
        ),
      );

      // Navigate based on authentication status
      if (isAuthenticated) {
        await Get.offNamed<void>('/home');
      } else {
        await Get.offNamed<void>('/onboarding');
      }
    } catch (e) {
      debugPrint('Error initializing app: $e');
      change(ErrorStatus(Exception(e.toString())));
    }
  }
}

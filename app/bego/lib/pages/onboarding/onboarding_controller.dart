import 'package:bego/pages/onboarding/onboarding_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class OnboardingController extends BePageController<OnboardingState> {
  OnboardingController();

  @override
  void onInit() {
    super.onInit();
    change(SuccessStatus(OnboardingState.initial()));
  }

  void nextStep() {
    final currentState = state;
    final nextStep = currentState.currentStep + 1;

    if (nextStep >= 3) {
      completeOnboarding();
    } else {
      change(SuccessStatus(currentState.copyWith(currentStep: nextStep)));
    }
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  void completeOnboarding() {
    change(SuccessStatus(state.copyWith(onboardingCompleted: true)));
    Get.offNamed<void>('/login');
  }

  void goToLogin() {
    Get.toNamed<void>('/login');
  }
}

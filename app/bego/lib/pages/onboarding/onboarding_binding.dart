import 'package:bego/pages/onboarding/onboarding_controller.dart';
import 'package:becore/getx.dart';

class OnboardingBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<OnboardingController>(OnboardingController.new),
  ];
}

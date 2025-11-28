import 'package:bego/constants/strings.dart';
import 'package:bego/pages/onboarding/onboarding_state.dart';
import 'package:bego/pages/onboarding/onboarding_controller.dart';
import 'package:becomponent/src/page/be_page.dart';
import 'package:becomponent/src/page/be_page_status_resolver.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends BePage<OnboardingState, OnboardingController> {
  OnboardingPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<OnboardingController>(
          successBuilder:
              (
                final BuildContext context,
                final OnboardingController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(title: const Text(AppStrings.onboardingTitle)),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          size: 80,
                          color: Colors.blue[700],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Step ${controller.state.currentStep + 1}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(AppStrings.onboardingSubtitle),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              onPressed: controller.skipOnboarding,
                              child: const Text(AppStrings.stepSkip),
                            ),
                            ElevatedButton(
                              onPressed: controller.nextStep,
                              child: const Text(AppStrings.stepNext),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final OnboardingController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

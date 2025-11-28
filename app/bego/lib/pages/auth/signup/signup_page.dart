import 'package:bego/constants/strings.dart';
import 'package:bego/pages/auth/signup/signup_state.dart';
import 'package:bego/pages/auth/signup/signup_controller.dart';
import 'package:becomponent/src/page/be_page.dart';
import 'package:becomponent/src/page/be_page_status_resolver.dart';
import 'package:flutter/material.dart';

class SignupPage extends BePage<SignupState, SignupController> {
  SignupPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<SignupController>(
          successBuilder:
              (final BuildContext context, final SignupController controller) {
                return Scaffold(
                  appBar: AppBar(title: const Text(AppStrings.signup)),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Icon(Icons.person_add, size: 80),
                          const SizedBox(height: 30),
                          TextField(
                            onChanged: controller.updateName,
                            decoration: InputDecoration(
                              labelText: AppStrings.fullName,
                              border: OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.person),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            onChanged: controller.updateEmail,
                            decoration: InputDecoration(
                              labelText: AppStrings.email,
                              border: OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            onChanged: controller.updatePassword,
                            decoration: InputDecoration(
                              labelText: AppStrings.password,
                              border: OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.lock),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            onChanged: controller.updateConfirmPassword,
                            decoration: InputDecoration(
                              labelText: AppStrings.confirmPassword,
                              border: OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.lock),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 16),
                          CheckboxListTile(
                            value: controller.state.agreeToTerms,
                            onChanged: controller.toggleTerms,
                            title: const Text(AppStrings.agreeToTerms),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          const SizedBox(height: 8),
                          if (controller.state.errorMessage != null)
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                controller.state.errorMessage!,
                                style: TextStyle(color: Colors.red.shade900),
                              ),
                            ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: controller.state.isLoading
                                  ? null
                                  : controller.signup,
                              child: controller.state.isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(AppStrings.signupButton),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(AppStrings.alreadyHaveAccount),
                              TextButton(
                                onPressed: controller.goToLogin,
                                child: const Text(AppStrings.login),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final SignupController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

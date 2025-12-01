import 'package:bego/constants/strings.dart';
import 'package:bego/pages/auth/login/login_state.dart';
import 'package:bego/pages/auth/login/login_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class LoginPage extends BePage<LoginState, LoginController> {
  LoginPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<LoginController>(
          successBuilder:
              (final BuildContext context, final LoginController controller) {
                return Scaffold(
                  appBar: AppBar(title: const Text(AppStrings.login)),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          const Icon(Icons.person, size: 80),
                          const SizedBox(height: 40),
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
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: controller.forgotPassword,
                              child: const Text(AppStrings.forgotPassword),
                            ),
                          ),
                          const SizedBox(height: 16),
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
                                  : controller.login,
                              child: controller.state.isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(AppStrings.loginButton),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(AppStrings.dontHaveAccount),
                              TextButton(
                                onPressed: controller.goToSignup,
                                child: const Text(AppStrings.signup),
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
              (final BuildContext context, final LoginController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

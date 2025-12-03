import 'package:becomponent/page.dart';
import 'package:bego/constants/strings.dart';
import 'package:bego/pages/splash/splash_state.dart';
import 'package:bego/pages/splash/splash_controller.dart';

import 'package:flutter/material.dart';

class SplashPage extends BePage<SplashState, SplashController> {
  SplashPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<SplashController>(
          successBuilder:
              (final BuildContext context, final SplashController controller) {
                return const Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag, size: 80),
                        SizedBox(height: 20),
                        Text(
                          AppStrings.splash,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final SplashController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

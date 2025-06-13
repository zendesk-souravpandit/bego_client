import 'package:beassets/assets.dart';
import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class UnknownWidget extends StatelessWidget {
  const UnknownWidget({super.key, this.data});
  final dynamic data;
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: px8, child: BeAsset.illustration.spaceshipError404.svg()),
              // Title Text
              const BeText.headlineLarge('Oh No! Error 404', color: BeColors.gray800, padding: p18),
              const BeText.bodyLarge(
                'Oops! That page seems to have taken a detour. Let us guide you back to your destination.',
                align: TextAlign.center,
                color: BeColors.gray400,
                padding: pb32,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).popUntil((final route) => route.isFirst);
                  Navigator.pop(context);
                },
                child: BeText.titleSmall('Go Back', color: BeColors.white, padding: px8 + py4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

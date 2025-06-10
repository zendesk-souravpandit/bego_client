import 'package:beassets/assets.dart';
import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class ConnectionLostPageWidget extends StatelessWidget {
  const ConnectionLostPageWidget({super.key, this.data});
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
              Padding(padding: px8, child: BeAsset.illustration.unplugErrorRobot.svg()),
              // Title Text
              const BeText.headlineLarge('Connection Lost!', color: BeColors.gray800, padding: p18),
              const BeText.bodyLarge(
                'Oops! Looks like our connection got lost. Sorry, it looks like you\'re off the grid. ',
                align: TextAlign.center,
                color: BeColors.gray400,
                padding: pb32,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).popUntil((final route) => route.isFirst);
                  Navigator.pop(context);
                },
                child: BeText.titleSmall('Retry ', color: BeColors.white, padding: px8 + py4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

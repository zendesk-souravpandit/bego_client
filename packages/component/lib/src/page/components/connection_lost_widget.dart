import 'package:beassets/assets.dart';
import 'package:becore/getx.dart';
import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class ConnectionLostWidget extends StatelessWidget {
  const ConnectionLostWidget({super.key, this.data, this.buttonText, this.onClickButton});
  final VoidCallback? onClickButton;
  final String? buttonText;
  final dynamic data;
  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Padding(
        padding: px24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: px8,
              child: BeAsset.illustration.unplugErrorRobot.svg(
                fit: BoxFit.fitWidth,
                allowDrawingOutsideViewBox: true,
              ),
            ),
            // Title Text
            const BeText.headlineLarge('Connection Lost!', color: BeColors.gray800, padding: p18),
            const BeText.bodyLarge(
              'Oops! Looks like our connection got lost. Sorry, it looks like you\'re off the grid. ',
              align: TextAlign.center,
              color: BeColors.gray400,
              padding: pb32,
            ),
            if (onClickButton != null)
              ElevatedButton(
                onPressed: onClickButton,
                child: BeText.titleSmall(
                  buttonText ?? 'Retry',
                  color: BeColors.white,
                  padding: px8 + py4,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

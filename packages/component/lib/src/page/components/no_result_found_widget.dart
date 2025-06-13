import 'package:beassets/assets.dart';
import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class NoResultFoundWidget extends StatelessWidget {
  const NoResultFoundWidget({super.key, this.data});
  final dynamic data;
  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: px8, child: BeAsset.illustration.laptopNoResult.svg()),
            // Title Text
            const BeText.headlineLarge('No Result Found!!', color: BeColors.gray800, padding: p18),
            const BeText.bodyLarge(
              'Sorry, we came up empty-handed. Let\'s broaden our search and help you find what you\'re looking for.',
              align: TextAlign.center,
              color: BeColors.gray400,
              padding: pb32,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: BeText.titleSmall('Retry ', color: BeColors.white, padding: px8 + py4),
            ),
          ],
        ),
      ),
    );
  }
}

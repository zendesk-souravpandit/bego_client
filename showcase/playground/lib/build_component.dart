import 'package:beui/text.dart';
import 'package:flutter/material.dart';

class BuildComponent extends StatelessWidget {
  const BuildComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // showResponsiveDialog(context,Text("Hello"));
              },
              child: const BeText.labelLarge("Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}

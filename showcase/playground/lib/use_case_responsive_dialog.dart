import 'package:beui/overlay.dart';
import 'package:beui/text.dart';
import 'package:flutter/material.dart';

class ResponsiveDialogDemo extends StatelessWidget {
  const ResponsiveDialogDemo({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                showExampleDialog(context);
              },
              child: const BeText.labelLarge('Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage example:
void showExampleDialog(final BuildContext context) {
  showBegoDialog<void>(
    context: context,

    // showShadow: false,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Title', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        const Text('This dialog automatically adapts to screen size'),
        const SizedBox(height: 24),
        ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
      ],
    ),
  );
}

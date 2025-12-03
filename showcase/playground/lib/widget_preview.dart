import 'package:beui/foundation.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

// Wrapper function to provide BeTheme to previews
Widget themeWrapper(final Widget child) {
  return MaterialApp(
    home: BeTheme(
      colors: const BeColorsDark(), // or BeColorsDark() for dark theme
      child: Scaffold(body: Center(child: child)),
    ),
  );
}

@Preview(name: 'Primary Button', wrapper: themeWrapper)
Widget previewPrimaryButton() {
  return BeButton.primary(onPressed: () {}, child: const BeText('Click Me'));
}

@Preview(name: 'Secondary Button', wrapper: themeWrapper)
Widget previewSecondaryButton() {
  return BeButton.secondary(onPressed: () {}, child: const BeText('Secondary'));
}

@Preview(name: 'Loading Button', wrapper: themeWrapper)
Widget previewLoadingButton() {
  return BeButton.primary(onPressed: () {}, isLoading: true, child: const BeText('Loading'));
}

@Preview(name: 'Outline Button', wrapper: themeWrapper)
Widget previewOutlineButton() {
  return BeButton.outline(onPressed: () {}, child: const BeText('Outline'));
}

@Preview(name: 'Destructive Button', wrapper: themeWrapper)
Widget previewDestructiveButton() {
  return const BeButton.destructive(onPressed: null, size: BeButtonSize.small, child: BeText('Delete'));
}

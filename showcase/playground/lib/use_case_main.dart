import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:playground/use_case_dropdown.dart';

void main() {
  runApp(
    const MaterialApp(
      home: BeTheme(
        // betheme: BeThemeData(breakpoint: BeBreakpoint.md, themeMode: ThemeMode.light, colors: const BeColorsLight()),
        colors: BeColorsLight(),
        child: DropdownMenuShowcase(),
      ),
    ),
  );
}

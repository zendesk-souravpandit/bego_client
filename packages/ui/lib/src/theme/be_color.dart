import 'package:flutter/material.dart';

abstract class BeColor {
  Color get formFillColor;

  // Primary palette

  bool get isDark;
  Color get primary;
  Color get primaryDark; // 0xFF9C2A46
  Color get primaryLight; // 0xFFD15F7A

  // Neutrals (Tailwind zinc/slate inspired)
  Color get neutral50; // Lightest
  Color get neutral100;
  Color get neutral200;
  Color get neutral300;
  Color get neutral400;
  Color get neutral500; // Base
  Color get neutral600;
  Color get neutral700;
  Color get neutral800;
  Color get neutral900; // Darkest

  // Semantic colors
  Color get success;
  Color get error;
  Color get warning;
  Color get info;
  // Disabled , Inactive or Sad color
  Color get disabled;

  // Surface colors
  Color get background;
  Color get surface;
  Color get surfaceVariant;

  // Text/icon colors
  Color get textPrimary;
  Color get textSecondary;
  Color get icon;
}

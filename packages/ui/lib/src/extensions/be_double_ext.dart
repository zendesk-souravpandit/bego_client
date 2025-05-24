extension OpacityToAlpha on double {
  /// Converts a double (0.0 to 1.0) to an integer alpha (0 to 255).
  /// Clamps the value within the 0.0–1.0 range before conversion.
  int toAlpha() => (clamp(0.0, 1.0) * 255).round();
}

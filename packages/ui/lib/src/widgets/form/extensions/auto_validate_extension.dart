import 'package:flutter/widgets.dart';

extension BeAutovalidateModeExtension on AutovalidateMode {
  /// Is always or is onUserInteraction
  bool get isEnable => isAlways || isOnUserInteraction;
  bool get isAlways => this == AutovalidateMode.always;
  bool get isOnUserInteraction => this == AutovalidateMode.onUserInteraction;
}

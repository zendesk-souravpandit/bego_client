import 'package:flutter/material.dart';

@immutable
class BeEdgeInsets extends ThemeExtension<BeEdgeInsets> {
  const BeEdgeInsets({required this.gutter, required this.textInset, required this.buttonInset});
  final EdgeInsets gutter;
  final EdgeInsets textInset;
  final EdgeInsets buttonInset;

  static const BeEdgeInsets light = BeEdgeInsets(
    gutter: EdgeInsets.all(16),
    textInset: EdgeInsets.symmetric(horizontal: 8),
    buttonInset: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  );

  static const BeEdgeInsets dark = BeEdgeInsets(
    gutter: EdgeInsets.all(20),
    textInset: EdgeInsets.symmetric(horizontal: 10),
    buttonInset: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
  );

  @override
  BeEdgeInsets copyWith({EdgeInsets? gutter, EdgeInsets? textInset, EdgeInsets? buttonInset}) => BeEdgeInsets(
    gutter: gutter ?? this.gutter,
    textInset: textInset ?? this.textInset,
    buttonInset: buttonInset ?? this.buttonInset,
  );

  @override
  BeEdgeInsets lerp(BeEdgeInsets? other, double t) {
    if (other is! BeEdgeInsets) {
      return this;
    }
    return BeEdgeInsets(
      gutter: EdgeInsets.lerp(gutter, other.gutter, t)!,
      textInset: EdgeInsets.lerp(textInset, other.textInset, t)!,
      buttonInset: EdgeInsets.lerp(buttonInset, other.buttonInset, t)!,
    );
  }
}

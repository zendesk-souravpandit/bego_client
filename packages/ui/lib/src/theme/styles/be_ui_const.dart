import 'dart:ui';

class BeUIBlurFilter {
  const BeUIBlurFilter._();

  static final blurSmall = ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8);
  static final blurRegular = ImageFilter.blur(sigmaX: 1, sigmaY: 1);
  static final blurHuge = ImageFilter.blur(sigmaX: 6, sigmaY: 6);
}

import 'dart:ui';

class BlurFilter {
  const BlurFilter._();

  static final dialogBlur = ImageFilter.blur(sigmaX: 1, sigmaY: 1);
  static final blurLevel1 = ImageFilter.blur(sigmaX: 2, sigmaY: 2);
  static final blurLevel2 = ImageFilter.blur(sigmaX: 4, sigmaY: 4);
  static final blurLevel3 = ImageFilter.blur(sigmaX: 8, sigmaY: 8);
  static final blurLevel4 = ImageFilter.blur(sigmaX: 16, sigmaY: 26);
}

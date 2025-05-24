import 'package:flutter/widgets.dart';

/// Text tool class
class BeTextUtil {
  const BeTextUtil._();

  ///Calculate text width based on TextStyle.
  static Size textSize(final String? text, final TextStyle style) {
    if (text == null || text.trim().isEmpty) return Size.zero;
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

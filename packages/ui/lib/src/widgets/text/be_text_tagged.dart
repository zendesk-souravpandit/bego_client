import 'package:beui/mulitchild.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:beui/utils.dart';
import 'package:flutter/material.dart';

class BeTextTagged extends StatelessWidget {
  const BeTextTagged({
    super.key,
    required this.child,
    this.label,
    this.offset,
    this.tagBackground,
    this.tagspace = 4,
    this.tagColor = BeColors.gray600,
    this.tagStyle,
    this.tagPadding = const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
    this.position = BeBadgePosition.topLeft,
  });
  final String? label;
  final Offset? offset;
  final BeBadgePosition position;
  final TextStyle? tagStyle;
  final Color tagColor;
  final Color? tagBackground;
  final EdgeInsets? tagPadding;
  final double tagspace;
  final Widget child;
  @override
  Widget build(final BuildContext context) {
    final tagTextStyle = tagStyle ?? BeTheme.of(context).style.titleSmall;
    return BeBadge(
      offset: offset ?? _calculateOffset(tagTextStyle),
      position: position,
      badge: Container(
        padding: tagPadding,
        decoration: BoxDecoration(
          // borderRadius: bestyles(context).xsRadius,
          color: tagBackground ?? tagColor.withAlpha(50),
        ),
        child: BeText(label, style: tagTextStyle, color: tagColor),
      ),
      child: child,
    );
  }

  Offset _calculateOffset(final TextStyle tagTextStyle) {
    final size = BeTextUtil.textSize(label, tagTextStyle);
    var dx = size.width;
    var dy = size.height;

    switch (position) {
      case BeBadgePosition.topRight:
        dx = dx / 2 + tagspace;
        dy = dy / 3;
      case BeBadgePosition.topCenter:
        dx = 0;
        dy = 0 - tagspace;
      case BeBadgePosition.bottomCenter:
        dx = 0;
        dy = dy / 3 + tagspace;

      case BeBadgePosition.centerRight:
        dx = dx / 2 + tagspace;
        dy = 0;
      case BeBadgePosition.centerLeft:
        dx = -dx / 2 - tagspace;
        dy = 0;
        break;

      case BeBadgePosition.topLeft:
        dx = -dx / 2 - tagspace;
        dy = dy / 3;
      case BeBadgePosition.center:
        dx = 0;
        dy = 0;
      case BeBadgePosition.bottomLeft:
        dx = -dx / 2 - tagspace;
        dy = -dy / 3;
      case BeBadgePosition.bottomRight:
        dx = dx / 2 + tagspace;
        dy = -dy / 3;
    }

    final offset = Offset(dx, dy);
    return offset;
  }
}

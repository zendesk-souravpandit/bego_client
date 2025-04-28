import 'package:beui/theme.dart';
import 'package:flutter/widgets.dart';

class BeEnabled extends StatelessWidget {
  const BeEnabled({super.key, this.enabled = true, required this.child});

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      return child;
    }
    return Opacity(
      opacity: BeStyleConst.disabled,
      child: IgnorePointer(ignoring: !enabled, child: child),
    );
  }
}

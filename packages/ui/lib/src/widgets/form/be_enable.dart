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

/* 
```
class BeEnabled extends StatelessWidget {
  const BeEnabled({
    super.key, 
    this.enabled = true, 
    required this.child,
    this.useThemeColor = true,
  });

  final bool enabled;
  final Widget child;
  final bool useThemeColor;

  @override
  Widget build(BuildContext context) {
    if (enabled) return child;
    
    if (useThemeColor) {
      final disabledColor = Theme.of(context).disabledColor;
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: disabledColor,
            onSurface: disabledColor,
          ),
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: disabledColor,
            displayColor: disabledColor,
          ),
        ),
        child: IgnorePointer(
          ignoring: true,
          child: child,
        ),
      );
    } else {
      // Fallback to opacity if needed
      return Opacity(
        opacity: BeStyleConst.disabled,
        child: IgnorePointer(ignoring: true, child: child),
      );
    }
  }
}
```
*/

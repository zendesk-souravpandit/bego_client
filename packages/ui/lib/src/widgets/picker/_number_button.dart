import 'package:beui/theme.dart';
import 'package:flutter/widgets.dart';

class NumberPickerButton extends StatelessWidget {
  const NumberPickerButton({super.key, required this.iconData, this.onPressed});

  final IconData iconData;
  final VoidCallback? onPressed;

  bool get _isEnabled => onPressed != null;

  @override
  Widget build(BuildContext context) => Opacity(
    opacity: _isEnabled ? 1 : 0.5,
    child: GestureDetector(onTap: onPressed, child: Icon(iconData, color: BeColors.white, size: 16)),
  );
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BeDisableWrapper extends StatelessWidget {
  const BeDisableWrapper({
    required this.disabled,
    required this.child,
    super.key,
    this.lightModeOpacity = 0.6,
    this.darkModeOpacity = 0.8,
  });
  final bool disabled;
  final Widget child;
  final double lightModeOpacity;
  final double darkModeOpacity;

  ColorFilter get _grayscaleMatrix => const ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);

  double _getOpacity(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkModeOpacity : lightModeOpacity;
  }

  @override
  Widget build(BuildContext context) {
    if (!disabled) {
      return child;
    }

    return AbsorbPointer(
      child: Opacity(opacity: _getOpacity(context), child: ColorFiltered(colorFilter: _grayscaleMatrix, child: child)),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('disabled', disabled))
      ..add(DoubleProperty('lightModeOpacity', lightModeOpacity))
      ..add(DoubleProperty('darkModeOpacity', darkModeOpacity));
  }
}

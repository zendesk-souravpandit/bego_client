import 'package:beui/src/widgets/bindings/bindings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef OnWidgetSizeChange = void Function(Size size);

///Utility class for monitoring Widget width and height.
class MeasureSizeRenderObject extends RenderProxyBox {
  MeasureSizeRenderObject(this.onChange);
  Size? oldSize;
  final OnWidgetSizeChange onChange;

  @override
  void performLayout() {
    super.performLayout();

    var newSize = Size.zero;
    if (child != null) {
      newSize = child!.size;
    }
    if (oldSize == newSize) {
      return;
    }

    oldSize = newSize;

    useWidgetsBinding().addPostFrameCallback((_) {
      onChange(newSize);
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Size?>('oldSize', oldSize))
      ..add(ObjectFlagProperty<OnWidgetSizeChange>.has('onChange', onChange));
  }
}

/// Tool class for monitoring Widget width and height changes
class MeasureSize extends SingleChildRenderObjectWidget {
  const MeasureSize({
    required this.onChange,
    required Widget super.child,
    super.key,
  });
  final OnWidgetSizeChange onChange;
  @override
  RenderObject createRenderObject(BuildContext context) =>
      MeasureSizeRenderObject(onChange);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<OnWidgetSizeChange>.has('onChange', onChange),
    );
  }
}

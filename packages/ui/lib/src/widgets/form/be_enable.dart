import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const filter = ColorFilter.matrix([
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
  0.5,
  0,
]);

class BeEnabled extends SingleChildRenderObjectWidget {
  const BeEnabled({super.key, required this.enabled, required super.child});
  final bool enabled;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBeEnabled(enabled: enabled);
  }

  @override
  void updateRenderObject(BuildContext context, RenderBeEnabled renderObject) {
    renderObject.enabled = enabled;
  }
}

class RenderBeEnabled extends RenderProxyBox {
  RenderBeEnabled({required bool enabled, RenderBox? child})
    : _enabled = enabled,
      super(child);
  bool _enabled;

  set enabled(bool value) {
    if (_enabled != value) {
      _enabled = value;
      markNeedsPaint();
    }
  }

  bool get enabled => _enabled;

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    if (!enabled) return false;
    return super.hitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      if (enabled) {
        // Paint normally when enabled
        context.paintChild(child!, offset);
      } else {
        // Paint with grayscale filter when disabled
        context.pushLayer(ColorFilterLayer(colorFilter: filter), (
          PaintingContext context,
          Offset offset,
        ) {
          context.paintChild(child!, offset);
        }, offset);
      }
    }
  }
}


/*
class BeEnabled extends StatelessWidget {
  const BeEnabled({super.key, required this.enabled, required this.child});

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
*/
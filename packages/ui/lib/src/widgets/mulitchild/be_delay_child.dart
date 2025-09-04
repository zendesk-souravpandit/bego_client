// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BeDrawOver extends SingleChildRenderObjectWidget {
  const BeDrawOver({super.key, required Widget super.child});

  @override
  RenderObject createRenderObject(final BuildContext context) {
    return _RenderDrawOver();
  }
}

class _RenderDrawOver extends RenderProxyBox {
  @override
  void paint(final PaintingContext context, final Offset offset) {
    if (child != null) {
      // Paint the child on top of all other widgets by deferring its painting
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pushLayer(OffsetLayer(), (final innerContext, final innerOffset) {
          innerContext.paintChild(child!, offset);
        }, offset);
      });
    }
  }

  @override
  bool hitTest(final BoxHitTestResult result, {required final Offset position}) {
    if (child != null) {
      return child!.hitTest(result, position: position);
    }
    return false;
  }
}

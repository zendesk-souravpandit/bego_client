// ignore_for_file: library_private_types_in_public_api, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Custom Flutter widget for rendering a label on another widget </br>
/// [child] of Widget Type. badge widget respects child widget dimension
/// [offset] translate widget to offset based on [Offset] default is [Offset.zero]
class BeOffset extends SingleChildRenderObjectWidget {
  const BeOffset({required super.child, super.key, this.offset = Offset.zero, this.claimPosition = false});
  final Offset offset;
  final bool claimPosition;
  @override
  RenderObject createRenderObject(BuildContext context) =>
      _BeOffsetRenderObject(offset: offset, claimPosition: claimPosition);

  @override
  void updateRenderObject(BuildContext context, _BeOffsetRenderObject renderObject) {
    renderObject
      ..offset = offset
      ..claimPosition = claimPosition;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Offset>('offset', offset))
      ..add(DiagnosticsProperty<bool>('claimPosition', claimPosition));
  }
}

class _BeOffsetRenderObject extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  _BeOffsetRenderObject({required Offset offset, required bool claimPosition})
    : _offset = offset,
      _claimPosition = claimPosition;

  Offset _offset;
  set offset(Offset value) {
    _offset = value;
    markNeedsPaint();
  }

  bool _claimPosition;

  set claimPosition(bool value) {
    _claimPosition = value;
    markNeedsPaint();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = _BeBadgeChildParentData();
  }

  @override
  void performLayout() {
    final child = this.child;
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      _claimPosition ? size = constraints.constrain(child.size) : size = constraints.constrain(child.size + _offset);
    } else {
      size = constraints.smallest;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // defaultPaint(context, offset);
    final child = this.child;
    if (child != null) {
      context.paintChild(child, offset + _offset);
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) =>
      child?.hitTest(result, position: position - _offset) == true;
}

// Custom parent data for the BeBadge widget
class _BeBadgeChildParentData extends ContainerBoxParentData<RenderBox> with ContainerParentDataMixin<RenderBox> {}

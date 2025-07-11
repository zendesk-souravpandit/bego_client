// ignore_for_file: library_private_types_in_public_api, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Custom Flutter widget for rendering a badge on another widget </br>
/// [child] of Widget Type. badge widget respects child widget dimention
/// [labels] of Widget Type. badge widget respects child
class BeMultiLabel extends MultiChildRenderObjectWidget {
  BeMultiLabel({required this.child, required this.labels, super.key}) : super(children: [child, ...labels]);
  final Widget child;
  final List<BeLabelChild> labels;
  @override
  RenderObject createRenderObject(final BuildContext context) => _BeMultiLabelRenderObject();

  @override
  void updateRenderObject(final BuildContext context, final _BeMultiLabelRenderObject renderObject) {}
}

class _BeMultiLabelRenderObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _BeMultiLabelParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _BeMultiLabelParentData> {
  _BeMultiLabelRenderObject();

  @override
  void setupParentData(covariant final RenderObject child) {
    child.parentData = _BeMultiLabelParentData();
  }

  @override
  void performLayout() {
    final child = firstChild;
    child!.layout(constraints, parentUsesSize: true);

    size = child.size;

    for (final c in getChildrenAsList()) {
      if (c == firstChild) continue;
      final badge = (c as _LabelRenderBox)..layout(const BoxConstraints(), parentUsesSize: true);
      final badgeParentData = badge.parentData! as _BeMultiLabelParentData;
      final labelOffset = _getOffset(badge._position, badge._offset, badge.size.width, badge.size.height);
      badgeParentData.offset = labelOffset;
    }
  }

  @override
  void paint(final PaintingContext context, final Offset offset) => defaultPaint(context, offset);

  Offset _getOffset(final BeMultiLabelPosition position, final Offset childOffset, final double labelWidth, final double labelHeight) {
    var translateX = 0.0;
    var translateY = 0.0;

    final (double x, double y) = switch (position) {
      BeMultiLabelPosition.topLeft => (0, -labelHeight),
      BeMultiLabelPosition.leftTop => (-labelWidth, 0),
      BeMultiLabelPosition.topCenter => ((size.width - labelWidth) / 2, -labelHeight),
      BeMultiLabelPosition.topRight => (size.width - labelWidth, -labelHeight),
      BeMultiLabelPosition.rightTop => (size.width, 0),
      BeMultiLabelPosition.bottomRight => (size.width - labelWidth, size.height),
      BeMultiLabelPosition.rightBottom => (size.width, size.height - labelHeight),
      BeMultiLabelPosition.rightCenter => (size.width, (size.height - labelHeight) / 2),
      BeMultiLabelPosition.bottomCenter => ((size.width - labelWidth) / 2, size.height),
      BeMultiLabelPosition.bottomLeft => (0, size.height),
      BeMultiLabelPosition.leftBottom => (-labelWidth, size.height - labelHeight),
      BeMultiLabelPosition.leftCenter => (-labelWidth, (size.height - labelHeight) / 2),
      BeMultiLabelPosition.center => ((size.width - labelWidth) / 2, (size.height - labelHeight) / 2),
    };
    translateX = x + childOffset.dx;
    translateY = y + childOffset.dy;

    return Offset(translateX, translateY);
  }

  @override
  bool hitTestChildren(final BoxHitTestResult result, {required final Offset position}) =>
      defaultHitTestChildren(result, position: position);

  @override
  bool hitTest(final BoxHitTestResult result, {required final Offset position}) {
    for (final child in getChildrenAsList()) {
      final badgeParentData = child.parentData! as _BeMultiLabelParentData;
      final badgePosition = Offset(position.dx - badgeParentData.offset.dx, position.dy - badgeParentData.offset.dy);
      if (child.size.contains(badgePosition)) {
        if (hitTestChildren(result, position: position) || hitTestSelf(position)) {
          result.add(BoxHitTestEntry(this, position));
          return true;
        }
      }

      if (size.contains(position)) {
        if (hitTestChildren(result, position: position) || hitTestSelf(position)) {
          result.add(BoxHitTestEntry(this, position));
          return true;
        }
      }
    }
    return false;
  }
}

class _BeMultiLabelParentData extends ContainerBoxParentData<RenderBox> with ContainerParentDataMixin<RenderBox> {}

// ==========================================================================
/// Custom Flutter widget for rendering a badge on another widget </br>
/// [child] of Widget Type. badge widget respects child widget dimention
/// [offset] translate widget to offset based on [Offset] default is [Offset.zero]
/// [position] set alignment position of badge
class BeLabelChild extends SingleChildRenderObjectWidget {
  const BeLabelChild({required this.position, required super.child, super.key, this.offset = Offset.zero});
  final BeMultiLabelPosition position;
  final Offset offset;

  @override
  RenderObject createRenderObject(final BuildContext context) => _LabelRenderBox(offset: offset, position: position);

  @override
  void updateRenderObject(final BuildContext context, final _LabelRenderBox renderObject) {
    renderObject
      ..position = position
      ..offset = offset;
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<BeMultiLabelPosition>('position', position))
      ..add(DiagnosticsProperty<Offset>('offset', offset));
  }
}

class _LabelRenderBox extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  // Add any properties and constructor you need
  _LabelRenderBox({required final BeMultiLabelPosition position, required final Offset offset})
    : _position = position,
      _offset = offset;

  var _lastSize = Size.zero;

  BeMultiLabelPosition _position;
  set position(final BeMultiLabelPosition position) {
    _position = position;
    markNeedsPaint();
  }

  Offset _offset;
  set offset(final Offset value) {
    _offset = value;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    final child = this.child;
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      size = child.size;
    } else {
      size = constraints.smallest;
    }

    if (_lastSize != size) {
      _lastSize = size;
      // _widget.onChildSizeChanged?.call(_lastSize);
    }
  }

  @override
  void paint(final PaintingContext context, final Offset offset) {
    final child = this.child;
    if (child != null) {
      context.paintChild(child, offset);
    }
  }

  @override
  bool hitTestChildren(final BoxHitTestResult result, {required final Offset position}) =>
      child?.hitTest(result, position: position) == true;
}

enum BeMultiLabelPosition {
  topLeft,
  topCenter,
  topRight,
  rightTop,
  rightCenter,
  rightBottom,
  bottomRight,
  bottomCenter,
  bottomLeft,
  leftBottom,
  leftCenter,
  leftTop,
  center,
}

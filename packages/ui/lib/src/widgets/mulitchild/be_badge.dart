// ignore_for_file: library_private_types_in_public_api, avoid_setters_without_getters, lines_longer_than_80_chars

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Custom Flutter widget for rendering a badge on another widget </br>
/// [child] of Widget Type. badge widget respects child widget dimention
/// [badge] of Widget Type. badge widget respects child
/// [rounded] will min(size.width, size.height) / 4 inside;
/// [offset] translate widget to offset based on [Offset] default is [Offset.zero]
/// [position] set alignment position of badge
class BeBadge extends MultiChildRenderObjectWidget {
  BeBadge({
    required this.child,
    super.key,
    this.badge,
    this.rounded = false,
    this.offset = Offset.zero,
    this.position = BeBadgePosition.topRight,
  }) : super(children: [child, badge ?? const SizedBox.shrink()]);
  final Widget child;
  final Widget? badge;
  final BeBadgePosition position;
  final bool rounded;
  final Offset offset;
  @override
  RenderObject createRenderObject(final BuildContext context) =>
      _BeBadgeRenderObject(position: position, rounded: rounded, offset: offset);

  @override
  void updateRenderObject(final BuildContext context, final _BeBadgeRenderObject renderObject) {
    renderObject
      ..badgePosition = position
      ..rounded = rounded
      ..offset = offset;
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<BeBadgePosition>('position', position))
      ..add(DiagnosticsProperty<bool>('rounded', rounded))
      ..add(DiagnosticsProperty<Offset>('offset', offset));
  }
}

class _BeBadgeRenderObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _BeBadgeChildParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _BeBadgeChildParentData> {
  _BeBadgeRenderObject({required final BeBadgePosition position, required final bool rounded, required final Offset offset})
    : _badgePosition = position,
      _rounded = rounded,
      _offset = offset;

  BeBadgePosition _badgePosition;
  set badgePosition(final BeBadgePosition position) {
    _badgePosition = position;
    markNeedsPaint();
  }

  bool _rounded;
  set rounded(final bool value) {
    _rounded = value;
    markNeedsPaint();
  }

  Offset _offset;
  set offset(final Offset value) {
    _offset = value;
    markNeedsPaint();
  }

  @override
  void setupParentData(covariant final RenderObject child) {
    child.parentData = _BeBadgeChildParentData();
  }

  @override
  bool hitTest(final BoxHitTestResult result, {required final Offset position}) {
    final badgeParentData = lastChild!.parentData! as _BeBadgeChildParentData;
    final badgePosition = Offset(position.dx - badgeParentData.offset.dx, position.dy - badgeParentData.offset.dy);

    /// Check if the position is within the badge or the widget itself

    if (lastChild!.size.contains(badgePosition)) {
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
    return false;
  }

  @override
  void performLayout() {
    final child = firstChild;
    final badge = lastChild;
    child!.layout(constraints, parentUsesSize: true);

    size = child.size;

    badge!.layout(const BoxConstraints(), parentUsesSize: true);

    final badgeParentData = badge.parentData! as _BeBadgeChildParentData;

    /// Calculate the offset for the badge

    final labelOffset = _getOffset(badge.size.width, badge.size.height);
    badgeParentData.offset = labelOffset;
  }

  @override
  void paint(final PaintingContext context, final Offset offset) => defaultPaint(context, offset);

  /// Calculate the offset for the badge based on its position
  Offset _getOffset(final double badgeWidth, final double badgeHeight) {
    final radius = min(size.width, size.height) / 2;
    final roundShift = radius / 2;
    // Use a switch statement to determine the offset based on the badge position

    final (double x, double y) = switch (_badgePosition) {
      BeBadgePosition.topLeft => (
        (-badgeWidth / 2) + (_rounded ? roundShift : 0),
        -badgeHeight / 2 + (_rounded ? roundShift / 3 : 0),
      ),
      BeBadgePosition.topCenter => ((size.width - badgeWidth) / 2, -badgeHeight / 2),
      BeBadgePosition.topRight => (
        (size.width - badgeWidth / 2) - (_rounded ? roundShift : 0),
        (-badgeHeight / 2) + (_rounded ? roundShift / 3 : 0),
      ),
      BeBadgePosition.bottomRight => (
        (size.width - badgeWidth / 2) - (_rounded ? roundShift : 0),
        (size.height - badgeHeight / 2) - (_rounded ? roundShift / 3 : 0),
      ),
      BeBadgePosition.bottomCenter => ((size.width - badgeWidth) / 2, size.height - badgeHeight / 2),
      BeBadgePosition.bottomLeft => (
        (-badgeWidth / 2) + (_rounded ? roundShift : 0),
        (size.height - badgeHeight / 2) - (_rounded ? roundShift / 3 : 0),
      ),
      BeBadgePosition.centerLeft => (-badgeWidth / 2, (size.height - badgeHeight) / 2),
      BeBadgePosition.center => ((size.width - badgeWidth) / 2, (size.height - badgeHeight) / 2),
      BeBadgePosition.centerRight => (size.width - badgeWidth / 2, (size.height - badgeHeight) / 2),
    };
    // Apply the calculated offset and the specified offset

    return Offset(x + _offset.dx, y + _offset.dy);
  }

  @override
  bool hitTestChildren(final BoxHitTestResult result, {required final Offset position}) =>
      defaultHitTestChildren(result, position: position);
}

// Custom parent data for the BeBadge widget
class _BeBadgeChildParentData extends ContainerBoxParentData<RenderBox> with ContainerParentDataMixin<RenderBox> {}

/// Enumeration for different badge positions [BeBadgePosition]
enum BeBadgePosition {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

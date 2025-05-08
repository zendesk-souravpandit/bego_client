import 'package:becore/dfunc.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BeStackAlignment {
  /// Default value.	All items in a stack are aligned to the start of the
  /// container.
  start,

  /// All items in a stack are aligned to the center of the container.
  center,

  /// All items in a stack are aligned to the center of the container.
  end,
}

enum BeStackDistribution {
  /// Default value. The space between individual items is inflexible and
  basic,

  /// Items are evenly distributed within the stack.
  spaceBetween,

  /// Items are stretched equally to fill any available space in addition to
  /// predefined spacing between them.
  stretch,
}

/// Use Stacks when you need to lay out components by choosing either a
/// horizontal or vertical axis.
///
/// Stacks are flexible in order to cover a wide range of scenarios.
class BeStack extends StatelessWidget {
  const BeStack({
    super.key,
    required this.children,
    this.direction = Axis.vertical,
    this.mainAxisAlignment = BeStackAlignment.start,
    this.crossAxisAlignment = BeStackAlignment.center,
    this.distribution = BeStackDistribution.basic,
    this.breakpoint,
    this.spacing = 0.0,
    this.mainAxisSize = MainAxisSize.max,
  });

  /// Establishes a horizontal or vertical direction for stack items.
  final Axis direction;

  /// Sets the alignment of stack items within the main direction.
  final BeStackAlignment mainAxisAlignment;

  /// Sets the alignment of stack items within the cross direction.
  final BeStackAlignment crossAxisAlignment;

  /// Sets the distribution of items along main axis inside a stack.
  final BeStackDistribution distribution;

  /// The widgets below this widget in the tree.
  final List<Widget> children;

  /// Changes the value to trigger vertical item stacking on a user's
  /// selected breakpoint range.
  final BeBreakpoint? breakpoint;

  /// Changes spacing between stack items.
  final double spacing;

  /// Defines amount of space taken by the main axis.
  final MainAxisSize mainAxisSize;

  Axis _direction(BuildContext context) {
    final breakpoint = BeTheme.of(context).breakpoint;

    if (direction == Axis.vertical) {
      return direction;
    }

    final width = MediaQuery.sizeOf(context).width;
    final stackBreakpoint = calculateBreakpoint(width);

    return stackBreakpoint.index <= breakpoint.index
        ? Axis.vertical
        : Axis.horizontal;
  }

  List<Widget> _children(BuildContext context) => switch (distribution) {
    BeStackDistribution.basic => _childrenWithSpacing(context, children),
    BeStackDistribution.spaceBetween =>
      children.intersperse(const Spacer()).toList(),
    BeStackDistribution.stretch => _childrenWithSpacing(
      context,
      children.map((c) => Expanded(child: c)).toList(),
    ),
  };

  List<Widget> _childrenWithSpacing(
    BuildContext context,
    List<Widget> children,
  ) {
    final direction = _direction(context);
    final spacer = SizedBox(
      width: direction == Axis.vertical ? null : spacing,
      height: direction == Axis.vertical ? spacing : null,
    );

    return children.intersperse(spacer).toList();
  }

  @override
  Widget build(BuildContext context) => Flex(
    direction: _direction(context),
    mainAxisAlignment: mainAxisAlignment.mainAxisAlignment,
    crossAxisAlignment: crossAxisAlignment.crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    children: _children(context),
  );
}

extension on BeStackAlignment {
  CrossAxisAlignment get crossAxisAlignment => switch (this) {
    BeStackAlignment.start => CrossAxisAlignment.start,
    BeStackAlignment.center => CrossAxisAlignment.center,
    BeStackAlignment.end => CrossAxisAlignment.end,
  };

  MainAxisAlignment get mainAxisAlignment => switch (this) {
    BeStackAlignment.start => MainAxisAlignment.start,
    BeStackAlignment.center => MainAxisAlignment.center,
    BeStackAlignment.end => MainAxisAlignment.end,
  };
}

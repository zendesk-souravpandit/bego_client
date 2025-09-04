// ignore_for_file: library_private_types_in_public_api, lines_longer_than_80_chars

import 'package:flutter/material.dart';

/// A widget that visually offsets its child by the given [offset] without affecting layout size.
/// Useful for floating, badges, or micro-interactions where the child should appear shifted.
class BeOffset extends StatelessWidget {
  const BeOffset({super.key, required this.child, this.offset = Offset.zero});

  final Widget child;
  final Offset offset;

  @override
  Widget build(final BuildContext context) {
    if (offset == Offset.zero) return child;
    return Transform.translate(offset: offset, child: child);
  }
}

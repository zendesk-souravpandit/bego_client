import 'package:flutter/material.dart';

class HiddenScrollList extends StatelessWidget {
  const HiddenScrollList({super.key, required this.children, required this.padding});

  final List<Widget> children;
  final EdgeInsets padding;

  @override
  Widget build(final BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView(padding: padding, children: children),
    );
  }
}

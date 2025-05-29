import 'package:flutter/material.dart' show IconData, Widget, VoidCallback;

class ListTileItem {
  ListTileItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
}

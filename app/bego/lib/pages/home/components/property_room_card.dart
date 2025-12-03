import 'package:flutter/material.dart';

class PropertyRoomCard extends StatelessWidget {
  final String roomName;
  final VoidCallback? onEditTap;

  const PropertyRoomCard({super.key, required this.roomName, this.onEditTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          roomName,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        if (onEditTap != null)
          IconButton(
            icon: const Icon(Icons.edit, size: 20),
            onPressed: onEditTap,
            splashRadius: 20,
          ),
      ],
    );
  }
}

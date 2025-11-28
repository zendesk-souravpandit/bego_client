import 'package:flutter/material.dart';

class DetailsHeader extends StatelessWidget {
  final String itemName;
  final double rating;
  final String description;

  const DetailsHeader({
    super.key,
    required this.itemName,
    required this.rating,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(itemName, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 8),
            Text('$rating stars'),
          ],
        ),
        const SizedBox(height: 16),
        Text('Description', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

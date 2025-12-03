import 'package:beui/text.dart';
import 'package:flutter/material.dart';

class EquipmentTags extends StatelessWidget {
  final List<String> amenities;
  final int? displayLimit;
  final VoidCallback? onShowAll;

  const EquipmentTags({
    super.key,
    required this.amenities,
    this.displayLimit = 3,
    this.onShowAll,
  });

  @override
  Widget build(BuildContext context) {
    final displayAmenities =
        displayLimit != null && amenities.length > displayLimit!
        ? amenities.take(displayLimit!).toList()
        : amenities;
    final hasMore = displayLimit != null && amenities.length > displayLimit!;

    return Container(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Equipment',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...displayAmenities.map(
                (amenity) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Text(
                    amenity,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                  ),
                ),
              ),
            ],
          ),
          if (hasMore) ...[
            const SizedBox(height: 8),
            GestureDetector(
              onTap: onShowAll,
              child: BeText(
                'Show All Amenities',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color.fromARGB(255, 99, 88, 245),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

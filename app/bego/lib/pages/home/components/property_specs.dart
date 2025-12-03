import 'package:flutter/material.dart';

class PropertySpecs extends StatelessWidget {
  final String livingSpace;
  final String livingSpaceUnit;
  final int rooms;

  const PropertySpecs({
    super.key,
    required this.livingSpace,
    this.livingSpaceUnit = 'sq m',
    required this.rooms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SpecItem(
            icon: Icons.home_work,
            value: livingSpace,
            unit: livingSpaceUnit,
            label: 'Living space',
          ),
          Container(width: 1, height: 60, color: Colors.grey[300]),
          _SpecItem(
            icon: Icons.door_sliding,
            value: rooms.toString(),
            unit: '',
            label: 'Rooms',
          ),
        ],
      ),
    );
  }
}

class _SpecItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String unit;
  final String label;

  const _SpecItem({
    required this.icon,
    required this.value,
    required this.unit,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey[600], size: 28),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (unit.isNotEmpty)
                  TextSpan(
                    text: ' $unit',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

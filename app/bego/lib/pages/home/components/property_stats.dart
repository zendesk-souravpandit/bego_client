import 'package:beui/beui.dart';
import 'package:beui/layout.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class PropertyStats extends StatelessWidget {
  final int propertyCount;
  final int tenantCount;
  final int requestCount;
  final VoidCallback? onCalendarTap;

  const PropertyStats({
    super.key,
    this.propertyCount = 0,
    this.tenantCount = 0,
    this.requestCount = 0,
    this.onCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = BeTheme.of(context).breakpoint.isMobile;
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        // Stats row - wrapped in white card
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            alignment: WrapAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: [
              _StatItem(
                icon: Icons.domain,
                count: propertyCount,
                label: 'Properties',
              ),
              _StatItem(
                icon: Icons.people,
                count: tenantCount,
                label: 'Tenants',
              ),
              _StatItem(
                icon: Icons.assignment,
                count: requestCount,
                label: 'Requests',
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Calendar button
        Container(
          padding: isMobile ? null : const EdgeInsets.only(right: 32),
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onCalendarTap,
            icon: const Icon(Icons.calendar_today),
            label: FittedBox(
              child: const BeText(
                'Show Property Calendar',
                color: Colors.white,
                maxLine: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 99, 88, 245),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final int count;
  final String label;

  const _StatItem({
    required this.icon,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pl8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 4,
        children: [
          Icon(icon, color: Colors.grey[600], size: 12),
          const SizedBox(height: 8),
          BeText(
            count.toString(),
            style: const TextStyle(color: BeColors.gray500, fontSize: 12),
          ),
          const SizedBox(height: 4),
          BeText(
            label,
            maxLine: 1,
            style: const TextStyle(color: BeColors.gray500, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

import 'package:bego/pages/home/components/property_stats.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class PropertyHeader extends StatelessWidget {
  final String title;
  final String address;
  final String imageUrl;
  final VoidCallback? onMapTap;

  const PropertyHeader({
    super.key,
    required this.title,
    required this.address,
    required this.imageUrl,
    this.onMapTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = BeTheme.of(context).breakpoint.isMobile;

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 240,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 99, 88, 245),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Title and address
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  address,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                ),
              ),
              if (onMapTap != null)
                TextButton(
                  onPressed: onMapTap,
                  child: const Text('Open on maps'),
                ),
            ],
          ),
        ],
      );
    }

    // Desktop layout - horizontal
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: .start,
      children: [
        // Image on left
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          child: Image.network(
            imageUrl,
            height: 320,
            width: 320,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 320,
                width: 320,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.image_not_supported)),
              );
            },
          ),
        ),
        const SizedBox(width: 32),
        // Content on right
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: .start,
            children: [
              // Header with icon and menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 56,
                    height: 56,

                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              // Address with map link
              Row(
                children: [
                  const Icon(Icons.location_on, size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      address,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (onMapTap != null)
                GestureDetector(
                  onTap: onMapTap,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Open on maps',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              PropertyStats(
                propertyCount: 32,
                tenantCount: 10,
                requestCount: 8,
                onCalendarTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

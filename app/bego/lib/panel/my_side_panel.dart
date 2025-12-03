import 'package:flutter/material.dart';
import 'package:beui/beui.dart';
import 'package:beui/text.dart';

class MySidePanel extends StatefulWidget {
  const MySidePanel({super.key});

  @override
  State<MySidePanel> createState() => _MySidePanelState();
}

class _MySidePanelState extends State<MySidePanel> {
  String _selectedFilter = 'All Properties';
  final TextEditingController _searchController = TextEditingController();

  final List<PropertyItem> properties = [
    PropertyItem(
      id: '1',
      title: 'Salar Cir. S',
      address: '32 Salar Cir. S',
      subtitle: 'Salar Circle South',
      image: 'assets/property1.jpg',
      status: PropertyStatus.occupied,
      unitsCount: '32',
    ),
    PropertyItem(
      id: '2',
      title: '1th Floor, Left, Room 2',
      address: '1th Floor, Left, Room 2',
      subtitle: 'No tenants',
      image: null,
      status: PropertyStatus.vacant,
      unitsCount: null,
      area: '112 sq m',
    ),
    PropertyItem(
      id: '3',
      title: '2th Floor, Left, Room 3',
      address: '2th Floor, Left, Room 3',
      subtitle: 'No tenants',
      image: null,
      status: PropertyStatus.request,
      unitsCount: null,
      area: '128 sq m',
    ),
    PropertyItem(
      id: '4',
      title: '3th Floor, Left, Room 4',
      address: '3th Floor, Left, Room 4',
      subtitle: 'Courtney Henry',
      image: null,
      status: PropertyStatus.maintenance,
      unitsCount: null,
      area: '118 sq m',
    ),
  ];

  final List<PropertyGroup> propertyGroups = [
    PropertyGroup(
      id: '1',
      title: 'Salar Cir. S',
      address: '32 Salar Cir. S, Utica, Pennsylvania 57867',
      propertiesCount: 32,
      tenantsCount: 10,
      image: 'assets/property_group1.jpg',
    ),
    PropertyGroup(
      id: '2',
      title: 'Montan Property. 3517 W. Gray St.',
      address: 'Utica, Pennsylvania 57867',
      propertiesCount: 24,
      tenantsCount: 10,
      image: 'assets/property_group2.jpg',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Color _getStatusColor(PropertyStatus status) {
    switch (status) {
      case PropertyStatus.occupied:
        return Colors.green;
      case PropertyStatus.vacant:
        return Colors.purple;
      case PropertyStatus.maintenance:
        return Colors.orange;
      case PropertyStatus.request:
        return Colors.blueGrey;
    }
  }

  String _getStatusLabel(PropertyStatus status) {
    switch (status) {
      case PropertyStatus.occupied:
        return 'Occupied';
      case PropertyStatus.vacant:
        return 'Vacant';
      case PropertyStatus.maintenance:
        return 'Maintenance';
      case PropertyStatus.request:
        return 'Request';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BeText.headlineSmall('My Properties'),
                const SizedBox(height: 16),
                // Search Box
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue.shade300),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Filter and Count
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BeText.labelMedium(
                  '${properties.length} Property Place',
                  color: Colors.grey.shade600,
                ),
                _buildFilterButton(),
              ],
            ),
          ),
          // Properties List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: properties.length,
              itemBuilder: (context, index) {
                final property = properties[index];
                return _buildPropertyItem(property);
              },
            ),
          ),
          const Divider(height: 1),
          // Property Groups
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: propertyGroups.length,
              itemBuilder: (context, index) {
                final group = propertyGroups[index];
                return _buildPropertyGroupItem(group);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: PopupMenuButton<String>(
        onSelected: (String value) {
          setState(() {
            _selectedFilter = value;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'All Properties',
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.black, size: 8),
                SizedBox(width: 12),
                Text('All Properties'),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Occupied',
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.green, size: 8),
                SizedBox(width: 12),
                Text('Occupied'),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Vacant',
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.purple, size: 8),
                SizedBox(width: 12),
                Text('Vacant'),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Maintenance',
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.orange, size: 8),
                SizedBox(width: 12),
                Text('Maintenance'),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'Request',
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.blueGrey, size: 8),
                SizedBox(width: 12),
                Text('Request'),
              ],
            ),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BeText.labelMedium(_selectedFilter),
              const SizedBox(width: 8),
              Icon(Icons.expand_less, size: 20, color: Colors.grey.shade700),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyItem(PropertyItem property) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          children: [
            // Image
            if (property.image != null)
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade300,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://picsum.photos/200',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (property.image != null) const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BeText.labelLarge(property.title),
                  const SizedBox(height: 4),
                  BeText.labelSmall(
                    property.subtitle,
                    color: Colors.grey.shade600,
                  ),
                  if (property.unitsCount != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.home, size: 14, color: Colors.grey.shade500),
                        const SizedBox(width: 4),
                        BeText.labelSmall(
                          property.unitsCount!,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Status Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getStatusColor(property.status).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: BeText.labelSmall(
                _getStatusLabel(property.status),
                color: _getStatusColor(property.status),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyGroupItem(PropertyGroup group) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          children: [
            // Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BeText.labelLarge(group.title),
                  const SizedBox(height: 4),
                  BeText.labelSmall(
                    group.address,
                    color: Colors.grey.shade600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.home, size: 14, color: Colors.grey.shade500),
                      const SizedBox(width: 4),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: BeText(
                            '${group.propertiesCount} Properties',
                            style: TextStyle(fontSize: 12),
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.person, size: 14, color: Colors.grey.shade500),
                      const SizedBox(width: 4),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: BeText(
                            '${group.tenantsCount} Tenants',
                            style: TextStyle(fontSize: 12),
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Menu
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.grey.shade500),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

enum PropertyStatus { occupied, vacant, maintenance, request }

class PropertyItem {
  final String id;
  final String title;
  final String address;
  final String subtitle;
  final String? image;
  final PropertyStatus status;
  final String? unitsCount;
  final String? area;

  PropertyItem({
    required this.id,
    required this.title,
    required this.address,
    required this.subtitle,
    this.image,
    required this.status,
    this.unitsCount,
    this.area,
  });
}

class PropertyGroup {
  final String id;
  final String title;
  final String address;
  final int propertiesCount;
  final int tenantsCount;
  final String image;

  PropertyGroup({
    required this.id,
    required this.title,
    required this.address,
    required this.propertiesCount,
    required this.tenantsCount,
    required this.image,
  });
}

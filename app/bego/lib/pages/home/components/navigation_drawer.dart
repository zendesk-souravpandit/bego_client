import 'package:flutter/material.dart';

class AppNavigationDrawer extends StatelessWidget {
  final String userName;
  final String userRole;
  final String userImage;
  final List<DrawerItem> items;
  final int selectedIndex;
  final Function(int) onItemTap;

  const AppNavigationDrawer({
    super.key,
    required this.userName,
    required this.userRole,
    required this.userImage,
    required this.items,
    this.selectedIndex = 0,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 40, 30, 80),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(userImage),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            userRole,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Menu Items
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = selectedIndex == index;
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: isSelected
                        ? const Color.fromARGB(255, 99, 88, 245)
                        : Colors.grey[600],
                  ),
                  title: Text(
                    item.label,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.grey[700],
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  tileColor: isSelected ? Colors.grey[100] : null,
                  selected: isSelected,
                  onTap: () {
                    onItemTap(index);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          // Logout option
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                // Add logout functionality here
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  DrawerItem({required this.icon, required this.label, required this.onTap});
}

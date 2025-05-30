import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 2; // Clark tab selected
  final bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // setState(() => _isLoading = false);
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (final i) => setState(() => selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Shopping List'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Clark'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: BeSkeleton(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar with shimmering circle placeholder when loading
                BeBadge(
                  position: BeBadgePosition.centerRight,
                  offset: const Offset(0, -20),
                  badge: BeBone.card(
                    width: 60,
                    height: 32,
                    isLoading: _isLoading,
                    ignoreMissingDecoration: false,
                    borderRadius: BorderRadius.circular(8),
                    child:
                        _isLoading
                            ? null
                            : ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.edit, size: 16),
                              label: const Text('Edit'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                textStyle: const TextStyle(fontSize: 12),
                              ),
                            ),
                  ),
                  child: BeBone.circle(
                    diameter: 80,
                    isLoading: _isLoading,
                    child: _isLoading ? null : const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
                  ),
                ),
                const SizedBox(height: 12),

                // Name text placeholder
                BeBone.text(
                  width: 120,
                  fontSize: 18,
                  isLoading: _isLoading,
                  child:
                      _isLoading
                          ? null
                          : const Text('Clark Kent', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                const SizedBox(height: 8),

                // Level and points row with shimmer on texts
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BeBone.text(
                      width: 40,
                      fontSize: 14,
                      isLoading: _isLoading,
                      child: _isLoading ? null : const Text('Lv. 1'),
                    ),
                    const VerticalDivider(thickness: 1, width: 20),
                    BeBone.text(
                      width: 80,
                      fontSize: 14,
                      isLoading: _isLoading,
                      child: _isLoading ? null : const Text('1450 Points'),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Progress bar and labels
                Row(
                  children: [
                    const Icon(Icons.star_border, size: 16, color: Colors.grey), // Replace with your icon
                    const SizedBox(width: 4),
                    BeBone.text(
                      width: 80,
                      fontSize: 14,
                      isLoading: _isLoading,
                      child: _isLoading ? null : const Text('Lv. 1: 1450 pts'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: BeBone.card(
                        width: double.infinity,
                        height: 8,
                        isLoading: _isLoading,
                        child:
                            _isLoading
                                ? null
                                : LinearProgressIndicator(
                                  value: 1450 / 3000,
                                  backgroundColor: Colors.grey.shade300,
                                  color: Colors.amber,
                                  minHeight: 8,
                                ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    BeBone.text(
                      width: 80,
                      fontSize: 14,
                      isLoading: _isLoading,
                      child: _isLoading ? null : const Text('Lv. 2: 3000 pts'),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.military_tech, size: 16, color: Colors.grey), // Replace with your icon
                  ],
                ),

                const SizedBox(height: 24),

                // "Go ad free" card
                BeBone.card(
                  width: double.infinity,
                  height: 72,
                  isLoading: _isLoading,
                  borderRadius: BorderRadius.circular(12),
                  child:
                      _isLoading
                          ? null
                          : Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              leading: const Icon(Icons.star), // Replace with your icon
                              title: const Text('Go ad free!'),
                              subtitle: const Text('Buy reno premium'),
                              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                              onTap: () {},
                            ),
                          ),
                ),

                const SizedBox(height: 24),

                // List of options with shimmer on each tile
                ...[
                  _buildListTile(Icons.restore, 'Restore Purchases'),
                  _buildListTile(Icons.person_add, 'Refer & earn points'),
                  _buildListTile(Icons.account_circle, 'My Avatars and points'),
                  _buildListTile(Icons.chat_bubble_outline, 'Give Feedback'),
                  _buildListTile(Icons.straighten, 'Measurement Preference'),
                ].map((final tile) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BeBone.card(
                      width: double.infinity,
                      height: 24,
                      isLoading: _isLoading,
                      borderRadius: BorderRadius.circular(8),
                      child: _isLoading ? null : tile,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(final IconData icon, final String title, {final VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 8,
    );
  }
}

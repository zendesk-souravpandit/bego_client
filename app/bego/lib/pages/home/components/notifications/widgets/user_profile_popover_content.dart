import 'package:flutter/material.dart';

class UserProfilePopoverContent extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userImage;
  final VoidCallback? onActivityTap;
  final VoidCallback? onIntegrationsTap;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onAddAccountTap;
  final VoidCallback? onLogoutTap;
  final bool isDarkMode;
  final VoidCallback? onDarkModeToggle;

  const UserProfilePopoverContent({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userImage,
    this.onActivityTap,
    this.onIntegrationsTap,
    this.onSettingsTap,
    this.onAddAccountTap,
    this.onLogoutTap,
    this.isDarkMode = false,
    this.onDarkModeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // User Profile Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    userName,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Text(
                                    'PRO',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              userEmail,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey[200]),

            // Dark Mode Toggle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.dark_mode_outlined,
                        size: 20,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Dark Mode',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 44,
                    height: 24,
                    child: Switch(
                      value: isDarkMode,
                      onChanged: (_) => onDarkModeToggle?.call(),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey[200]),

            // Menu Items
            _buildMenuItem(
              icon: Icons.trending_up_outlined,
              label: 'Activity',
              onTap: onActivityTap,
            ),
            _buildMenuItem(
              icon: Icons.integration_instructions,
              label: 'Integrations',
              onTap: onIntegrationsTap,
            ),
            _buildMenuItem(
              icon: Icons.settings_outlined,
              label: 'Settings',
              onTap: onSettingsTap,
            ),
            Divider(height: 1, color: Colors.grey[200]),

            // Add Account & Logout
            _buildMenuItem(
              icon: Icons.add,
              label: 'Add Account',
              onTap: onAddAccountTap,
            ),
            _buildMenuItem(
              icon: Icons.logout,
              label: 'Logout',
              onTap: onLogoutTap,
            ),
            Divider(height: 1, color: Colors.grey[200]),

            // Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                'v1.5.69 · Terms & Conditions',
                style: TextStyle(fontSize: 11, color: Colors.grey[500]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              Icon(icon, size: 20, color: Colors.grey[700]),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

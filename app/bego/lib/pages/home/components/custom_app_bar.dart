import 'package:beui/beui.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String userName;
  final String userRole;
  final String userImage;
  final int? notificationCount;
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;
  final VoidCallback? onCartTap;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.userName,
    required this.userRole,
    required this.userImage,
    this.notificationCount = 0,
    this.onMenuTap,
    this.onNotificationTap,
    this.onProfileTap,
    this.onCartTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final isMobile = BeTheme.of(context).breakpoint.isMobile;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      toolbarHeight: 56,
      leading: isMobile
          ? IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: onMenuTap ?? () => Scaffold.of(context).openDrawer(),
            )
          : null,
      title: Row(
        children: [
          if (!isMobile)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 30, 80),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.home, color: Colors.white, size: 24),
            ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      actions: [
        // Notifications
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: onNotificationTap,
            ),
            if (notificationCount != null && notificationCount! > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Center(
                    child: Text(
                      notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 8),
        // User profile
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: GestureDetector(
            onTap: onProfileTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  userName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  userRole,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
        CircleAvatar(radius: 18, backgroundImage: NetworkImage(userImage)),
        const SizedBox(width: 12),
      ],
    );
  }
}

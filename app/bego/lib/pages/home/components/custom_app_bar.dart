import 'package:becore/getx.dart';
import 'package:beui/beui.dart';
import 'package:flutter/material.dart';
import 'notifications/notifications.dart';
import 'notifications/widgets/user_profile_popover_content.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String userName;
  final String userRole;
  final String userImage;
  final int? notificationCount;
  final VoidCallback? onMenuTap;
  final List<NotificationItem>? notifications;
  final Function(NotificationItem)? onNotificationTap;
  final Function(NotificationItem)? onNotificationDismiss;
  final VoidCallback? onMarkAllRead;
  final VoidCallback? onClearAllNotifications;
  final VoidCallback? onProfileTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onActivityTap;
  final VoidCallback? onIntegrationsTap;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onAddAccountTap;
  final VoidCallback? onLogoutTap;
  final VoidCallback? onDarkModeToggle;
  final bool isDarkMode;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.userName,
    required this.userRole,
    required this.userImage,
    this.notificationCount = 0,
    this.onMenuTap,
    this.notifications,
    this.onNotificationTap,
    this.onNotificationDismiss,
    this.onMarkAllRead,
    this.onClearAllNotifications,
    this.onProfileTap,
    this.onCartTap,
    this.onActivityTap,
    this.onIntegrationsTap,
    this.onSettingsTap,
    this.onAddAccountTap,
    this.onLogoutTap,
    this.onDarkModeToggle,
    this.isDarkMode = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
  late final BePopoverController _notificationController = BePopoverController(
    vsync: this,
  );
  late final BePopoverController _profileController = BePopoverController(
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    final isMobile = BeTheme.of(context).breakpoint.isMobile;

    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 56,
      leading: isMobile
          ? IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed:
                  widget.onMenuTap ?? () => Scaffold.of(context).openDrawer(),
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
              widget.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      actions: [
        // Notification Popover
        BePopover(
          controller: _notificationController,
          autofocus: true,
          childAnchor: Alignment.bottomRight,
          popoverAnchor: Alignment.topRight,
          child: BeBadge(
            rounded: true,
            badge:
                widget.notificationCount != null &&
                    widget.notificationCount! > 0
                ? Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : null,
            offset: const Offset(0, 8),
            child: IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {
                _notificationController.show();
              },
            ),
          ),
          popoverBuilder:
              (BuildContext context, BoxDecoration value, Widget? child) {
                return NotificationPopoverContent(
                  notifications:
                      widget.notifications ??
                      SampleNotifications.getSampleNotifications(),
                  controller: _notificationController,
                  onNotificationTap: widget.onNotificationTap,
                  onNotificationDismiss: widget.onNotificationDismiss,
                  onMarkAllRead: widget.onMarkAllRead,
                  onClearAll: widget.onClearAllNotifications,
                );
              },
        ),
        const SizedBox(width: 8),

        // User profile
        BePopover(
          controller: _profileController,
          autofocus: true,
          childAnchor: Alignment.bottomRight,
          popoverAnchor: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              _profileController.show();
            },
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(widget.userImage),
            ),
          ),
          popoverBuilder:
              (BuildContext context, BoxDecoration value, Widget? child) {
                return UserProfilePopoverContent(
                  userName: widget.userName,
                  userEmail: 'user@example.com',
                  userImage: widget.userImage,
                  isDarkMode: widget.isDarkMode,
                  onActivityTap: () {
                    _profileController.hide();
                    widget.onActivityTap?.call();
                  },
                  onIntegrationsTap: () {
                    _profileController.hide();
                    widget.onIntegrationsTap?.call();
                  },
                  onSettingsTap: () {
                    Get.toNamed('/settings');
                    _profileController.hide();
                    widget.onSettingsTap?.call();
                  },
                  onAddAccountTap: () {
                    _profileController.hide();
                    widget.onAddAccountTap?.call();
                  },
                  onLogoutTap: () {
                    _profileController.hide();
                    widget.onLogoutTap?.call();
                  },
                  onDarkModeToggle: () {
                    widget.onDarkModeToggle?.call();
                  },
                );
              },
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  void dispose() {
    _notificationController.dispose();
    _profileController.dispose();
    super.dispose();
  }
}

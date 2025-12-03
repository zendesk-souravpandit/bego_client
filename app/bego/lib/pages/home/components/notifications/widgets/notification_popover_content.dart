import 'package:beui/overlay.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'notification_list.dart';

class NotificationPopoverContent extends StatefulWidget {
  final List<NotificationItem> notifications;
  final Function(NotificationItem)? onNotificationTap;
  final Function(NotificationItem)? onNotificationDismiss;
  final VoidCallback? onMarkAllRead;
  final VoidCallback? onClearAll;
  final BePopoverController? controller;

  const NotificationPopoverContent({
    super.key,
    required this.notifications,
    this.onNotificationTap,
    this.onNotificationDismiss,
    this.onMarkAllRead,
    this.onClearAll,
    this.controller,
  });

  @override
  State<NotificationPopoverContent> createState() =>
      _NotificationPopoverContentState();
}

class _NotificationPopoverContentState extends State<NotificationPopoverContent>
    with SingleTickerProviderStateMixin {
  late final BePopoverController _controller =
      widget.controller ?? BePopoverController(vsync: this);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: NotificationList(
        notifications: widget.notifications,
        onNotificationTap: (notification) {
          widget.onNotificationTap?.call(notification);
        },
        onNotificationDismiss: (notification) {
          widget.onNotificationDismiss?.call(notification);
        },
        onMarkAllRead: widget.onMarkAllRead,
        onClearAll: widget.onClearAll,
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}

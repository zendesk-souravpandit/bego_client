import 'package:bego/pages/home/components/notifications/notifications.dart';

/// Sample notification data for testing and development
class SampleNotifications {
  static List<NotificationItem> getSampleNotifications() {
    return [
      NotificationItem(
        id: '1',
        title: 'Joy Pacheco mentioned you on Improve cards readability',
        message:
            'I\'ve started working on a first draft, feel free to take a look and tell me what you think.',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: NotificationType.info,
        avatarUrl:
            'https://randomuser.me/api/portraits/men/75.jpg', // Placeholder avatar
        department: 'Engineering',
        isRead: false,
      ),
      NotificationItem(
        id: '2',
        title: 'Jamie Schwartz requests access to Design',
        message:
            'Waiting for your approval to grant access to the Design project.',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        type: NotificationType.warning,
        avatarUrl:
            'https://randomuser.me/api/portraits/men/76.jpg', // Placeholder avatar
        department: 'Design',
        isRead: false,
      ),
      NotificationItem(
        id: '3',
        title: 'Fahmida Juarez assigned you to Improve cards readability',
        message:
            'You have been assigned to the task. Check the details in the project.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.success,
        avatarUrl:
            'https://randomuser.me/api/portraits/men/77.jpg', // Placeholder avatar
        department: 'Engineering',
        isRead: true,
      ),
      NotificationItem(
        id: '4',
        title: 'System update completed successfully',
        message: 'All systems have been updated to the latest version.',
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        type: NotificationType.success,
        department: 'System',
        isRead: true,
      ),
      NotificationItem(
        id: '5',
        title: 'Warning: High memory usage detected',
        message:
            'Your application is consuming more memory than usual. Consider optimizing.',
        timestamp: DateTime.now().subtract(const Duration(days: 3)),
        type: NotificationType.warning,
        department: 'Performance',
        isRead: true,
      ),
      NotificationItem(
        id: '6',
        title: 'Error in deployment process',
        message: 'The deployment to production failed. Please check the logs.',
        timestamp: DateTime.now().subtract(const Duration(days: 5)),
        type: NotificationType.error,
        department: 'DevOps',
        isRead: true,
      ),
    ];
  }

  static List<NotificationItem> getUnreadNotifications() {
    return getSampleNotifications().where((n) => !n.isRead).toList();
  }

  static int getUnreadCount() {
    return getUnreadNotifications().length;
  }
}

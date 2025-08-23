import 'package:beui/be_icons.dart';
import 'package:beui/overlay.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeNotificationProvider', path: 'widget/overlay', type: BeNotificationsProvider)
Widget useCaseBeNotificationProvider(final BuildContext context) => const BeNotificationProviderDemo();

class BeNotificationProviderDemo extends StatefulWidget {
  const BeNotificationProviderDemo({super.key});

  @override
  State<BeNotificationProviderDemo> createState() => _BeNotificationProviderDemoState();
}

class _BeNotificationProviderDemoState extends State<BeNotificationProviderDemo> with SingleTickerProviderStateMixin {
  late final BePopoverController controller = BePopoverController(vsync: this);
  int _notificationCounter = 0;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            final notificationKey = ValueKey('notification_${++_notificationCounter}');
            BeNotificationManager.of(context).show(
              ListTile(
                title: const Text('This is a notification'),
                subtitle: const Text('This is a notification subtitle'),
                leading: const Icon(BeIcons.icon_abstract),
                trailing: IconButton(
                  onPressed: () {
                    BeNotificationManager.of(context).dismissByKey(notificationKey);
                  },
                  icon: const Icon(BeIcons.icon_close),
                ),
              ),
              key: notificationKey,
            );
          },
          child: const Text('Show Notification'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            BeNotificationManager.of(context).dismiss();
          },
          child: const Text('Dismiss All Notifications'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            BeNotificationManager.of(context).dismissAllOfType(ListTile);
          },
          child: const Text('Dismiss All ListTile Notifications'),
        ),
      ],
    );
  }
}

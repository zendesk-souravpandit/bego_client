import 'package:beui/overlay.dart';
import 'package:beui/text.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeNotificationProvider', path: 'widget/overlay', type: BeNotificationsProvider)
Widget useCaseBeNotificationProvider(final BuildContext context) => const BeNotificationPoviderDemo();

class BeNotificationPoviderDemo extends StatefulWidget {
  const BeNotificationPoviderDemo({super.key});

  @override
  State<BeNotificationPoviderDemo> createState() => _BeNotificationPoviderDemoState();
}

class _BeNotificationPoviderDemoState extends State<BeNotificationPoviderDemo> with SingleTickerProviderStateMixin {
  late final BePopoverController controller = BePopoverController(vsync: this);

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            BeNotificationManager.of(
              context,
            ).show(const Card(color: Colors.red, child: BeText('This is a notification')));
          },
          child: const Text('Show Notification'),
        ),
      ],
    );
  }
}

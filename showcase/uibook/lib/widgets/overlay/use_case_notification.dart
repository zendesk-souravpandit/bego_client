import 'package:beui/be_icons.dart';
import 'package:beui/overlay.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:uibook/core/widgetbook/modal_option.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeNotificationProvider', path: 'widget/overlay', type: BeNotificationsProvider)
Widget useCaseBeNotificationProvider(final BuildContext context) {
  // Interactive knobs for customizing notifications
  final notificationPosition = context.knobs.object.dropdown(
    label: 'Notification Position',
    options: BeNotifyPosition.values.map((final option) {
      return KnobOption(label: option.name, value: option);
    }).toList(),
    labelBuilder: (final value) => value.label,
  );

  final notificationIcon = context.knobs.object.dropdown(
    label: 'Notification Icon',
    options: [
      const KnobOption(label: 'Abstract', value: BeIcons.icon_abstract),
      const KnobOption(label: 'Check', value: BeIcons.icon_check),
      const KnobOption(label: 'Check Filled', value: BeIcons.icon_check_filled),
      const KnobOption(label: 'Close', value: BeIcons.icon_close),
      const KnobOption(label: 'Info', value: BeIcons.icon_info),
      const KnobOption(label: 'Bell', value: BeIcons.icon_bell),
    ],
    labelBuilder: (final value) => value.label,
  );

  final iconColor = context.knobs.object.dropdown(
    label: 'Icon Color',
    options: [
      const KnobOption(label: 'Primary', value: BeColors.primary),
      const KnobOption(label: 'Secondary', value: BeColors.secondary),
      const KnobOption(label: 'Blue', value: BeColors.blue),
      const KnobOption(label: 'Green', value: BeColors.green),
      const KnobOption(label: 'Orange', value: BeColors.orange),
      const KnobOption(label: 'Red', value: BeColors.red),
      const KnobOption(label: 'Purple', value: BeColors.purple),
    ],
    labelBuilder: (final value) => value.label,
  );

  final notificationTitle = context.knobs.string(label: 'Notification Title', initialValue: 'Interactive Notification');

  final notificationSubtitle = context.knobs.string(
    label: 'Notification Subtitle',
    initialValue: 'This notification was customized using Widgetbook knobs',
  );

  final showCloseButton = context.knobs.boolean(label: 'Default Card', initialValue: true);

  final notificationType = context.knobs.object.dropdown(
    label: 'Notification Type',
    options: [
      const KnobOption(label: 'ListTile', value: 'listtile'),
      const KnobOption(label: 'Custom Card', value: 'card'),
      const KnobOption(label: 'Simple Text', value: 'text'),
    ],
    labelBuilder: (final value) => value.label,
  );

  return BeNotificationPlaygroundDemo(
    position: notificationPosition.value,
    icon: notificationIcon.value,
    iconColor: iconColor.value,
    title: notificationTitle,
    subtitle: notificationSubtitle,
    defaultCardWrapper: showCloseButton,
    notificationType: notificationType.value,
  );
}

class BeNotificationPlaygroundDemo extends StatefulWidget {
  const BeNotificationPlaygroundDemo({
    required this.position,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.defaultCardWrapper,
    required this.notificationType,
    super.key,
  });

  final BeNotifyPosition position;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool defaultCardWrapper;
  final String notificationType;

  @override
  State<BeNotificationPlaygroundDemo> createState() => _BeNotificationPlaygroundDemoState();
}

class _BeNotificationPlaygroundDemoState extends State<BeNotificationPlaygroundDemo>
    with SingleTickerProviderStateMixin {
  late final BePopoverController controller = BePopoverController(vsync: this);
  int _notificationCounter = 0;

  Widget _buildNotificationContent(final ValueKey<String> notificationKey) {
    switch (widget.notificationType) {
      case 'listtile':
        return ListTile(
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          leading: Icon(widget.icon, color: widget.iconColor),
          trailing: widget.defaultCardWrapper
              ? IconButton(
                  onPressed: () {
                    BeNotificationManager.of(context).dismissByKey(notificationKey);
                  },
                  icon: const Icon(BeIcons.icon_close),
                )
              : null,
        );

      case 'card':
        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1 * 255),
                offset: const Offset(0, 4),
                blurRadius: 12,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: widget.iconColor.withValues(alpha: 0.1 * 255),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(widget.icon, color: widget.iconColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BeText.titleMedium(widget.title),
                    const SizedBox(height: 4),
                    BeText.bodySmall(widget.subtitle, color: BeColors.gray600),
                  ],
                ),
              ),
              if (widget.defaultCardWrapper)
                IconButton(
                  onPressed: () {
                    BeNotificationManager.of(context).dismissByKey(notificationKey);
                  },
                  icon: const Icon(BeIcons.icon_close, size: 20),
                ),
            ],
          ),
        );

      case 'text':
        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: widget.iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: widget.iconColor.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Icon(widget.icon, color: widget.iconColor, size: 20),
              const SizedBox(width: 8),
              Expanded(child: BeText.bodyMedium('${widget.title}: ${widget.subtitle}', color: widget.iconColor)),
              if (widget.defaultCardWrapper)
                GestureDetector(
                  onTap: () {
                    BeNotificationManager.of(context).dismissByKey(notificationKey);
                  },
                  child: Icon(BeIcons.icon_close, color: widget.iconColor, size: 16),
                ),
            ],
          ),
        );

      default:
        return ListTile(
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          leading: Icon(widget.icon, color: widget.iconColor),
        );
    }
  }

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Header
          const BeText.headlineMedium('Notification Playground'),
          const SizedBox(height: 8),
          const BeText.bodyMedium(
            'Customize notification properties using the knobs panel',
            color: BeColors.gray600,
            align: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Preview Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08 * 255),
                  offset: const Offset(0, 4),
                  blurRadius: 16,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: widget.iconColor.withValues(alpha: 0.1 * 255),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(widget.icon, color: widget.iconColor, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BeText.labelMedium('Preview Configuration'),
                          BeText.bodySmall(
                            'Position: ${widget.position.toString().split('.').last}',
                            color: BeColors.gray600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),

                // Action Buttons
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        final notificationKey = ValueKey('notification_${++_notificationCounter}');
                        BeNotificationManager.of(context).show(
                          _buildNotificationContent(notificationKey),
                          key: notificationKey,
                          position: widget.position,
                        );
                      },
                      icon: const Icon(Icons.notifications),
                      label: const Text('Show Custom Notification'),
                      style: ElevatedButton.styleFrom(backgroundColor: widget.iconColor, foregroundColor: Colors.white),
                    ),

                    OutlinedButton.icon(
                      onPressed: () {
                        BeNotificationManager.of(context).dismissAll();
                      },
                      icon: const Icon(Icons.clear_all),
                      label: const Text('Dismiss All'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        BeNotificationManager.of(context).dismiss();
                      },
                      icon: const Icon(Icons.clear_all),
                      label: const Text('Dismiss '),
                    ),

                    OutlinedButton.icon(
                      onPressed: () {
                        BeNotificationManager.of(context).dismissAllOfType(ListTile);
                      },
                      icon: const Icon(Icons.list),
                      label: const Text('Dismiss ListTiles'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Info Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: BeColors.blue.withValues(alpha: 0.05 * 255),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: BeColors.blue.withValues(alpha: 0.2 * 255)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, color: BeColors.blue, size: 20),
                    SizedBox(width: 8),
                    BeText.labelMedium('Interactive Features', color: BeColors.blue),
                  ],
                ),
                SizedBox(height: 8),
                BeText.bodySmall(
                  '• Customize notification position, icon, and colors\n'
                  '• Choose between different notification types\n'
                  '• Toggle close button visibility\n'
                  '• Modify title and subtitle text\n'
                  '• Test dismissal functionality',
                  color: BeColors.gray700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

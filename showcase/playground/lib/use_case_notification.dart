import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// Core Notification Manager Interface
// -----------------------------------------------------------------------------

/// The interface for controlling notifications (show, dismiss, dismissAll).
abstract class BeNotificationManager {
  /// Access the manager instance using the context.
  static BeNotificationManager of(final BuildContext context) {
    final data = context.dependOnInheritedWidgetOfExactType<_BeNotificationData>();
    if (data == null) {
      throw FlutterError(
        'BeNotificationManager not found. '
        'Wrap your app with BeNotificationsProvider to use this feature.',
      );
    }
    return data.manager;
  }

  void show(
    final Widget notification, {
    final Key? key,
    final Duration? dismissDuration,
    final BeNotifyPosition? position,
  });

  void dismissByKey(final Key key);
  void dismiss();
  void dismissAll();
  void dismissAllOfType(final Type type);
}

// InheritedWidget to expose the manager instance down the tree
class _BeNotificationData extends InheritedWidget {
  const _BeNotificationData(this.manager, {required super.child});

  final BeNotificationManager manager;

  @override
  bool updateShouldNotify(covariant final _BeNotificationData oldWidget) => false;
}

// -----------------------------------------------------------------------------
// Notification Positioning Logic (Extracted and Self-Contained)
// -----------------------------------------------------------------------------

enum BeNotifyPosition {
  topLeft,
  topCenter,
  topRight,
  rightCenter,
  bottomRight,
  bottomCenter,
  bottomLeft,
  leftCenter,
  center,
}

extension on BeNotifyPosition {
  bool get _isCenterPosition => switch (this) {
    BeNotifyPosition.center || BeNotifyPosition.topCenter || BeNotifyPosition.bottomCenter => true,
    _ => false,
  };

  double? left() => switch (this) {
    BeNotifyPosition.topLeft || BeNotifyPosition.bottomLeft || BeNotifyPosition.leftCenter => 16,
    _ => null,
  };

  double? top() => switch (this) {
    BeNotifyPosition.topLeft || BeNotifyPosition.topCenter || BeNotifyPosition.topRight => 16,
    BeNotifyPosition.leftCenter ||
    BeNotifyPosition.rightCenter ||
    BeNotifyPosition.center => null, // Centered vertically
    _ => null,
  };

  double? right() => switch (this) {
    BeNotifyPosition.topRight || BeNotifyPosition.bottomRight || BeNotifyPosition.rightCenter => 16,
    _ => null,
  };

  double? bottom() => switch (this) {
    BeNotifyPosition.bottomLeft || BeNotifyPosition.bottomCenter || BeNotifyPosition.bottomRight => 16,
    BeNotifyPosition.leftCenter ||
    BeNotifyPosition.rightCenter ||
    BeNotifyPosition.center => null, // Centered vertically
    _ => null,
  };

  Tween<Offset> get slideTween => switch (this) {
    BeNotifyPosition.topLeft || BeNotifyPosition.leftCenter => Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero),
    BeNotifyPosition.topRight || BeNotifyPosition.rightCenter => Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
    BeNotifyPosition.topCenter => Tween(begin: const Offset(0.0, -1.0), end: Offset.zero),
    BeNotifyPosition.bottomCenter ||
    BeNotifyPosition.bottomLeft ||
    BeNotifyPosition.bottomRight => Tween(begin: const Offset(0.0, 1.0), end: Offset.zero),
    BeNotifyPosition.center => Tween(begin: const Offset(0.0, 0.0), end: Offset.zero),
  };

  bool get reverse => switch (this) {
    BeNotifyPosition.bottomLeft || BeNotifyPosition.bottomCenter || BeNotifyPosition.bottomRight => true,
    _ => false,
  };
}

// -----------------------------------------------------------------------------
// Notification Container and Provider
// -----------------------------------------------------------------------------

/// The main provider that wraps the application and manages the notification state.
class BeNotificationsProvider extends StatefulWidget {
  const BeNotificationsProvider({
    super.key,
    required this.child,
    this.maxVisible = 3,
    this.position = BeNotifyPosition.topRight,
    this.animationDuration = const Duration(milliseconds: 300),
    this.autoDismissDuration = const Duration(seconds: 5),
    this.constraints,
  });

  final Widget child;
  final BeNotifyPosition position;
  final int maxVisible;
  final Duration animationDuration;
  final Duration autoDismissDuration;
  final BoxConstraints? constraints;

  @override
  State<BeNotificationsProvider> createState() => _BeNotificationsProviderState();
}

class _BeNotificationsProviderState extends State<BeNotificationsProvider>
    with TickerProviderStateMixin
    implements BeNotificationManager {
  final List<Widget> _notifications = [];
  final List<Widget> _queue = [];
  final Map<Key, Timer> _timers = {};
  final Map<Key, AnimationController> _animationControllers = {};

  // Cache position groups to avoid recalculation
  Map<BeNotifyPosition, List<int>>? _cachedPositionGroups;
  bool _needsPositionGroupUpdate = true;

  @override
  void show(
    final Widget notification, {
    final Key? key,
    final Duration? dismissDuration,
    final BeNotifyPosition? position,
  }) {
    final notificationKey = key ?? UniqueKey();
    final duration = dismissDuration ?? widget.autoDismissDuration;
    final resolvedPosition = position ?? widget.position;

    // Wrap the user's widget in a container that holds the necessary data
    final wrappedNotification = KeyedSubtree(
      key: notificationKey,
      child: _NotificationContainer(notification: notification, position: resolvedPosition),
    );

    // Handle existing notification with the same key
    if (_notifications.any((final w) => w.key == notificationKey)) {
      _removeNotification(_notifications.firstWhere((final n) => n.key == notificationKey));
    }

    if (_notifications.length < widget.maxVisible) {
      _addNotification(wrappedNotification, index: 0, dismissDuration: duration);
    } else {
      _queue.add(wrappedNotification);
    }
  }

  void _addNotification(final Widget notification, {final int index = 0, final Duration? dismissDuration}) {
    _notifications.insert(index, notification);
    _needsPositionGroupUpdate = true;

    final notificationKey = notification.key!;
    final controller = AnimationController(duration: widget.animationDuration, vsync: this);
    _animationControllers[notificationKey] = controller;

    setState(() {});
    controller.forward();

    _timers[notificationKey] = Timer(dismissDuration ?? widget.autoDismissDuration, () {
      if (_notifications.any((final n) => n.key == notificationKey)) {
        _removeNotification(notification);
      }
    });
  }

  void _removeNotification(final Widget notification) {
    final index = _notifications.indexOf(notification);
    if (index == -1) return;

    final notificationKey = notification.key;
    if (notificationKey != null) {
      _timers[notificationKey]?.cancel();
      _timers.remove(notificationKey);

      final controller = _animationControllers[notificationKey];
      if (controller != null && mounted) {
        controller.reverse().then((_) {
          if (mounted && _notifications.contains(notification)) {
            setState(() {
              _notifications.remove(notification);
              _needsPositionGroupUpdate = true;
            });
            _animationControllers.remove(notificationKey);
            controller.dispose();
            _handleNotificationDismiss();
          }
        });
      } else {
        _notifications.removeAt(index);
        _needsPositionGroupUpdate = true;
        setState(() {});
        _handleNotificationDismiss();
      }
    }
  }

  void _handleNotificationDismiss() {
    if (_queue.isNotEmpty && _notifications.length < widget.maxVisible) {
      final nextNotification = _queue.removeAt(0);
      _addNotification(nextNotification);
    }
  }

  Map<BeNotifyPosition, List<int>> _getPositionGroups() {
    if (_needsPositionGroupUpdate || _cachedPositionGroups == null) {
      final groups = <BeNotifyPosition, List<int>>{};

      for (int i = 0; i < _notifications.length; i++) {
        final notification = _notifications[i];
        BeNotifyPosition position = widget.position;

        if (notification is KeyedSubtree && notification.child is _NotificationContainer) {
          final container = notification.child as _NotificationContainer;
          position = container.position;
        }

        groups.putIfAbsent(position, () => []).add(i);
      }

      _cachedPositionGroups = groups;
      _needsPositionGroupUpdate = false;
    }

    return _cachedPositionGroups!;
  }

  @override
  Widget build(final BuildContext context) {
    final notificationConstraints = widget.constraints ?? const BoxConstraints(maxWidth: 350);
    final notificationsByPosition = _getPositionGroups();

    return _BeNotificationData(
      this,
      child: Stack(
        children: [
          widget.child,
          // Iterate over all position groups and build a column of notifications for each
          ...notificationsByPosition.entries.map((final entry) {
            final position = entry.key;
            final indices = entry.value;

            // Build the column containing the notifications for this position
            Widget notificationColumn() {
              final items = position.reverse ? indices.reversed : indices;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: items.map((final index) => _buildNotificationItem(index, position)).toList(),
              );
            }

            // Central positions are handled differently
            if (position._isCenterPosition) {
              final child = notificationColumn();

              if (position == BeNotifyPosition.center) {
                return Center(
                  child: Material(color: Colors.transparent, child: child),
                );
              }

              // TopCenter or BottomCenter
              final topOrBottom = (position == BeNotifyPosition.topCenter);
              return Positioned(
                top: topOrBottom ? 16 : null,
                bottom: topOrBottom ? null : 16,
                left: 0,
                right: 0,
                child: Center(
                  child: ConstrainedBox(
                    constraints: notificationConstraints,
                    child: Material(color: Colors.transparent, child: child),
                  ),
                ),
              );
            }

            // Side positions
            final Widget positionedChild = ConstrainedBox(
              constraints: notificationConstraints,
              child: Material(color: Colors.transparent, child: notificationColumn()),
            );

            // Handle vertical centering for leftCenter and rightCenter
            if (position == BeNotifyPosition.leftCenter || position == BeNotifyPosition.rightCenter) {
              return Positioned(
                left: position.left(),
                right: position.right(),
                top: 0,
                bottom: 0,
                child: Align(
                  alignment: position == BeNotifyPosition.leftCenter ? Alignment.centerLeft : Alignment.centerRight,
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: positionedChild),
                ),
              );
            }

            return Positioned(
              left: position.left(),
              top: position.top(),
              right: position.right(),
              bottom: position.bottom(),
              child: Material(color: Colors.transparent, child: positionedChild),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(final int index, final BeNotifyPosition position) {
    final notification = _notifications[index];
    final notificationKey = notification.key;

    if (notificationKey != null && _animationControllers.containsKey(notificationKey)) {
      final controller = _animationControllers[notificationKey]!;

      return AnimatedBuilder(
        animation: controller,
        builder: (final context, final child) {
          return _AnimatedNotification(
            animation: controller,
            notification: notification,
            slideTween: position.slideTween,
          );
        },
      );
    }
    return const SizedBox.shrink(); // Should not happen
  }

  // --- Implement BeNotificationManager methods ---

  @override
  void dismissByKey(final Key key) {
    try {
      final notification = _notifications.firstWhere((final n) => n.key == key);
      _removeNotification(notification);
    } catch (_) {
      // Notification not found
    }
  }

  @override
  void dismiss() {
    if (_notifications.isEmpty) return;
    _removeNotification(_notifications.first);
  }

  @override
  void dismissAll() {
    if (_notifications.isEmpty) return;

    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();

    for (final controller in _animationControllers.values) {
      controller.dispose();
    }
    _animationControllers.clear();

    _notifications.clear();
    _needsPositionGroupUpdate = true;
    _queue.clear();

    setState(() {});
  }

  @override
  void dismissAllOfType(final Type type) {
    if (_notifications.isEmpty) return;

    _notifications
        .where((final notification) {
          if (notification is KeyedSubtree && notification.child is _NotificationContainer) {
            final container = notification.child as _NotificationContainer;
            return container.notification.runtimeType == type;
          }
          return false;
        })
        .toList()
        .forEach(_removeNotification);
  }

  @override
  void dispose() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    for (final controller in _animationControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}

/// Simple widget to hold the notification and its position data.
class _NotificationContainer extends StatelessWidget {
  const _NotificationContainer({required this.notification, required this.position});

  final Widget notification;
  final BeNotifyPosition position;

  @override
  Widget build(final BuildContext context) => notification;
}

// -----------------------------------------------------------------------------
// Animation Widgets
// -----------------------------------------------------------------------------

/// Handles the slide and fade animations for the notification.
class _AnimatedNotification extends StatelessWidget {
  const _AnimatedNotification({required this.animation, required this.notification, required this.slideTween});

  final Animation<double> animation;
  final Widget notification;
  final Tween<Offset> slideTween;

  @override
  Widget build(final BuildContext context) {
    // This is the default wrapper box style, replacing the external 'BeBoxDecoration'
    final wrappedNotification = Container(
      margin: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), offset: const Offset(0, 4), blurRadius: 10)],
      ),
      child: notification is KeyedSubtree ? (notification as KeyedSubtree).child : notification,
    );

    return IgnorePointer(
      ignoring: false,
      child: SlideTransition(
        position: CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic).drive(slideTween),
        child: FadeTransition(
          opacity: animation,
          child: _NoClipSizeTransition(
            sizeFactor: CurvedAnimation(parent: animation, curve: Curves.easeOutQuart),
            child: wrappedNotification,
          ),
        ),
      ),
    );
  }
}

/// A size transition that avoids clipping by using Align.
class _NoClipSizeTransition extends AnimatedWidget {
  const _NoClipSizeTransition({required final Animation<double> sizeFactor, this.child})
    : super(listenable: sizeFactor);

  final Widget? child;

  Animation<double> get sizeFactor => listenable as Animation<double>;

  @override
  Widget build(final BuildContext context) =>
      Align(alignment: AlignmentDirectional.centerStart, heightFactor: math.max(sizeFactor.value, 0.0), child: child);
}

// -----------------------------------------------------------------------------
// Demo App
// -----------------------------------------------------------------------------

void main() {
  runApp(const NotificationDemoApp());
}

class NotificationDemoApp extends StatelessWidget {
  const NotificationDemoApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Animated Notification Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      // Wrap the entire application with the provider
      home: const BeNotificationsProvider(
        position: BeNotifyPosition.topRight,
        maxVisible: 50,
        child: NotificationHomePage(),
      ),
    );
  }
}

class NotificationHomePage extends StatefulWidget {
  const NotificationHomePage({super.key});

  @override
  State<NotificationHomePage> createState() => _NotificationHomePageState();
}

class _NotificationHomePageState extends State<NotificationHomePage> {
  int _notificationCount = 0;

  void _showNotification(final BeNotifyPosition position) {
    _notificationCount++;
    final key = ValueKey('notif$_notificationCount');

    final notificationWidget = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('New Message Received', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  'Notification #$_notificationCount at $position. Auto-dismissing...',
                  style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 20),
            onPressed: () => BeNotificationManager.of(context).dismissByKey(key),
          ),
        ],
      ),
    );

    BeNotificationManager.of(
      context,
    ).show(notificationWidget, key: key, position: position, dismissDuration: const Duration(seconds: 4));
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Notification Manager'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Show notifications at different positions. Only 3 visible at a time.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: BeNotifyPosition.values.map((final pos) {
                  return ElevatedButton(onPressed: () => _showNotification(pos), child: Text(pos.name.toUpperCase()));
                }).toList(),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => BeNotificationManager.of(context).dismissAll(),
                icon: const Icon(Icons.clear_all),
                label: const Text('Dismiss All Notifications'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400, foregroundColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:math' as math;

import 'package:beui/decoration.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeNotificationsProvider extends StatefulWidget {
  const BeNotificationsProvider({
    super.key,
    required this.child,
    this.maxVisible = 5,
    this.position = BeNotifyPosition.topRight,
    this.animationDuration = const Duration(milliseconds: 500),
    this.leavingAnimationDuration = const Duration(milliseconds: 300),
    this.autoDismissDuration = const Duration(seconds: 5),
    this.constraints,
  });

  final Widget child;
  final BeNotifyPosition position;
  final int maxVisible;
  final Duration animationDuration;
  final Duration leavingAnimationDuration;
  final Duration autoDismissDuration;
  final BoxConstraints? constraints;
  @override
  State<StatefulWidget> createState() => _BeNotificationsProviderState();
}

class _BeNotificationsProviderState extends State<BeNotificationsProvider> implements BeNotificationManager {
  final List<Widget> _notifications = [];
  final List<Widget> _queue = [];
  final Map<Key, Timer> _timers = {};

  @override
  void show(
    final Widget notification, {
    final Key? key,
    final Duration? dissmissDuration,
    final BeNotifyPosition? position,
    final bool wrapInContainer = true,
  }) {
    final notificationKey = key ?? UniqueKey();
    final duration = dissmissDuration ?? widget.autoDismissDuration;

    final wrappedNotification = KeyedSubtree(
      key: notificationKey,
      child: _NotificationContainer(
        notification: notification,
        position: position ?? widget.position,
        wrapInContainer: wrapInContainer,
      ),
    );
    final notificationKeys = _notifications.map((final w) => w.key);
    if (notificationKeys.contains(notificationKey)) {
      // If the notification is already in the list, remove it first
      final existingNotification = _notifications.firstWhere((final n) => n.key == notificationKey);
      _removeNotification(existingNotification);
      debugPrint(
        'Notification with key $notificationKey already exists. '
        'Removing it first.',
      );
    }

    if (_notifications.length < widget.maxVisible) {
      _addNotification(wrappedNotification, index: 0, key: key, dissmissDuration: duration);
    } else {
      _queue.add(wrappedNotification);
    }
  }

  @override
  void dismissByKey(final Key key) {
    try {
      final notification = _notifications.firstWhere((final n) => (n as KeyedSubtree).key == key);
      _removeNotification(notification);
    } on StateError {
      // Notification not found - using StateError instead of generic catch
      debugPrint('Notification with key $key not found');
    }
  }

  @override
  void dismiss() {
    if (_notifications.isEmpty) return;
    // Remove the last (most recent) notification
    final lastNotification = _notifications.first; // First item is the most recent due to insertion at index 0
    _removeNotification(lastNotification);
  }

  @override
  void dismissAllOfType(final Type type) {
    if (_notifications.isEmpty) return;
    _notifications
        .where((final notification) {
          if (notification is KeyedSubtree) {
            final child = notification.child;
            if (child is _NotificationContainer) {
              // Check the actual notification widget inside the container
              return child.notification.runtimeType == type;
            }
            return child.runtimeType == type;
          }
          return false;
        })
        .toList()
        .forEach(_removeNotification);
  }

  void _addNotification(
    final Widget notification, {
    final int index = 0,
    final Key? key,
    final Duration? dissmissDuration,
  }) {
    _notifications.insert(index, notification);
    // Trigger a rebuild to show the new notification
    setState(() {});

    // Schedule auto-dismiss timer
    final notificationKey = notification.key!;
    final timer = Timer(dissmissDuration ?? widget.autoDismissDuration, () {
      if (_notifications.any((final n) => n.key == notificationKey)) {
        _removeNotification(notification);
      }
    });
    _timers[notificationKey] = timer;
  }

  void _removeNotification(final Widget notification) {
    final index = _notifications.indexOf(notification);
    if (index != -1) {
      _notifications.removeAt(index);

      // Cancel and remove the timer
      final notificationKey = notification.key;
      if (notificationKey != null) {
        _timers[notificationKey]?.cancel();
        _timers.remove(notificationKey);
      }

      // Trigger a rebuild to remove the notification
      setState(() {});
      _handleNotificationDismiss();
    }
  }

  void _handleNotificationDismiss() {
    if (_queue.isNotEmpty && _notifications.length < widget.maxVisible) {
      final nextNotification = _queue.removeAt(0);
      _addNotification(nextNotification);
    }
  }

  @override
  void dispose() {
    // Cancel all timers to prevent memory leaks
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final isCompact = betheme.breakpoint == BeBreakpoint.xs || betheme.breakpoint == BeBreakpoint.sm;
    final notificationConstraints = widget.constraints ?? const BoxConstraints(maxWidth: 400);

    // Group notifications by their position
    final Map<BeNotifyPosition, List<int>> notificationsByPosition = {};

    for (int i = 0; i < _notifications.length; i++) {
      final notification = _notifications[i];
      BeNotifyPosition position = widget.position;

      if (notification is KeyedSubtree && notification.child is _NotificationContainer) {
        final container = notification.child as _NotificationContainer;
        position = container.position;
      }

      notificationsByPosition.putIfAbsent(position, () => []).add(i);
    }

    return _BeNotificationData(
      this,
      child: Stack(
        children: [
          widget.child,
          // Create positioned containers for each position that has notifications
          ...notificationsByPosition.entries.map((final entry) {
            final position = entry.key;
            final indices = entry.value;

            return Positioned(
              left: position.left(isCompact),
              top: position.top(isCompact),
              right: position.right(isCompact),
              bottom: position.bottom(isCompact),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  constraints: notificationConstraints,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                        position.reverse
                            ? indices.reversed.map((final index) => _buildNotificationItem(index, position)).toList()
                            : indices.map((final index) => _buildNotificationItem(index, position)).toList(),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(final int index, final BeNotifyPosition position) {
    final notification = _notifications[index];

    return TweenAnimationBuilder<double>(
      duration: widget.animationDuration,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (final context, final value, final child) {
        return _AnimatedNotification(
          animation: AlwaysStoppedAnimation(value),
          notification: notification,
          slideTween: position.slideTween,
        );
      },
    );
  }

  @override
  void dismissAll() {
    if (_notifications.isEmpty) return;

    // Cancel all timers and clear the map
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();

    // Create a copy of the notifications list to avoid modification during iteration
    List<Widget>.from(_notifications).forEach(_removeNotification);
    _queue.clear();
  }
}

class _NotificationContainer extends StatelessWidget {
  const _NotificationContainer({required this.notification, required this.position, this.wrapInContainer = true});

  final Widget notification;
  final BeNotifyPosition position;
  final bool wrapInContainer;

  @override
  Widget build(final BuildContext context) {
    return notification;
  }
}

abstract class BeNotificationManager {
  static BeNotificationManager of(final BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_BeNotificationData>()!.manager;

  void show(
    final Widget notification, {
    final Key? key,
    final Duration? dissmissDuration,
    final BeNotifyPosition? position,
    final bool wrapInContainer = true,
  });
  void dismissByKey(final Key key);
  void dismiss();
  void dismissAll();
  void dismissAllOfType(final Type type);
}

class _BeNotificationData extends InheritedWidget {
  const _BeNotificationData(this.manager, {required super.child});

  final BeNotificationManager manager;

  @override
  bool updateShouldNotify(final _BeNotificationData oldWidget) => false;
}

class _AnimatedNotification extends StatelessWidget {
  const _AnimatedNotification({required this.animation, required this.notification, required this.slideTween});

  final Animation<double> animation;
  final Widget notification;
  final Tween<Offset> slideTween;

  @override
  Widget build(final BuildContext context) {
    final theme = betheme(context);
    final isCompact = theme.breakpoint == BeBreakpoint.xs || theme.breakpoint == BeBreakpoint.sm;

    // Extract styling info from NotificationContainer if available
    bool wrapInContainer = true;
    Widget actualNotification = notification;

    if (notification is KeyedSubtree) {
      final keyedSubtree = notification as KeyedSubtree;
      if (keyedSubtree.child is _NotificationContainer) {
        final container = keyedSubtree.child as _NotificationContainer;
        wrapInContainer = container.wrapInContainer;
        actualNotification = container.notification;
      } else {
        actualNotification = keyedSubtree.child;
      }
    }

    Widget child = actualNotification;

    // Wrap in default container if requested
    if (wrapInContainer) {
      child = Container(
        margin: pb8,
        padding: p8,
        decoration: BeBoxDecoration(
          color: theme.colors.background,
          borderRadius: isCompact ? null : const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            const BeBoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(-5, 5),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: actualNotification,
      );
    }

    return IgnorePointer(
      ignoring: false,
      child: SlideTransition(
        position: CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic).drive(slideTween),
        child: FadeTransition(
          opacity: animation,
          child: _NoClipSizeTransition(
            sizeFactor: CurvedAnimation(parent: animation, curve: Curves.easeOutQuart),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _NoClipSizeTransition extends AnimatedWidget {
  const _NoClipSizeTransition({required final Animation<double> sizeFactor, this.child})
    : super(listenable: sizeFactor);

  final Widget? child;

  Animation<double> get sizeFactor => listenable as Animation<double>;

  @override
  Widget build(final BuildContext context) =>
      Align(alignment: AlignmentDirectional.centerStart, heightFactor: math.max(sizeFactor.value, 0.0), child: child);
}

enum BeNotifyPosition {
  topLeft,
  topCenter,
  topRight,
  rightTop,
  rightCenter,
  rightBottom,
  bottomRight,
  bottomCenter,
  bottomLeft,
  leftBottom,
  leftCenter,
  leftTop,
  center,
}

extension on BeNotifyPosition {
  double? left(final bool isCompact) {
    switch (this) {
      case BeNotifyPosition.topLeft:
      case BeNotifyPosition.bottomLeft:
      case BeNotifyPosition.leftTop:
      case BeNotifyPosition.leftCenter:
      case BeNotifyPosition.leftBottom:
        return isCompact ? 0 : 8;
      case BeNotifyPosition.topCenter:
      case BeNotifyPosition.bottomCenter:
      case BeNotifyPosition.center:
        return null; // Will be centered horizontally
      case BeNotifyPosition.topRight:
      case BeNotifyPosition.bottomRight:
      case BeNotifyPosition.rightTop:
      case BeNotifyPosition.rightCenter:
      case BeNotifyPosition.rightBottom:
        return null; // Will be positioned from the right
    }
  }

  double? top(final bool isCompact) {
    switch (this) {
      case BeNotifyPosition.topLeft:
      case BeNotifyPosition.topCenter:
      case BeNotifyPosition.topRight:
      case BeNotifyPosition.rightTop:
      case BeNotifyPosition.leftTop:
        return isCompact ? 0 : 8;
      case BeNotifyPosition.rightCenter:
      case BeNotifyPosition.leftCenter:
      case BeNotifyPosition.center:
        return null; // Will be centered vertically
      case BeNotifyPosition.bottomLeft:
      case BeNotifyPosition.bottomCenter:
      case BeNotifyPosition.bottomRight:
      case BeNotifyPosition.rightBottom:
      case BeNotifyPosition.leftBottom:
        return null; // Will be positioned from the bottom
    }
  }

  double? right(final bool isCompact) {
    switch (this) {
      case BeNotifyPosition.topRight:
      case BeNotifyPosition.bottomRight:
      case BeNotifyPosition.rightTop:
      case BeNotifyPosition.rightCenter:
      case BeNotifyPosition.rightBottom:
        return isCompact ? 0 : 8;
      case BeNotifyPosition.topCenter:
      case BeNotifyPosition.bottomCenter:
      case BeNotifyPosition.center:
        return null; // Will be centered horizontally
      case BeNotifyPosition.topLeft:
      case BeNotifyPosition.bottomLeft:
      case BeNotifyPosition.leftTop:
      case BeNotifyPosition.leftCenter:
      case BeNotifyPosition.leftBottom:
        return null; // Will be positioned from the left
    }
  }

  double? bottom(final bool isCompact) {
    switch (this) {
      case BeNotifyPosition.topLeft:
      case BeNotifyPosition.topCenter:
      case BeNotifyPosition.topRight:
      case BeNotifyPosition.rightTop:
      case BeNotifyPosition.leftTop:
        return null; // Will be positioned from the top
      case BeNotifyPosition.rightCenter:
      case BeNotifyPosition.leftCenter:
      case BeNotifyPosition.center:
        return null; // Will be centered vertically
      case BeNotifyPosition.bottomLeft:
      case BeNotifyPosition.bottomCenter:
      case BeNotifyPosition.bottomRight:
      case BeNotifyPosition.rightBottom:
      case BeNotifyPosition.leftBottom:
        return isCompact ? 0 : 8;
    }
  }

  Tween<Offset> get slideTween {
    switch (this) {
      case BeNotifyPosition.topLeft:
      case BeNotifyPosition.leftTop:
      case BeNotifyPosition.leftCenter:
      case BeNotifyPosition.leftBottom:
        return Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero);
      case BeNotifyPosition.topRight:
      case BeNotifyPosition.rightTop:
      case BeNotifyPosition.rightCenter:
      case BeNotifyPosition.rightBottom:
        return Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);
      case BeNotifyPosition.topCenter:
        return Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero);
      case BeNotifyPosition.bottomCenter:
        return Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
      case BeNotifyPosition.bottomLeft:
      case BeNotifyPosition.bottomRight:
        return Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
      case BeNotifyPosition.center:
        return Tween<Offset>(begin: const Offset(0.0, 0.0), end: Offset.zero); // Fade in from center
    }
  }

  bool get reverse {
    switch (this) {
      case BeNotifyPosition.topLeft:
      case BeNotifyPosition.topCenter:
      case BeNotifyPosition.topRight:
      case BeNotifyPosition.rightTop:
      case BeNotifyPosition.rightCenter:
      case BeNotifyPosition.leftTop:
      case BeNotifyPosition.leftCenter:
      case BeNotifyPosition.center:
        return false;
      case BeNotifyPosition.bottomLeft:
      case BeNotifyPosition.bottomCenter:
      case BeNotifyPosition.bottomRight:
      case BeNotifyPosition.rightBottom:
      case BeNotifyPosition.leftBottom:
        return true;
    }
  }
}

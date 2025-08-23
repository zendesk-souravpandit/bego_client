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
  State<BeNotificationsProvider> createState() => _BeNotificationsProviderState();
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

    if (_notifications.any((final w) => w.key == notificationKey)) {
      // Remove existing notification with the same key before adding new one
      final existingNotification = _notifications.firstWhere((final n) => n.key == notificationKey);
      _removeNotification(existingNotification);
      debugPrint('Notification with key $notificationKey already exists. Removing it first.');
    }

    if (_notifications.length < widget.maxVisible) {
      _addNotification(wrappedNotification, index: 0, dissmissDuration: duration);
    } else {
      _queue.add(wrappedNotification);
    }
  }

  @override
  void dismissByKey(final Key key) {
    try {
      final notification = _notifications.firstWhere((final n) => n.key == key);
      _removeNotification(notification);
    } on StateError {
      debugPrint('Notification with key $key not found');
    }
  }

  @override
  void dismiss() {
    if (_notifications.isEmpty) return;

    // Remove the most recent notification (at index 0)
    _removeNotification(_notifications.first);
  }

  @override
  void dismissAllOfType(final Type type) {
    if (_notifications.isEmpty) return;

    final notificationsToRemove =
        _notifications.where((final notification) {
          if (notification is KeyedSubtree) {
            final child = notification.child;
            if (child is _NotificationContainer) {
              return child.notification.runtimeType == type;
            }
            return child.runtimeType == type;
          }
          return false;
        }).toList();

    for (final n in notificationsToRemove) {
      _removeNotification(n);
    }
  }

  void _addNotification(final Widget notification, {final int index = 0, final Duration? dissmissDuration}) {
    _notifications.insert(index, notification);
    setState(() {});

    final notificationKey = notification.key!;
    _timers[notificationKey] = Timer(dissmissDuration ?? widget.autoDismissDuration, () {
      if (_notifications.any((final n) => n.key == notificationKey)) {
        _removeNotification(notification);
      }
    });
  }

  void _removeNotification(final Widget notification) {
    final index = _notifications.indexOf(notification);
    if (index == -1) return;

    _notifications.removeAt(index);

    final notificationKey = notification.key;
    if (notificationKey != null) {
      _timers[notificationKey]?.cancel();
      _timers.remove(notificationKey);
    }

    setState(() {});
    _handleNotificationDismiss();
  }

  void _handleNotificationDismiss() {
    if (_queue.isNotEmpty && _notifications.length < widget.maxVisible) {
      final nextNotification = _queue.removeAt(0);
      _addNotification(nextNotification);
    }
  }

  @override
  void dispose() {
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
    for (var i = 0; i < _notifications.length; i++) {
      final notification = _notifications[i];
      var position = widget.position;
      if (notification is KeyedSubtree && notification.child is _NotificationContainer) {
        position = (notification.child as _NotificationContainer).position;
      }
      notificationsByPosition.putIfAbsent(position, () => []).add(i);
    }

    return _BeNotificationData(
      this,
      child: Stack(
        children: [
          widget.child,
          ...notificationsByPosition.entries.map((final entry) {
            final position = entry.key;
            final indices = entry.value;

            Widget buildColumn() {
              final items = position.reverse ? indices.reversed : indices;
              return Container(
                constraints: notificationConstraints,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: items.map((final index) => _buildNotificationItem(index, position)).toList(),
                ),
              );
            }

            // Center positions need special handling
            if (position._isCenterPosition) {
              final child = buildColumn();

              if (position == BeNotifyPosition.center) {
                return Center(child: Material(color: Colors.transparent, child: child));
              }

              final topOrBottom = (position == BeNotifyPosition.topCenter) ? true : false;
              return Positioned(
                top: topOrBottom ? (isCompact ? 0 : 8) : null,
                bottom: topOrBottom ? null : (isCompact ? 0 : 8),
                left: 0,
                right: 0,
                child: Material(color: Colors.transparent, child: Center(child: child)),
              );
            }

            // Side center positions (leftCenter, rightCenter)
            if (position == BeNotifyPosition.leftCenter || position == BeNotifyPosition.rightCenter) {
              final child = Container(
                constraints: notificationConstraints,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: indices.map((final index) => _buildNotificationItem(index, position)).toList(),
                ),
              );

              return Positioned(
                left: position == BeNotifyPosition.leftCenter ? (isCompact ? 0 : 8) : null,
                right: position == BeNotifyPosition.rightCenter ? (isCompact ? 0 : 8) : null,
                top: 0,
                bottom: 0,
                child: Material(color: Colors.transparent, child: Center(child: child)),
              );
            }

            // Default positioning for other positions
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

    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();

    // Copy list to safely remove during iteration
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
  Widget build(final BuildContext context) => notification;
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
  bool updateShouldNotify(covariant final _BeNotificationData oldWidget) => false;
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

    if (wrapInContainer) {
      child = Container(
        margin: pb8,
        padding: p8,
        decoration: BeBoxDecoration(
          color: theme.colors.background,
          borderRadius: isCompact ? null : const BorderRadius.all(Radius.circular(8)),
          boxShadow: const [
            BeBoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), offset: Offset(-5, 5), blurRadius: 10, spreadRadius: 1),
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
  bool get _isCenterPosition {
    switch (this) {
      case BeNotifyPosition.center:
      case BeNotifyPosition.topCenter:
      case BeNotifyPosition.bottomCenter:
        return true;
      default:
        return false;
    }
  }

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
        return null;
      default:
        return null;
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
        return null;
      default:
        return null;
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
        return null;
      default:
        return null;
    }
  }

  double? bottom(final bool isCompact) {
    switch (this) {
      case BeNotifyPosition.bottomLeft:
      case BeNotifyPosition.bottomCenter:
      case BeNotifyPosition.bottomRight:
      case BeNotifyPosition.rightBottom:
      case BeNotifyPosition.leftBottom:
        return isCompact ? 0 : 8;
      default:
        return null;
    }
  }

  Tween<Offset> get slideTween {
    switch (this) {
      case BeNotifyPosition.topLeft:
      case BeNotifyPosition.leftTop:
      case BeNotifyPosition.leftCenter:
      case BeNotifyPosition.leftBottom:
        return Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero);
      case BeNotifyPosition.topRight:
      case BeNotifyPosition.rightTop:
      case BeNotifyPosition.rightCenter:
      case BeNotifyPosition.rightBottom:
        return Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
      case BeNotifyPosition.topCenter:
        return Tween(begin: const Offset(0.0, -1.0), end: Offset.zero);
      case BeNotifyPosition.bottomCenter:
        return Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
      case BeNotifyPosition.bottomLeft:
      case BeNotifyPosition.bottomRight:
        return Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
      case BeNotifyPosition.center:
        return Tween(begin: const Offset(0.0, 0.0), end: Offset.zero);
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

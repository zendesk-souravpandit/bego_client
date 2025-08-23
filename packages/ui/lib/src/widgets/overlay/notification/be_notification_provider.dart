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
    this.position = BeNotificationPosition.topRight,
    this.animationDuration = const Duration(milliseconds: 500),
    this.leavingAnimationDuration = const Duration(milliseconds: 300),
    this.autoDismissDuration = const Duration(seconds: 5),
    this.constraints,
  });

  final Widget child;
  final BeNotificationPosition position;
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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final Map<Key, Timer> _timers = {};

  @override
  void show(final Widget notification, {final Key? key, final Duration? dissmissDuration}) {
    final notificationKey = key ?? UniqueKey();
    final duration = dissmissDuration ?? widget.autoDismissDuration;

    final wrappedNotification = KeyedSubtree(key: notificationKey, child: notification);
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

    // Cancel all timers and clear the map
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();

    _notifications.forEach(_removeNotification);
    _queue.clear();
  }

  @override
  void dismissAllOfType(final Type type) {
    if (_notifications.isEmpty) return;
    _notifications
        .where((final notification) {
          if (notification is KeyedSubtree) {
            final child = notification.child;
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
    _listKey.currentState?.insertItem(index, duration: widget.animationDuration);

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

      _listKey.currentState?.removeItem(
        index,
        (final context, final animation) => _buildRemovedNotification(animation, notification),
        duration: widget.leavingAnimationDuration,
      );
      _handleNotificationDismiss();
    }
  }

  void _handleNotificationDismiss() {
    if (_queue.isNotEmpty && _notifications.length < widget.maxVisible) {
      final nextNotification = _queue.removeAt(0);
      _addNotification(nextNotification);
    }
  }

  _AnimatedNotification _buildRemovedNotification(final Animation<double> animation, final Widget notification) {
    return _AnimatedNotification(
      animation: animation,
      notification: notification,
      isOutgoing: true, // Should be true for leaving notifications
      slideTween: widget.position.slideTween,
    );
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
    return _BeNotificationData(
      this,
      child: Stack(
        children: [
          widget.child,
          Positioned(
            left: widget.position.left(isCompact),
            top: widget.position.top(isCompact),
            right: widget.position.right(isCompact),
            bottom: widget.position.bottom(isCompact),
            child: Material(
              color: Colors.transparent,
              child: Container(
                constraints: notificationConstraints,
                child: AnimatedList(
                  key: _listKey,
                  shrinkWrap: true,
                  reverse: widget.position.reverse,
                  itemBuilder:
                      (final context, final index, final animation) => _AnimatedNotification(
                        animation: animation,
                        notification: _notifications[index],
                        slideTween: widget.position.slideTween,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

abstract class BeNotificationManager {
  static BeNotificationManager of(final BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_BeNotificationData>()!.manager;

  void show(final Widget notification, {final Key? key, final Duration? dissmissDuration});
  void dismissByKey(final Key key);
  void dismiss();
  void dismissAllOfType(final Type type);
}

class _BeNotificationData extends InheritedWidget {
  const _BeNotificationData(this.manager, {required super.child});

  final BeNotificationManager manager;

  @override
  bool updateShouldNotify(final _BeNotificationData oldWidget) => false;
}

class _AnimatedNotification extends StatelessWidget {
  const _AnimatedNotification({
    required this.animation,
    required this.notification,
    required this.slideTween,
    this.isOutgoing = false,
  });

  final Animation<double> animation;
  final Widget notification;
  final Tween<Offset> slideTween;
  final bool isOutgoing;

  @override
  Widget build(final BuildContext context) {
    final theme = betheme(context);

    final isCompact = theme.breakpoint == BeBreakpoint.xs || theme.breakpoint == BeBreakpoint.sm;
    return Container(
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
      child: IgnorePointer(
        ignoring: isOutgoing,
        child: FadeTransition(
          opacity: animation,
          child: _NoClipSizeTransition(
            sizeFactor: CurvedAnimation(parent: animation, curve: Curves.easeOutQuart),
            child: SlideTransition(
              position: CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic).drive(slideTween),
              child: notification,
            ),
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

enum BeNotificationPosition { topLeft, topRight, bottomRight, bottomLeft }

extension on BeNotificationPosition {
  double? left(final bool isCompact) {
    switch (this) {
      case BeNotificationPosition.bottomLeft:
      case BeNotificationPosition.topLeft:
        return isCompact ? 0 : 8;
      case BeNotificationPosition.topRight:
      case BeNotificationPosition.bottomRight:
        return isCompact ? 0 : null;
    }
  }

  double? top(final bool isCompact) {
    switch (this) {
      case BeNotificationPosition.topLeft:
      case BeNotificationPosition.topRight:
        return isCompact ? 0 : 8;
      case BeNotificationPosition.bottomRight:
      case BeNotificationPosition.bottomLeft:
        return null;
    }
  }

  double? right(final bool isCompact) {
    switch (this) {
      case BeNotificationPosition.bottomRight:
      case BeNotificationPosition.topRight:
        return isCompact ? 0 : 8;
      case BeNotificationPosition.topLeft:
      case BeNotificationPosition.bottomLeft:
        return isCompact ? 0 : null;
    }
  }

  double? bottom(final bool isCompact) {
    switch (this) {
      case BeNotificationPosition.topLeft:
      case BeNotificationPosition.topRight:
        return null;
      case BeNotificationPosition.bottomRight:
      case BeNotificationPosition.bottomLeft:
        return isCompact ? 0 : 8;
    }
  }

  Tween<Offset> get slideTween {
    switch (this) {
      case BeNotificationPosition.topLeft:
      case BeNotificationPosition.bottomLeft:
        return Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero);
      case BeNotificationPosition.topRight:
      case BeNotificationPosition.bottomRight:
        return Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);
    }
  }

  bool get reverse {
    switch (this) {
      case BeNotificationPosition.topLeft:
      case BeNotificationPosition.topRight:
        return false;
      case BeNotificationPosition.bottomLeft:
      case BeNotificationPosition.bottomRight:
        return true;
    }
  }
}

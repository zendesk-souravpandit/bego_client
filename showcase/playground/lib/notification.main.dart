// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// class BeNotificationsProvider extends StatefulWidget {
//   const BeNotificationsProvider({
//     super.key,
//     required this.child,
//     this.maxVisible = 3,
//     this.position = BeNotificationPosition.topRight,
//     this.animationDuration = const Duration(milliseconds: 500),
//     this.leavingAnimationDuration = const Duration(milliseconds: 300),
//     this.autoDismissDuration = const Duration(seconds: 3),
//   });

//   final Widget child;
//   final BeNotificationPosition position;
//   final int maxVisible;
//   final Duration animationDuration;
//   final Duration leavingAnimationDuration;
//   final Duration autoDismissDuration;

//   @override
//   State<StatefulWidget> createState() => _BeNotificationsProviderState();
// }

// class _BeNotificationsProviderState extends State<BeNotificationsProvider>
//     implements BeNotificationManager {
//   final List<Widget> _notifications = [];
//   final List<Widget> _queue = [];
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey();

//   @override
//   void show(Widget notification, {Key? key}) {
//     final notificationKey = key ?? UniqueKey();
//     final shouldAutoDismiss = key == null;

//     final wrappedNotification = KeyedSubtree(
//       key: notificationKey,
//       child: _NotificationWrapper(
//         key: notificationKey,
//         notification: notification,
//         manager: this,
//         autoDismiss: shouldAutoDismiss,
//         dismissDuration: widget.autoDismissDuration,
//       ),
//     );

//     if (_notifications.length < widget.maxVisible) {
//       _addNotification(wrappedNotification);
//     } else {
//       _queue.add(wrappedNotification);
//     }
//   }

//   @override
//   void dismissByKey(Key key) {
//     try {
//       final notification = _notifications.firstWhere(
//         (n) => (n as KeyedSubtree).key == key,
//       );
//       _removeNotification(notification);
//     } catch (e) {
//       // Notification not found
//     }
//   }

//   @override
//   void dismissAll() {
//     if (_notifications.isEmpty) return;

//     final notificationsToRemove = List<Widget>.from(_notifications);
//     for (final notification in notificationsToRemove) {
//       _removeNotification(notification);
//     }
//     _queue.clear();
//   }

//   @override
//   void dismissAllOfType(Type type) {
//     if (_notifications.isEmpty) return;

//     final notificationsToRemove =
//         List<Widget>.from(_notifications).where((notification) {
//           if (notification is KeyedSubtree) {
//             final child = notification.child;
//             return child is _NotificationWrapper &&
//                 child.notification.runtimeType == type;
//           }
//           return false;
//         }).toList();

//     for (final notification in notificationsToRemove) {
//       _removeNotification(notification);
//     }
//   }

//   void _addNotification(Widget notification, {int index = 0}) {
//     _notifications.insert(index, notification);
//     _listKey.currentState?.insertItem(
//       index,
//       duration: widget.animationDuration,
//     );
//   }

//   void _removeNotification(Widget notification) {
//     final index = _notifications.indexOf(notification);
//     if (index != -1) {
//       _notifications.removeAt(index);
//       _listKey.currentState?.removeItem(
//         index,
//         (context, animation) =>
//             _buildRemovedNotification(animation, notification),
//         duration: widget.leavingAnimationDuration,
//       );
//       _handleNotificationDismiss();
//     }
//   }

//   void _handleNotificationDismiss() {
//     if (_queue.isNotEmpty && _notifications.length < widget.maxVisible) {
//       _addNotification(_queue.removeAt(0));
//     }
//   }

//   _AnimatedNotification _buildRemovedNotification(
//     Animation<double> animation,
//     Widget notification,
//   ) {
//     return _AnimatedNotification(
//       animation: animation,
//       notification: notification,
//       isOutgoing: false,
//       slideTween: widget.position.slideTween,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _BeNotificationData(
//       this,
//       child: Stack(
//         children: [
//           widget.child,
//           Positioned(
//             left: widget.position.left(false),
//             top: widget.position.top(false),
//             right: widget.position.right(false),
//             bottom: widget.position.bottom(false),
//             child: Material(
//               child: SafeArea(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 400),
//                   child: AnimatedList(
//                     key: _listKey,
//                     shrinkWrap: true,
//                     reverse: widget.position.reverse,
//                     itemBuilder:
//                         (context, index, animation) => _AnimatedNotification(
//                           animation: animation,
//                           notification: _notifications[index],
//                           slideTween: widget.position.slideTween,
//                         ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _NotificationWrapper extends StatefulWidget {
//   const _NotificationWrapper({
//     super.key,
//     required this.notification,
//     required this.manager,
//     required this.autoDismiss,
//     required this.dismissDuration,
//   });

//   final Widget notification;
//   final BeNotificationManager manager;
//   final bool autoDismiss;
//   final Duration dismissDuration;

//   @override
//   State<_NotificationWrapper> createState() => _NotificationWrapperState();
// }

// class _NotificationWrapperState extends State<_NotificationWrapper> {
//   @override
//   void initState() {
//     super.initState();
//     if (widget.autoDismiss) {
//       Future.delayed(widget.dismissDuration, () {
//         if (mounted) {
//           widget.manager.dismissByKey(widget.key!);
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.notification;
//   }
// }

// abstract class BeNotificationManager {
//   static BeNotificationManager of(BuildContext context) =>
//       context
//           .dependOnInheritedWidgetOfExactType<_BeNotificationData>()!
//           .manager;

//   BeNotificationsProvider get widget;

//   void show(Widget notification, {Key? key});
//   void dismissByKey(Key key);
//   void dismissAll();
//   void dismissAllOfType(Type type);
// }

// class _BeNotificationData extends InheritedWidget {
//   const _BeNotificationData(this.manager, {required super.child});

//   final BeNotificationManager manager;

//   @override
//   bool updateShouldNotify(_BeNotificationData oldWidget) => false;
// }

// class _AnimatedNotification extends StatelessWidget {
//   const _AnimatedNotification({
//     required this.animation,
//     required this.notification,
//     required this.slideTween,
//     this.isOutgoing = false,
//   });

//   final Animation<double> animation;
//   final Widget notification;
//   final Tween<Offset> slideTween;
//   final bool isOutgoing;

//   @override
//   Widget build(BuildContext context) => IgnorePointer(
//     ignoring: isOutgoing,
//     child: FadeTransition(
//       opacity: animation,
//       child: _NoClipSizeTransition(
//         sizeFactor: CurvedAnimation(
//           parent: animation,
//           curve: Curves.easeOutQuart,
//         ),
//         child: SlideTransition(
//           position: CurvedAnimation(
//             parent: animation,
//             curve: Curves.easeInOutCubic,
//           ).drive(slideTween),
//           child: notification,
//         ),
//       ),
//     ),
//   );
// }

// class _NoClipSizeTransition extends AnimatedWidget {
//   const _NoClipSizeTransition({
//     required Animation<double> sizeFactor,
//     this.child,
//   }) : super(listenable: sizeFactor);

//   final Widget? child;

//   Animation<double> get sizeFactor => listenable as Animation<double>;

//   @override
//   Widget build(BuildContext context) => Align(
//     alignment: AlignmentDirectional.centerStart,
//     heightFactor: math.max(sizeFactor.value, 0.0),
//     child: child,
//   );
// }

// enum BeNotificationPosition { topLeft, topRight, bottomRight, bottomLeft }

// extension on BeNotificationPosition {
//   double? left(bool isCompact) {
//     switch (this) {
//       case BeNotificationPosition.bottomLeft:
//       case BeNotificationPosition.topLeft:
//         return isCompact ? 0 : 4;
//       case BeNotificationPosition.topRight:
//       case BeNotificationPosition.bottomRight:
//         return isCompact ? 0 : null;
//     }
//   }

//   double? top(bool isCompact) {
//     switch (this) {
//       case BeNotificationPosition.topLeft:
//       case BeNotificationPosition.topRight:
//         return isCompact ? 0 : 4;
//       case BeNotificationPosition.bottomRight:
//       case BeNotificationPosition.bottomLeft:
//         return null;
//     }
//   }

//   double? right(bool isCompact) {
//     switch (this) {
//       case BeNotificationPosition.bottomRight:
//       case BeNotificationPosition.topRight:
//         return isCompact ? 0 : 4;
//       case BeNotificationPosition.topLeft:
//       case BeNotificationPosition.bottomLeft:
//         return isCompact ? 0 : null;
//     }
//   }

//   double? bottom(bool isCompact) {
//     switch (this) {
//       case BeNotificationPosition.topLeft:
//       case BeNotificationPosition.topRight:
//         return null;
//       case BeNotificationPosition.bottomRight:
//       case BeNotificationPosition.bottomLeft:
//         return isCompact ? 0 : 4;
//     }
//   }

//   Tween<Offset> get slideTween {
//     switch (this) {
//       case BeNotificationPosition.topLeft:
//       case BeNotificationPosition.bottomLeft:
//         return Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero);
//       case BeNotificationPosition.topRight:
//       case BeNotificationPosition.bottomRight:
//         return Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);
//     }
//   }

//   bool get reverse {
//     switch (this) {
//       case BeNotificationPosition.topLeft:
//       case BeNotificationPosition.topRight:
//         return false;
//       case BeNotificationPosition.bottomLeft:
//       case BeNotificationPosition.bottomRight:
//         return true;
//     }
//   }
// }

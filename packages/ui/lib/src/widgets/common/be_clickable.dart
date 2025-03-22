// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/physics.dart';

// class BeInkWell extends StatefulWidget {
//   const BeInkWell({
//     required this.child,
//     super.key,
//     this.onPressed,
//     this.scaleFactor = 0.97,
//     this.duration = const Duration(milliseconds: 200),
//   });
//   final Widget child;
//   final VoidCallback? onPressed;
//   final double scaleFactor;
//   final Duration duration;

//   @override
//   State<BeInkWell> createState() => _BeInkWellState();

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed))
//       ..add(DoubleProperty('scaleFactor', scaleFactor))
//       ..add(DiagnosticsProperty<Duration>('duration', duration));
//   }
// }

// class _BeInkWellState extends State<BeInkWell> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;

//   final SpringSimulation _springSimulation = SpringSimulation(
//     const SpringDescription(mass: 1, stiffness: 400, damping: 15),
//     0.0, // starting point
//     1.0, // ending point
//     0.0, // velocity
//   );

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: widget.duration)..addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _onTapDown(TapDownDetails details) {
//     _controller.animateTo(widget.scaleFactor, duration: widget.duration, curve: Curves.easeOut);
//   }

//   void _onTapUp(TapUpDetails details) {
//     _controller.animateWith(_springSimulation);
//   }

//   void _onTapCancel() {
//     _controller.animateWith(_springSimulation);
//   }

//   @override
//   Widget build(BuildContext context) => GestureDetector(
//     onTap: widget.onPressed,
//     onTapDown: _onTapDown,
//     onTapUp: _onTapUp,
//     onTapCancel: _onTapCancel,
//     child: Transform.scale(scale: _controller.value, child: widget.child),
//   );
// }

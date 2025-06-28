import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

typedef BePageData = Map<String, dynamic>;

class BeMainPage<T> extends GetPage<T> {
  BeMainPage({
    required super.name,
    required super.page,
    super.title,
    super.gestureWidth,
    super.maintainState = true,
    super.curve = Curves.linear,
    super.alignment,
    super.parameters,
    super.opaque = true,
    super.transitionDuration,
    super.reverseTransitionDuration,
    super.popGesture,
    super.binding,
    super.bindings = const [],
    super.binds = const [],
    super.transition,
    super.customTransition,
    super.fullscreenDialog = false,
    super.children = const <GetPage<BePageData>>[],
    super.middlewares = const [],
    super.unknownRoute,
    super.arguments,
    super.showCupertinoParallax = true,
    super.preventDuplicates = true,
    super.preventDuplicateHandlingMode = PreventDuplicateHandlingMode.reorderRoutes,
    super.completer,
    super.inheritParentPath = true,
    super.canPop,
    super.onPopInvoked = _defaultPopInvokedHandler,
    super.restorationId,
  }) : super(participatesInRootNavigator: false);
}

void _defaultPopInvokedHandler(final bool didPop, final Object? result) {}

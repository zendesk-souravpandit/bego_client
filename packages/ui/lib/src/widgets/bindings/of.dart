// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Returns a [AutofillGroupState].
AutofillGroupState useAutofillGroupOf(BuildContext context) =>
    AutofillGroup.of(context);

/// Returns a [FormState].
FormState useFormOf(BuildContext context) => Form.of(context);

/// Returns a [HeroController].
HeroController useHeroControllerScopeOf(BuildContext context) =>
    HeroControllerScope.of(context);

/// Returns a [MaterialInkController].
MaterialInkController useMaterialOf(BuildContext context) =>
    Material.of(context);

/// Returns a [OverlayState].
OverlayState useOverlayOf(
  BuildContext context, {
  bool rootOverlay = false,
  Widget? debugRequiredFor,
}) => Overlay.of(
  context,
  rootOverlay: rootOverlay,
  debugRequiredFor: debugRequiredFor,
);

/// Returns a [PageStorageBucket].
PageStorageBucket usePageStorageOf(BuildContext context) =>
    PageStorage.of(context);

/// Returns a [ScrollController].
ScrollController usePrimaryScrollControllerOf(BuildContext context) =>
    PrimaryScrollController.of(context);

/// Returns a [RenderAbstractViewport].
RenderAbstractViewport useRenderAbstractViewportOf(RenderObject? object) =>
    RenderAbstractViewport.of(object);

/// Returns a [RestorationBucket].
RestorationBucket useRestorationScopeOf(BuildContext context) =>
    RestorationScope.of(context);

/// Returns a [ScrollableState].
ScrollableState useScrollableOf(BuildContext context) => Scrollable.of(context);

/// Returns a [ScrollNotificationObserverState].
ScrollNotificationObserverState useScrollNotificationObserverOf(
  BuildContext context,
) => ScrollNotificationObserver.of(context);

/// Returns a [TabController].
TabController useDefaultTabControllerOf(BuildContext context) =>
    DefaultTabController.of(context);

/// Returns a [TextHeightBehavior].
TextHeightBehavior useDefaultTextHeightBehaviorOf(BuildContext context) =>
    DefaultTextHeightBehavior.of(context);

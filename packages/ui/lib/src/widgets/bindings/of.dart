// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Returns a [AutofillGroupState].
AutofillGroupState useAutofillGroupOf(final BuildContext context) => AutofillGroup.of(context);

/// Returns a [FormState].
FormState useFormOf(final BuildContext context) => Form.of(context);

/// Returns a [HeroController].
HeroController useHeroControllerScopeOf(final BuildContext context) => HeroControllerScope.of(context);

/// Returns a [MaterialInkController].
MaterialInkController useMaterialOf(final BuildContext context) => Material.of(context);

/// Returns a [OverlayState].
OverlayState useOverlayOf(final BuildContext context, {final bool rootOverlay = false, final Widget? debugRequiredFor}) =>
    Overlay.of(context, rootOverlay: rootOverlay, debugRequiredFor: debugRequiredFor);

/// Returns a [PageStorageBucket].
PageStorageBucket usePageStorageOf(final BuildContext context) => PageStorage.of(context);

/// Returns a [ScrollController].
ScrollController usePrimaryScrollControllerOf(final BuildContext context) => PrimaryScrollController.of(context);

/// Returns a [RenderAbstractViewport].
RenderAbstractViewport useRenderAbstractViewportOf(final RenderObject? object) => RenderAbstractViewport.of(object);

/// Returns a [RestorationBucket].
RestorationBucket useRestorationScopeOf(final BuildContext context) => RestorationScope.of(context);

/// Returns a [ScrollableState].
ScrollableState useScrollableOf(final BuildContext context) => Scrollable.of(context);

/// Returns a [ScrollNotificationObserverState].
ScrollNotificationObserverState useScrollNotificationObserverOf(final BuildContext context) =>
    ScrollNotificationObserver.of(context);

/// Returns a [TabController].
TabController useDefaultTabControllerOf(final BuildContext context) => DefaultTabController.of(context);

/// Returns a [TextHeightBehavior].
TextHeightBehavior useDefaultTextHeightBehaviorOf(final BuildContext context) => DefaultTextHeightBehavior.of(context);

// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found
// in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Returns a [GestureBinding].
GestureBinding useGestureBinding() => GestureBinding.instance;

/// Returns a [PaintingBinding].
PaintingBinding usePaintingBinding() => PaintingBinding.instance;

/// Returns the [ImageCache] of a [PaintingBinding].
ImageCache usePaintingBindingImageCache() => PaintingBinding.instance.imageCache;

/// Returns a [RendererBinding].
RendererBinding useRendererBinding() => RendererBinding.instance;

/// Returns a [SchedulerBinding].
SchedulerBinding useSchedulerBinding() => SchedulerBinding.instance;

/// Returns a [SemanticsBinding].
SemanticsBinding useSemanticsBinding() => SemanticsBinding.instance;

/// Returns a [ServicesBinding].
ServicesBinding useServicesBinding() => ServicesBinding.instance;

/// Returns a [WidgetsBinding].
WidgetsBinding useWidgetsBinding() => WidgetsBinding.instance;

import 'dart:async';
import 'dart:developer' as developer;

import 'package:becore/getx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Performance monitoring utilities for the BeApp architecture
class AppPerformanceMonitor {
  factory AppPerformanceMonitor() => _instance;
  AppPerformanceMonitor._internal();
  static final AppPerformanceMonitor _instance = AppPerformanceMonitor._internal();

  final Map<String, int> _buildCounts = {};
  final Map<String, DateTime> _lastBuildTimes = {};
  final Map<String, List<Duration>> _buildDurations = {};

  /// Records a widget build with timing information
  void recordBuild(final String widgetName) {
    if (!kDebugMode) return;

    final now = DateTime.now();
    _buildCounts[widgetName] = (_buildCounts[widgetName] ?? 0) + 1;
    
    final lastBuild = _lastBuildTimes[widgetName];
    if (lastBuild != null) {
      final duration = now.difference(lastBuild);
      _buildDurations.putIfAbsent(widgetName, () => []).add(duration);
    }
    
    _lastBuildTimes[widgetName] = now;

    // Log excessive rebuilds
    if (_buildCounts[widgetName]! > 10 && _buildCounts[widgetName]! % 5 == 0) {
      developer.log(
        'Widget $widgetName has rebuilt ${_buildCounts[widgetName]} times',
        name: 'PerformanceMonitor',
        level: 900, // Warning level
      );
    }
  }

  /// Gets build statistics for a widget
  Map<String, dynamic> getStats(final String widgetName) {
    final durations = _buildDurations[widgetName] ?? [];
    final avgDuration = durations.isEmpty 
        ? Duration.zero 
        : Duration(
            microseconds: durations
                .map((final d) => d.inMicroseconds)
                .reduce((final a, final b) => a + b) ~/ durations.length
          );

    return {
      'buildCount': _buildCounts[widgetName] ?? 0,
      'averageBuildInterval': avgDuration,
      'lastBuildTime': _lastBuildTimes[widgetName],
    };
  }

  /// Gets overall performance report
  Map<String, Map<String, dynamic>> getPerformanceReport() {
    final report = <String, Map<String, dynamic>>{};
    for (final widget in _buildCounts.keys) {
      report[widget] = getStats(widget);
    }
    return report;
  }

  /// Clears all performance data
  void clear() {
    _buildCounts.clear();
    _lastBuildTimes.clear();
    _buildDurations.clear();
  }
}

/// Mixin for adding performance monitoring to widgets
mixin PerformanceMonitorMixin<T extends StatefulWidget> on State<T> {
  late final String _widgetName;

  @override
  void initState() {
    super.initState();
    _widgetName = widget.runtimeType.toString();
  }

  @override
  Widget build(final BuildContext context) {
    if (kDebugMode) {
      AppPerformanceMonitor().recordBuild(_widgetName);
    }
    return buildWithMonitoring(context);
  }

  /// Override this method instead of build() when using the mixin
  Widget buildWithMonitoring(final BuildContext context);
}

/// Widget wrapper for performance monitoring
class PerformanceWrapper extends StatefulWidget {
  const PerformanceWrapper({
    super.key,
    required this.child,
    required this.name,
    this.enabled = kDebugMode,
  });

  final Widget child;
  final String name;
  final bool enabled;

  @override
  State<PerformanceWrapper> createState() => _PerformanceWrapperState();
}

class _PerformanceWrapperState extends State<PerformanceWrapper> {
  @override
  Widget build(final BuildContext context) {
    if (widget.enabled) {
      AppPerformanceMonitor().recordBuild(widget.name);
    }
    return widget.child;
  }
}

/// Performance-optimized GetBuilder wrapper
class OptimizedGetBuilder<T extends GetxController> extends StatelessWidget {
  const OptimizedGetBuilder({
    super.key,
    required this.builder,
    this.id,
    this.tag,
    this.init,
    this.global = true,
    this.autoRemove = true,
    this.assignId = false,
    this.filter,
    this.debugLabel,
  });

  final Widget Function(T controller) builder;
  final Object? id;
  final String? tag;
  final T? init;
  final bool global;
  final bool autoRemove;
  final bool assignId;
  final bool Function(T controller)? filter;
  final String? debugLabel;

  @override
  Widget build(final BuildContext context) {
    return GetBuilder<T>(
      id: id,
      tag: tag,
      init: init,
      global: global,
      autoRemove: autoRemove,
      assignId: assignId,
      filter: filter,
      builder: (final controller) {
        if (kDebugMode && debugLabel != null) {
          AppPerformanceMonitor().recordBuild(debugLabel!);
        }
        return RepaintBoundary(
          child: builder(controller),
        );
      },
    );
  }
}

/// Debouncer utility for preventing excessive operations
class Debouncer {
  Debouncer({required this.delay});

  final Duration delay;
  Timer? _timer;

  void call(final VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void cancel() {
    _timer?.cancel();
  }

  void dispose() {
    _timer?.cancel();
  }
}

/// Memory-efficient scroll controller that auto-disposes
class SmartScrollController extends ScrollController {
  SmartScrollController({
    super.debugLabel,
    super.initialScrollOffset = 0.0,
    super.keepScrollOffset = true,
  });

  bool _disposed = false;

  @override
  void dispose() {
    if (!_disposed) {
      _disposed = true;
      super.dispose();
    }
  }

  /// Safe method to access controller properties
  bool get safeHasClients => !_disposed && hasClients;
  
  /// Safe scroll method
  void safeAnimateTo(
    final double offset, {
    required final Duration duration,
    required final Curve curve,
  }) {
    if (safeHasClients) {
      animateTo(offset, duration: duration, curve: curve);
    }
  }
}

/// Performance-optimized list view builder
class OptimizedListView extends StatelessWidget {
  const OptimizedListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.cacheExtent,
    this.semanticChildCount,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final ScrollController? controller;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double? cacheExtent;
  final int? semanticChildCount;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;

  @override
  Widget build(final BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      controller: controller,
      scrollDirection: scrollDirection,
      reverse: reverse,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      itemBuilder: (final context, final index) {
        // Wrap each item in RepaintBoundary for better performance
        return RepaintBoundary(
          child: itemBuilder(context, index),
        );
      },
    );
  }
}

/// App-wide performance configuration
class AppPerformanceConfig {
  static const Duration defaultDebounceDelay = Duration(milliseconds: 300);
  static const Duration fastDebounceDelay = Duration(milliseconds: 100);
  static const Duration slowDebounceDelay = Duration(milliseconds: 500);
  
  static const int maxBuildCountWarning = 50;
  static const int maxMemoryUsageMB = 100;
  
  /// Whether to enable performance monitoring
  static bool get isPerformanceMonitoringEnabled => kDebugMode;
  
  /// Whether to show performance overlays
  static bool get showPerformanceOverlay => kDebugMode && false; // Set to true when needed
}
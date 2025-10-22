import 'package:flutter/material.dart';

/// A utility class to help optimize performance in Widgetbook use cases
///
/// This class provides patterns and utilities to prevent excessive rebuilds
/// and maintain scroll positions when interacting with knobs.
class WidgetbookPerformanceHelper {
  /// Creates a ScrollView with PageStorage to maintain scroll position
  static Widget buildOptimizedScrollView({
    required final String storageKey,
    required final List<Widget> children,
    final ScrollController? controller,
    final EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      key: PageStorageKey(storageKey),
      controller: controller,
      padding: padding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }

  /// Wraps content with RepaintBoundary to prevent unnecessary repaints
  static Widget optimizeWithRepaintBoundary({required final Widget child, final String? debugLabel}) {
    return RepaintBoundary(child: child);
  }

  /// Creates a memoized widget with a value-based key to prevent rebuilds
  /// when the content hasn't actually changed
  static Widget buildMemoizedWidget({
    required final String baseKey,
    required final List<dynamic> dependencies,
    required final Widget child,
  }) {
    final combinedKey = '${baseKey}_${dependencies.map((final d) => d.hashCode).join('_')}';
    return KeyedSubtree(key: ValueKey(combinedKey), child: child);
  }
}

/// A base class for creating optimized Widgetbook demos
///
/// This class provides a structure for separating knob management from
/// widget building to reduce rebuilds.
abstract class OptimizedWidgetbookDemo extends StatefulWidget {
  const OptimizedWidgetbookDemo({super.key});
}

abstract class OptimizedWidgetbookDemoState<T extends OptimizedWidgetbookDemo> extends State<T> {
  final ScrollController _scrollController = ScrollController();

  /// Override this method to define your knobs
  /// This is called once per rebuild to get current values
  void updateKnobs(final BuildContext context) {}

  /// Override this method to build your demo content
  /// Use the knob values as state variables
  Widget buildDemoContent(final BuildContext context);

  /// Override this to provide a storage key for scroll position
  String get scrollStorageKey => 'optimized_demo_scroll';

  @override
  Widget build(final BuildContext context) {
    // Update knobs once
    updateKnobs(context);

    return WidgetbookPerformanceHelper.buildOptimizedScrollView(
      storageKey: scrollStorageKey,
      controller: _scrollController,
      padding: const EdgeInsets.all(16.0),
      children: [WidgetbookPerformanceHelper.optimizeWithRepaintBoundary(child: buildDemoContent(context))],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

/// Performance monitoring widget to help identify rebuild issues
class PerformanceMonitor extends StatefulWidget {
  const PerformanceMonitor({super.key, required this.child, this.debugLabel});

  final Widget child;
  final String? debugLabel;

  @override
  State<PerformanceMonitor> createState() => _PerformanceMonitorState();
}

class _PerformanceMonitorState extends State<PerformanceMonitor> {
  int _buildCount = 0;

  @override
  Widget build(final BuildContext context) {
    _buildCount++;

    if (widget.debugLabel != null) {
      debugPrint('${widget.debugLabel} build count: $_buildCount');
    }

    return widget.child;
  }
}

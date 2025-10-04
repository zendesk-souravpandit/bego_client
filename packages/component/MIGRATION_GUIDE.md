# BeApp Migration Guide

## Overview

This guide helps migrate from the current BeApp implementation to the optimized version with performance improvements.

## 🔄 Migration Steps

### Step 1: Update BeApp Widget Usage

#### Before:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BeApp(
      translations: MyTranslations(),
      routeDelegate: MyRouteDelegate(),
      responsivePoints: BeResponsivePoints(),
    );
  }
}
```

#### After (Enhanced):

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PerformanceWrapper(
      name: 'MyApp',
      child: BeApp(
        translations: MyTranslations(),
        routeDelegate: MyRouteDelegate(),
        responsivePoints: BeResponsivePoints(),
      ),
    );
  }
}
```

### Step 2: Update Controller Usage

#### Before:

```dart
class MyPageController extends BePageController {
  // Basic implementation
}
```

#### After (Enhanced):

```dart
class MyPageController extends BePageController with AppPerformanceMixin {
  final _debouncer = Debouncer(delay: AppPerformanceConfig.defaultDebounceDelay);

  void performExpensiveOperation() {
    _debouncer(() {
      // Your expensive operation here
    });
  }

  @override
  void onClose() {
    _debouncer.dispose();
    super.onClose();
  }
}
```

### Step 3: Optimize Widget Builds

#### Before:

```dart
Widget build(BuildContext context) {
  return Obx(() => Column(
    children: [
      // Multiple reactive widgets
    ],
  ));
}
```

#### After (Optimized):

```dart
Widget build(BuildContext context) {
  return RepaintBoundary(
    child: Obx(() => Column(
      children: [
        // Wrapped reactive widgets in RepaintBoundary
        RepaintBoundary(child: MyExpensiveWidget()),
      ],
    )),
  );
}
```

### Step 4: Use Performance Monitoring

#### Add Performance Monitoring:

```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with PerformanceMonitorMixin {
  @override
  Widget buildWithMonitoring(BuildContext context) {
    return Container(
      // Your widget implementation
    );
  }
}
```

### Step 5: Implement Smart ScrollControllers

#### Before:

```dart
class MyScrollableWidget extends StatefulWidget {
  @override
  State<MyScrollableWidget> createState() => _MyScrollableWidgetState();
}

class _MyScrollableWidgetState extends State<MyScrollableWidget> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

#### After (Enhanced):

```dart
class MyScrollableWidget extends StatefulWidget {
  @override
  State<MyScrollableWidget> createState() => _MyScrollableWidgetState();
}

class _MyScrollableWidgetState extends State<MyScrollableWidget> {
  late SmartScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SmartScrollController(debugLabel: 'MyScrollableWidget');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void scrollToTop() {
    _controller.safeAnimateTo(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
```

## 🚀 Performance Best Practices

### 1. Use RepaintBoundary Strategically

```dart
// Wrap expensive widgets that don't change often
RepaintBoundary(
  child: ExpensiveChart(data: stableData),
)

// Wrap interactive elements
RepaintBoundary(
  child: GestureDetector(
    onTap: () => handleTap(),
    child: AnimatedContainer(...),
  ),
)
```

### 2. Implement Debouncing for User Input

```dart
class SearchController extends GetxController {
  final _debouncer = Debouncer(delay: Duration(milliseconds: 300));

  void onSearchChanged(String query) {
    _debouncer(() {
      performSearch(query);
    });
  }
}
```

### 3. Use OptimizedGetBuilder for Better Performance

```dart
// Instead of GetBuilder
OptimizedGetBuilder<MyController>(
  debugLabel: 'MyWidget',
  builder: (controller) => Text(controller.data),
)
```

### 4. Monitor Performance in Development

```dart
// Check performance stats in development
void checkPerformance() {
  if (kDebugMode) {
    final stats = AppPerformanceMonitor().getPerformanceReport();
    print('Performance Report: $stats');
  }
}
```

## 🔧 Configuration Options

### Performance Configuration

```dart
// Adjust debounce delays based on use case
class MyConfig {
  static const searchDebounce = Duration(milliseconds: 300);
  static const resizeDebounce = Duration(milliseconds: 100);
  static const saveDebounce = Duration(milliseconds: 1000);
}
```

### Monitoring Configuration

```dart
// Enable/disable performance monitoring
class AppConfig {
  static bool get enablePerformanceMonitoring => kDebugMode;
  static bool get enableBuildCountWarnings => kDebugMode;
}
```

## 🐛 Common Issues and Solutions

### Issue 1: Widget Rebuilding Too Often

**Solution**: Use RepaintBoundary and check Obx usage

```dart
// Bad
Obx(() => Container(
  child: ExpensiveWidget(data: controller.data.value),
))

// Good
RepaintBoundary(
  child: Obx(() => ExpensiveWidget(data: controller.data.value)),
)
```

### Issue 2: Memory Leaks in Controllers

**Solution**: Properly dispose resources

```dart
@override
void onClose() {
  _debouncer.dispose();
  _scrollController.dispose();
  _animationController.dispose();
  super.onClose();
}
```

### Issue 3: Excessive Navigation Rebuilds

**Solution**: Use targeted updates

```dart
// Use specific update IDs
update(['navigation']);

// Instead of global updates
update();
```

## 📊 Performance Monitoring

### Enable Performance Monitoring

```dart
void main() {
  // Enable performance monitoring in debug mode
  if (kDebugMode) {
    AppPerformanceMonitor(); // Initialize singleton
  }

  runApp(MyApp());
}
```

### Check Performance Stats

```dart
void showPerformanceStats() {
  final monitor = AppPerformanceMonitor();
  final report = monitor.getPerformanceReport();

  for (final entry in report.entries) {
    print('${entry.key}: ${entry.value}');
  }
}
```

## 🧪 Testing Performance Improvements

### Performance Test Example

```dart
testWidgets('Widget should not rebuild unnecessarily', (tester) async {
  final monitor = AppPerformanceMonitor();
  monitor.clear();

  await tester.pumpWidget(MyApp());

  // Simulate user interactions
  await tester.tap(find.text('Button'));
  await tester.pump();

  final stats = monitor.getStats('MyWidget');
  expect(stats['buildCount'], lessThan(5));
});
```

## 📚 Additional Resources

- [Flutter Performance Best Practices](https://flutter.dev/docs/perf/best-practices)
- [GetX Performance Guide](https://github.com/jonataslaw/getx)
- [RepaintBoundary Documentation](https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html)

---

_Follow this migration guide gradually, testing performance improvements at each step._

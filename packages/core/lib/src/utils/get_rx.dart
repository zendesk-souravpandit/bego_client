import 'package:get/get.dart';

/// class MyController extends GetxController with DisposableMixin {
/// ```
///  @override
///   void onInit() {
///     super.onInit();
///     final subscription = someStream.listen((event) {
///       //...
///     });
///
///     addDisposeCallback(() => subscription.cancel());
///   }
/// }
/// ```
mixin DisposableMixin on GetxController {
  final List<void Function()> _onDisposeCallbacks = [];

  void addDisposeCallback(final void Function() callback) {
    _onDisposeCallbacks.add(callback);
  }

  @override
  void onClose() {
    for (final cb in _onDisposeCallbacks) {
      cb();
    }
    _onDisposeCallbacks.clear();
    super.onClose();
  }
}

/// Uses [RxValueMixin] to create a reactive value in a controller.
/// ```
/// class CounterController extends GetxController with RxValueMixin<int> {
///   CounterController() {
///     setReactiveValue(0);
///   }
///
///   void increment() => value++;
/// }
/// ```
mixin RxValueMixin<T> on GetxController {
  late final Rx<T> _stateRx;

  T get value => _stateRx.value;

  set value(final T v) => _stateRx.value = v;

  void setReactiveValue(final T initialValue) {
    _stateRx = Rx(initialValue);
  }
}

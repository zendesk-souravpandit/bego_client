import 'dart:async';

/// Dispatches events to listeners using the Dart [Stream] API. The [BeEventBus]
/// enables decoupled applications. It allows objects to interact without
/// requiring to explicitly define listeners and keeping track of them.
///
/// Not all events should be broadcasted through the [BeEventBus]
/// but only those of general interest.
///
/// Events are normal Dart objects. By specifying a class, listeners can
/// filter events.
///
/// github: https://github.com/marcojakob/dart-event-bus
class BeEventBus {
  /// Creates an [BeEventBus].
  ///
  /// If [sync] is true, events are passed directly to the stream's listeners
  /// during a [fire] call. If false (the default), the event will be passed to
  /// the listeners at a later time, after the code creating the event has
  /// completed.
  BeEventBus({final bool sync = false}) : _streamController = StreamController.broadcast(sync: sync);

  factory BeEventBus._() {
    _instance ??= BeEventBus();
    return _instance!;
  }

  /// Instead of using the default [StreamController]
  /// you can use this constructor to pass your own controller.
  ///
  /// An example would be to use an RxDart Subject as the controller.
  BeEventBus.customController(final StreamController<dynamic> controller) : _streamController = controller;

  static BeEventBus? _instance;

  // ignore: prefer_constructors_over_static_methods
  static BeEventBus get instance => BeEventBus._();

  StreamController<dynamic> _streamController;

  /// Controller for the event bus stream.
  StreamController<dynamic> get streamController => _streamController;

  /// Listens for events of Type [T] and its subtypes.
  ///
  /// The method is called like this: myAppEventBus.on<$dynamic$>();
  ///
  /// If the method is called without a type parameter, the [Stream]
  /// contains every event of this [BeEventBus].
  ///
  /// The returned [Stream] is a broadcast stream so multiple subscriptions are
  /// allowed.
  ///
  /// Each listener is handled independently,
  /// and if they pause, only the pausing listener is affected.
  ///  A paused listener will buffer events internally until
  /// resumed or cancelled. So it's usually better to just cancel and later
  /// subscribe again (avoids memory leak).
  ///
  Stream<T> on<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    }
    return streamController.stream.where((final dynamic e) => e is T).cast<T>();
  }

  /// Fires a new event on the event bus with the specified [event].
  void fire(final dynamic event) {
    streamController.add(event);
  }

  /// Destroy this [BeEventBus]. This is generally only in a testing context.
  void destroy() {
    _streamController.close();
  }
}

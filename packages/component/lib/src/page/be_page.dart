import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

/// `BePage` is an abstract class that extends `GetView` and provides a structure for building pages in a Flutter application using the GetX state management library.
/// Example:
/// ```
///
/// class HomePage extends BePage<HomeState, HomePageController> {
///   HomePage({super.key})
///     : super(
///         statusResolver: BePageStatusWidgetResolver<HomeState>(
///           successBuilder: (final context, final data) {
///             return Column(children: [Text(' ${data.toJson().toString()}')]);
///           },
///           emptyBuilder: (final context) => const Text('No Data found'),
///           customBuilder: (final context, final state) => Text(state?.toString() ?? 'hello'),
///         ),
///       );
/// }
/// ```
abstract class BePage<S, C extends BePageController<S>> extends GetView<C> {
  const BePage({super.key, required this.statusResolver});

  final BePageStatusWidgetResolver<C> statusResolver;

  @override
  Widget build(final BuildContext context) {
    return Obx(() => statusResolver.widgetForStatus<S>(context, controller));
  }
}

import 'package:becomponent/src/page/be_page_controller.dart' show BePageController;
import 'package:becore/getx.dart';
import 'package:beui/common.dart';
import 'package:flutter/material.dart';

// class BePageStatusWidgetResolver<S> {
//   const BePageStatusWidgetResolver({
//     required this.successBuilder,
//     this.errorBuilder,
//     this.loadingBuilder,
//     this.emptyBuilder,
//     this.customBuilder,
//   });
//   final WidgetBuilder? loadingBuilder;
//   final WidgetBuilder? emptyBuilder;
//   final Widget Function(BuildContext, Object?)? errorBuilder;
//   final Widget Function(BuildContext, S) successBuilder;
//   final Widget Function(BuildContext, S?)? customBuilder;

//   Widget widgetForStatus(final BuildContext context, final GetStatus<S> status) {
//     return switch (status) {
//       LoadingStatus<S>() => loadingBuilder?.call(context) ?? const Center(child: CircularProgressIndicator()),
//       ErrorStatus<S, Object>(data: final _, error: final error) =>
//         errorBuilder?.call(context, error) ?? Center(child: Text('Error: $error')),
//       EmptyStatus<S>() => emptyBuilder?.call(context) ?? emptyWidget,
//       SuccessStatus<S>(data: final data) => successBuilder(context, data),
//       _ => customBuilder?.call(context, status.data) ?? emptyWidget,
//     };
//   }
// }

class BePageStatusWidgetResolver<C> {
  const BePageStatusWidgetResolver({
    required this.successBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.customBuilder,
  });

  final Widget Function(BuildContext, C) successBuilder;
  final Widget Function(BuildContext, C)? errorBuilder;
  final Widget Function(BuildContext, C)? loadingBuilder;
  final Widget Function(BuildContext, C)? emptyBuilder;
  final Widget Function(BuildContext, C)? customBuilder;

  Widget widgetForStatus<S>(final BuildContext context, final C controller) {
    final ctr = controller as BePageController<S>;
    final status = ctr.status;
    return switch (status) {
      LoadingStatus<dynamic>() =>
        loadingBuilder?.call(context, controller) ?? const Center(child: CircularProgressIndicator()),
      ErrorStatus<dynamic, Object>(data: final _, error: final error) =>
        errorBuilder?.call(context, controller) ?? Center(child: Text('Error: $error')),
      EmptyStatus<dynamic>() => emptyBuilder?.call(context, controller) ?? emptyWidget,
      SuccessStatus<dynamic>() => successBuilder(context, controller),
      _ => customBuilder?.call(context, controller) ?? emptyWidget,
    };
  }
}

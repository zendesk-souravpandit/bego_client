import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

/// `BePageView` is an abstract class that extends `GetView` and provides a structure for building pages in a Flutter application using the GetX state management library.
/// Example:
/// ```
/// class HomePageView extends BePageView<HomeState, HomePageController> {
///   const HomePageView({super.key});
///
///   @override
///   SuccessPageWidget<HomeState> viewSuccess(final BuildContext context, final HomeState state) {
///     return MyWidget(data: state);
///   }
/// }
/// ```
abstract class BeView<S, C extends BePageController<S>> extends GetView<C> {
  const BeView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Obx(() {
      final status = controller.status;
      return switch (controller.status) {
        LoadingStatus<S>() => viewLoading(context, status.data),
        ErrorStatus<S, Object>(error: final error, data: final data) => viewError(context, data, error),
        EmptyStatus<S>() => viewEmpty(context, status.data),
        SuccessStatus<S>(data: final data) => viewSuccess(context, data),
        _ => viewCustom(context, status.data),
      };
    });
  }

  LoadingStateWidget<S> viewLoading(final BuildContext context, final S? state) {
    return LoadingStateWidget<S>();
  }

  ErrorStateWidget<S> viewError(final BuildContext context, final S? state, final Object? error) {
    return ErrorStateWidget<S>(error: error, state: state);
  }

  EmptyStateWidget<S> viewEmpty(final BuildContext context, final S? state) {
    return EmptyStateWidget<S>();
  }

  SuccessStateWidget<S> viewSuccess(final BuildContext context, final S state) {
    return SuccessStateWidget<S>(data: state);
  }

  CustomStateWidget<S> viewCustom(final BuildContext context, final S? state) {
    return CustomStateWidget<S>(data: state);
  }
}

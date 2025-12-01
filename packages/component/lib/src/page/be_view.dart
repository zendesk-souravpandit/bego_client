import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

/// `BeView` is an abstract class that extends `GetView` and provides a structure for building
/// independent sections or blocks (`BeSection`) within a page in a Flutter application using the GetX
/// state management library.
///
/// Each `BeView` listens to the state of an individual section managed by the controller and rebuilds
/// only when that section’s state updates. This is enabled via `GetBuilder` with an `id` tied to the
/// section, ensuring UI updates are scoped precisely.
///
/// Each section handles its own API requests, loading, error, empty, and success states independently,
/// allowing for modular and performant UI.
///
/// Example:
/// ```dart
/// class HomePageView extends BePageView<HomeState, HomePageController> {
///   const HomePageView({super.key, required super.section});
///
///   @override
///   SuccessPageWidget<HomeState> viewSuccess(final BuildContext context, final HomeState state) {
///     return MyWidget(data: state);
///   }
/// }
/// ```
///
/// Usage:
/// - Provide the specific `BeSection` instance that identifies this view’s section.
/// - Implement the state-specific UI in the overridable `viewLoading`, `viewError`, `viewEmpty`,
///   `viewSuccess`, and `viewCustom` methods.
/// - The `controller` must call `update([section])` to trigger section-specific rebuilds.
/// Example:
///
/// ```dart
///  class ProfileView extends BeView<AppState, AppSettingsController> {
///    const ProfileView({super.key}) : super(viewId: 'profile');
///
///    @override
///    StateWidget<AppState> viewSuccess(final BuildContext context, final AppState state) {
///      return MyWidget(data: state);
///    }
///  }
///
///  class MyWidget extends SuccessStateWidget<AppState> {
///    const MyWidget({super.key, required super.data});
///
///    @override
///    Widget build(final BuildContext context) {
///      return Text(
///        data.toJson().toString(),
///        style: const TextStyle(fontSize: 20, color: BeColors.gray800),
///      );
///    }
///  }
///
///  class ProfileView2 extends BeView<AppState, AppSettingsController> {
///    const ProfileView2({super.key}) : super(viewId: 'profile2');
///
///    @override
///    StateWidget<AppState> viewSuccess(final BuildContext context, final AppState state) {
///      return MyWidget(data: state);
///    }
///  }
/// ```

abstract class BeView<S, C extends BePageController<S>> extends GetView<C> implements BeSection {
  const BeView({super.key, required this.viewId, this.viewController});

  final BePageController<S>? viewController;

  @override
  final Object viewId;

  @override
  Widget build(final BuildContext context) {
    controller.attach(this);
    return GetBuilder<C>(
      id: this,
      builder: (final controller) {
        final status = (viewController ?? controller).getStatus(this);

        // Render corresponding widget based on status type.
        return switch (status) {
          LoadingStatus<S>() => viewLoading(context, status.data),
          ErrorStatus<S, Object>(error: final error, data: final data) => viewError(
            context,
            data,
            error,
          ),
          EmptyStatus<S>() => viewEmpty(context, status.data),
          SuccessStatus<S>(data: final data) => viewSuccess(context, data),
          _ => viewCustom(context, status?.data),
        };
      },
      dispose: (final state) => controller.detach(this),
    );
  }

  /// Override to customize loading state UI.
  StateWidget<S> viewLoading(final BuildContext context, final S? state) => LoadingStateWidget<S>();

  /// Override to customize error state UI.
  StateWidget<S> viewError(final BuildContext context, final S? state, final Object? error) =>
      ErrorStateWidget<S>(error: error, state: state);

  /// Override to customize empty state UI.
  StateWidget<S> viewEmpty(final BuildContext context, final S? state) => EmptyStateWidget<S>();

  /// Override to customize success state UI.
  StateWidget<S> viewSuccess(final BuildContext context, final S state) =>
      SuccessStateWidget<S>(data: state);

  /// Override to customize any custom state UI.
  StateWidget<S> viewCustom(final BuildContext context, final S? state) =>
      CustomStateWidget<S>(data: state);
}

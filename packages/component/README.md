<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

Example: How to create page/view state

```
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({final String? name, final int? age}) = _HomeState;
  const HomeState._();

  factory HomeState.fromJson(final Map<String, dynamic> json) => _$HomeStateFromJson(json);
}

```

```


 abstract class BePageView<S, C extends BePageController<S>> extends GetView<C> {
   const BePageView({super.key});

   @override
   Widget build(final BuildContext context) {
     return Obx(() => BePageStatusView(status: controller.status));
   }
 }

 class HomePageController extends BePageController<HomeState> {
   @override
   void onInit() {
     super.onInit();
     change(const SuccessStatus(HomeState(name: ' Bego App ', age: 43)));
   }
 }

 class HomePageView extends BePageView<HomeState, HomePageController> {
   const HomePageView({super.key});

   @override
   SuccessPageWidget<HomeState> viewSuccess(final BuildContext context, final HomeState state) {
     return MyWidget(data: state);
   }
 }

 class HomePage extends BePage<HomeState, HomePageController> {
   HomePage({super.key})
     : super(
         statusResolver: BePageStatusWidgetResolver<HomeState>(
           successBuilder: (final context, final data) {
             return Column(children: [Text(' ${data.toJson().toString()}')]);
           },
           emptyBuilder: (final context) => const Text('No Data found'),
           customBuilder: (final context, final state) => Text(state?.toString() ?? 'hello'),
         ),
       );
 }

 class MyWidget extends SuccessPageWidget<HomeState> {
   const MyWidget({super.key, required super.data});
   HomePageController get controller => Get.find<HomePageController>();

   @override
   Widget build(final BuildContext context) {
     return Column(
       children: [
         Text('Hello from MyWidget ${data.toJson()}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
         ElevatedButton(onPressed: () {}, child: Text('Click Me : ${controller.state.name}')),
       ],
     );
   }
 }

```

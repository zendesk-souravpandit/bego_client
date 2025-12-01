///
///
/// ```
///
/// class WIPPage extends BePage<WIPState, WIPController> {
///   WIPPage({super.key})
///     : super(
///         statusResolver: BePageStatusWidgetResolver<WIPController>(
///           successBuilder: (final BuildContext context, final WIPController controller) {
///             return Scaffold(
///               appBar: AppBar(),
///               body: Container(
///                 padding: p16,
///                 child: Column(
///                   spacing: 16,
///                   children: [
///                     TextFormField(
///                       initialValue: controller._state.value.name,
///                       onChanged: controller.valueChanged,
///                     ),
///
///                     ElevatedButton(onPressed: () {}, child: const Text('save')),
///                     const BeText.headlineLarge('Result'),
///                     Obx(() {
///                       return BeText(controller._state.value.name);
///                     }),
///                   ],
///                 ),
///               ),
///             );
///           },
///         ),
///       );
/// }
///
/// class WIPState {
///   WIPState(this.name);
///
///   final String name;
///
///   // static init
///   static WIPState init() => WIPState('Hello');
///
///   WIPState copyWith({final String? name}) {
///     return WIPState(name ?? this.name);
///   }
///
///   // toJson method to convert state to a map
///   Map<String, dynamic> toJson() {
///     return {'name': name};
///   }
///
///   // fromJson method to create state from a map
///   static WIPState fromJson(final Map<String, dynamic> json) {
///     return WIPState(json['name'] as String);
///   }
/// }
///
/// class WIPController extends BePageController<WIPState> {
///   late final BeStorageService store = Get.find();
///   final Rx<WIPState> _state = WIPState.init().obs;
///
///   Future<void> valueChanged(final String value) async {
///     _state.value = WIPState(value);
///
///     await store.write('hello', value);
///   }
///
///   @override
///   void onInit() {
///     super.onInit();
///     final hello = store.read<String>('hello', defaultValue: 'ABC');
///     print('Hello Value : $hello');
///     _state.value = WIPState(hello ?? 'default init value');
///     change(SuccessStatus(_state.value));
///   }
/// }
/// ```
library becomponent.component;

export './src/app/panel/app_bar_panel.dart';
export './src/app/panel/drawer_bar_panel.dart';
export './src/app/panel/main_content_panel.dart';
export './src/app/panel/side_panel.dart';
export './src/page/be_page.dart';
export './src/page/be_page_controller.dart';
export './src/page/be_page_section_resolver.dart';
export './src/page/be_page_status_resolver.dart';
export './src/page/be_view.dart';
export './src/page/components/be_state_widgets.dart';
export './src/page/components/connection_lost_widget.dart';
export './src/page/components/empty_widget.dart';
export './src/page/components/loading_page_widget.dart';
export './src/page/components/no_result_found_widget.dart';
export './src/page/components/unauthorized_widget.dart';
export './src/page/components/unknown_widget.dart';
export './src/widgets/state/be_reducer.dart';
export './src/widgets/state/be_state_action.dart';
export './src/widgets/state/be_state_widget.dart';

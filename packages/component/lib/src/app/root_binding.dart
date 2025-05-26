import 'package:becomponent/src/app/locale_controller.dart';
import 'package:becomponent/src/app/theme_controller.dart';
import 'package:becomponent/src/page/app_settings/app_settings_controller.dart';
import 'package:becore/getx.dart' show Binding, Bind;

class AppRootBindings extends Binding {
  @override
  List<Bind<dynamic>> dependencies() {
    return [
      Bind.lazyPut<AppThemeController>(AppThemeController.new),
      Bind.lazyPut<AppLocaleController>(AppLocaleController.new),
      Bind.lazyPut<AppSettingsController>(AppSettingsController.new),

      // Bind.lazyPut<HomePageController>(HomePageController.new),
    ];
  }
}

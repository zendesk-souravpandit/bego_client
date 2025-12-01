import 'package:becore/getx.dart';
import 'package:bego/pages/categories/categories_controller.dart';

class CategoriesBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    // CategoriesController requires 'category' parameter, so we don't inject it here
    // It will be created by the page when needed
    Bind.lazyPut<CategoriesController>(() => CategoriesController()),
  ];
}

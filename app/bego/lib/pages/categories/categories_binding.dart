import 'package:becore/getx.dart';

class CategoriesBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    // CategoriesController requires 'category' parameter, so we don't inject it here
    // It will be created by the page when needed
  ];
}

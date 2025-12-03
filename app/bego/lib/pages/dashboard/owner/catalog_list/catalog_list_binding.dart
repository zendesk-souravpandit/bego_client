import 'package:becore/getx.dart';
import 'package:bego/pages/dashboard/owner/catalog_list/catalog_list_controller.dart';

class CatalogListBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<CatalogListController>(CatalogListController.new),
  ];
}

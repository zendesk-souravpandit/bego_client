import 'package:becore/getx.dart';
import 'package:bego/pages/dashboard/owner/add_item/add_item_controller.dart';

class AddItemBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<AddItemController>(AddItemController.new),
  ];
}

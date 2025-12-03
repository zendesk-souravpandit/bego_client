import 'package:becore/getx.dart';
import 'package:bego/pages/dashboard/owner/edit_item/edit_item_controller.dart';

class EditItemBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<EditItemController>(EditItemController.new),
  ];
}

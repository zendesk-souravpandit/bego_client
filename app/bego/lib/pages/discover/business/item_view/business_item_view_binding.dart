import 'package:bego/pages/discover/business/item_view/business_item_view_controller.dart';
import 'package:becore/getx.dart';

class BusinessItemViewBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<BusinessItemViewController>(BusinessItemViewController.new),
  ];
}

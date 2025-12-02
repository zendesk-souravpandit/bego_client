import 'package:becore/getx.dart';
import 'package:bego/pages/discover/business/business_view_controller.dart';

class BusinessViewBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<BusinessViewController>(BusinessViewController.new),
  ];
}

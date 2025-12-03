import 'package:becore/getx.dart';
import 'package:bego/pages/dashboard/owner/business_owner_controller.dart';

class BusinessOwnerBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<BusinessOwnerController>(BusinessOwnerController.new),
  ];
}

import 'package:becore/getx.dart';
import 'package:bego/pages/dashboard/owner/edit_business/edit_business_controller.dart';

class EditBusinessBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<EditBusinessController>(EditBusinessController.new),
  ];
}

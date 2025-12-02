import 'package:becore/getx.dart';
import 'package:bego/pages/dashboard/dashboard_controller.dart';

class DashboardBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<DashboardController>(DashboardController.new),
  ];
}

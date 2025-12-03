import 'package:bego/pages/home/home_controller.dart';
import 'package:becore/getx.dart';

class HomeBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<HomeController>(HomeController.new),
  ];
}

import 'package:becore/getx.dart';
import 'package:bego/pages/discover/discover_controller.dart';

class DiscoverBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<DiscoverController>(DiscoverController.new),
  ];
}

import 'package:bego/pages/cart/cart_controller.dart';
import 'package:becore/getx.dart';

class CartBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<CartController>(CartController.new),
  ];
}

import 'package:bego/pages/auth/login/login_controller.dart';
import 'package:becore/getx.dart';

class LoginBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<LoginController>(LoginController.new),
  ];
}

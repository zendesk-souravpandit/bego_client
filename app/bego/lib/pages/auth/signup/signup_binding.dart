import 'package:bego/pages/auth/signup/signup_controller.dart';
import 'package:becore/getx.dart';

class SignupBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<SignupController>(SignupController.new),
  ];
}

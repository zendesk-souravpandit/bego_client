import 'package:bego/pages/profile/profile_controller.dart';
import 'package:becore/getx.dart';

class ProfileBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<ProfileController>(ProfileController.new),
  ];
}

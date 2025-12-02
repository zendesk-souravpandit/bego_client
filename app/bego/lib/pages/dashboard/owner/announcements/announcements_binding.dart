import 'package:becore/getx.dart';
import 'package:bego/pages/dashboard/owner/announcements/announcements_controller.dart';

class AnnouncementsBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<AnnouncementsController>(AnnouncementsController.new),
  ];
}

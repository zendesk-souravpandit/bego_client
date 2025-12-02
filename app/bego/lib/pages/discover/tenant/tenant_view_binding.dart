import 'package:bego/pages/discover/tenant/tenant_view_controller.dart';
import 'package:becore/getx.dart';

class TenantViewBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<TenantViewController>(TenantViewController.new),
  ];
}

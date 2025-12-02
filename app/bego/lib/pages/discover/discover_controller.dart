import 'package:bego/pages/discover/discover_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class DiscoverController extends BePageController<DiscoverState> {
  DiscoverController();

  @override
  void onInit() {
    super.onInit();
    loadDiscoverData();
  }

  Future<void> loadDiscoverData() async {
    try {
      change(SuccessStatus(DiscoverState.initial()));
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void selectTenant(final String tenantId) {
    Get.toNamed<void>('/app/discover/$tenantId');
  }

  void selectBusiness(final String tenantId, final String businessId) {
    Get.toNamed<void>('/app/discover/$tenantId/$businessId');
  }
}

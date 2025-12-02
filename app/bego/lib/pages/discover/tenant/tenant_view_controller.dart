import 'package:bego/pages/discover/tenant/tenant_view_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class TenantViewController extends BePageController<TenantViewState> {
  TenantViewController();

  late String tenantId;

  @override
  void onInit() {
    super.onInit();
    tenantId = Get.parameters['tenantId'] ?? '';
    loadTenantData();
  }

  Future<void> loadTenantData() async {
    try {
      change(SuccessStatus(TenantViewState.initial(tenantId)));
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void selectBusiness(final String businessId) {
    Get.toNamed<void>('/app/discover/$tenantId/$businessId');
  }

  void goBack() {
    Get.back();
  }
}

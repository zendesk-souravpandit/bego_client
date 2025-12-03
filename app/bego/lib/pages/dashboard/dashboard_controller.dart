import 'package:bego/pages/dashboard/dashboard_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class DashboardController extends BePageController<DashboardState> {
  late String _tenantId;

  @override
  void onInit() {
    super.onInit();
    _tenantId = Get.parameters['tenantId'] ?? 'unknown';
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    try {
      change(SuccessStatus(DashboardState.initial(tenantId: _tenantId)));
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void viewBusiness(final String businessId) {
    Get.toNamed<void>('app/dashboard/$_tenantId/$businessId/owner');
  }
}

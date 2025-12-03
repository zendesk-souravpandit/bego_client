import 'package:bego/pages/discover/business/business_view_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class BusinessViewController extends BePageController<BusinessViewState> {
  late String _tenantId;
  late String _businessId;

  @override
  void onInit() {
    super.onInit();
    _tenantId = Get.parameters['tenantId'] ?? '';
    _businessId = Get.parameters['businessId'] ?? '';
    loadBusinessData();
  }

  Future<void> loadBusinessData() async {
    try {
      change(
        SuccessStatus(
          BusinessViewState.initial(
            tenantId: _tenantId,
            businessId: _businessId,
          ),
        ),
      );
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void goBack() {
    Get.back<void>();
  }

  void selectItem(final String itemId) {
    Get.toNamed<void>(
      '/app/discover/$_tenantId/$_businessId/item/$itemId/view',
    );
  }
}

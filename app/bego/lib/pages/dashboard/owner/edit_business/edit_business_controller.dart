import 'package:bego/pages/dashboard/owner/edit_business/edit_business_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class EditBusinessController extends BePageController<EditBusinessState> {
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
          EditBusinessState.initial(
            tenantId: _tenantId,
            businessId: _businessId,
          ),
        ),
      );
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  Future<void> saveBusiness() async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar('Success', 'Business updated successfully');
      Get.back();
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void goBack() {
    Get.back();
  }
}

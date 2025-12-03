import 'package:bego/pages/dashboard/owner/add_item/add_item_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class AddItemController extends BePageController<AddItemState> {
  late String _tenantId;
  late String _businessId;

  @override
  void onInit() {
    super.onInit();
    _tenantId = Get.parameters['tenantId'] ?? '';
    _businessId = Get.parameters['businessId'] ?? '';
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    try {
      change(
        SuccessStatus(
          AddItemState.initial(tenantId: _tenantId, businessId: _businessId),
        ),
      );
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  Future<void> saveItem() async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar('Success', 'Item added successfully');
      Get.back();
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void goBack() {
    Get.back();
  }
}

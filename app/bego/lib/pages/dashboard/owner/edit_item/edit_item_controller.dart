import 'package:bego/pages/dashboard/owner/edit_item/edit_item_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class EditItemController extends BePageController<EditItemState> {
  late String _tenantId;
  late String _businessId;
  late String _itemId;

  @override
  void onInit() {
    super.onInit();
    _tenantId = Get.parameters['tenantId'] ?? '';
    _businessId = Get.parameters['businessId'] ?? '';
    _itemId = Get.parameters['itemId'] ?? '';
    loadItemData();
  }

  Future<void> loadItemData() async {
    try {
      change(
        SuccessStatus(
          EditItemState.initial(
            tenantId: _tenantId,
            businessId: _businessId,
            itemId: _itemId,
          ),
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
      Get.snackbar('Success', 'Item updated successfully');
      Get.back();
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void goBack() {
    Get.back();
  }
}

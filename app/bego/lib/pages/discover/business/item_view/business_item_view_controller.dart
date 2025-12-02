import 'package:bego/pages/discover/business/item_view/business_item_view_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class BusinessItemViewController
    extends BePageController<BusinessItemViewState> {
  BusinessItemViewController();

  @override
  void onInit() {
    super.onInit();
    final itemId = Get.parameters['itemId'] ?? '';
    loadItemData(itemId);
  }

  Future<void> loadItemData(final String itemId) async {
    try {
      change(SuccessStatus(BusinessItemViewState.initial(itemId: itemId)));
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void addToCart() {
    // Handle add to cart logic
    Get.snackbar('Success', 'Item added to cart');
  }

  void goBack() {
    Get.back();
  }
}

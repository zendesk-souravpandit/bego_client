import 'package:bego/pages/dashboard/owner/catalog_list/catalog_list_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class CatalogListController extends BePageController<CatalogListState> {
  late String _tenantId;
  late String _businessId;

  @override
  void onInit() {
    super.onInit();
    _tenantId = Get.parameters['tenantId'] ?? '';
    _businessId = Get.parameters['businessId'] ?? '';
    loadCatalogData();
  }

  Future<void> loadCatalogData() async {
    try {
      change(
        SuccessStatus(
          CatalogListState.initial(
            tenantId: _tenantId,
            businessId: _businessId,
          ),
        ),
      );
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void addNewItem() {
    Get.toNamed<void>('/app/dashboard/$_tenantId/$_businessId/owner/item/add');
  }

  void editItem(final String itemId) {
    Get.toNamed<void>(
      '/app/dashboard/$_tenantId/$_businessId/owner/item/edit/$itemId',
    );
  }

  void goBack() {
    Get.back<void>();
  }
}

import 'package:bego/pages/dashboard/owner/business_owner_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class BusinessOwnerController extends BePageController<BusinessOwnerState> {
  late String _tenantId;
  late String _businessId;

  @override
  void onInit() {
    super.onInit();
    _tenantId = Get.parameters['tenantId'] ?? '';
    _businessId = Get.parameters['businessId'] ?? '';
    loadBusinessOwnerData();
  }

  Future<void> loadBusinessOwnerData() async {
    try {
      change(
        SuccessStatus(
          BusinessOwnerState.initial(
            tenantId: _tenantId,
            businessId: _businessId,
          ),
        ),
      );
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void viewCatalog() {
    Get.toNamed<void>(
      '/app/dashboard/$_tenantId/$_businessId/owner/features/catalog',
    );
  }

  void addItem() {
    Get.toNamed<void>('/app/dashboard/$_tenantId/$_businessId/owner/item/add');
  }

  void editBusiness() {
    Get.toNamed<void>('/app/dashboard/$_tenantId/$_businessId/owner/edit');
  }

  void viewAnnouncements() {
    Get.toNamed<void>(
      '/app/dashboard/$_tenantId/$_businessId/owner/announcements',
    );
  }
}

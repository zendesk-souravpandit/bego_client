import 'package:bego/pages/dashboard/owner/announcements/announcements_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class AnnouncementsController extends BePageController<AnnouncementsState> {
  late String _tenantId;
  late String _businessId;

  @override
  void onInit() {
    super.onInit();
    _tenantId = Get.parameters['tenantId'] ?? '';
    _businessId = Get.parameters['businessId'] ?? '';
    loadAnnouncements();
  }

  Future<void> loadAnnouncements() async {
    try {
      change(
        SuccessStatus(
          AnnouncementsState.initial(
            tenantId: _tenantId,
            businessId: _businessId,
          ),
        ),
      );
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  Future<void> createAnnouncement() async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar('Success', 'Announcement created successfully');
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void goBack() {
    Get.back();
  }
}

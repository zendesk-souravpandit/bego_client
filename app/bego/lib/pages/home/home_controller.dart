import 'package:bego/pages/home/home_state.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';

class HomeController extends BePageController<HomeState> {
  HomeController();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      change(SuccessStatus(HomeState.initial()));
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void selectCategory(final String category) {
    Get.toNamed<void>('/categories/$category');
  }

  void goToCart() {
    Get.toNamed<void>('/cart');
  }

  void goToProfile() {
    Get.toNamed<void>('/profile');
  }
}

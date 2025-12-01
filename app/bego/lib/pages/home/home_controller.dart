import 'package:bego/pages/home/home_state.dart';
import 'package:becomponent/page.dart';
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
    Get.toNamed<void>('/app/category/$category');
  }

  void goToCart() {
    Get.toNamed<void>('/app/cart');
  }

  void goToProfile() {
    Get.toNamed<void>('/app/profile');
  }
}

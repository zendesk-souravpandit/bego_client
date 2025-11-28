import 'package:bego/pages/categories/categories_state.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';

class CategoriesController extends BePageController<CategoriesState> {
  final String category;

  CategoriesController(this.category);

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  Future<void> loadItems() async {
    try {
      change(SuccessStatus(CategoriesState.initial(category: category)));
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void selectItem(final String itemId) {
    Get.toNamed<void>('/categories/$category/$itemId');
  }

  void goBack() {
    Get.back<void>();
  }
}

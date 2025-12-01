import 'package:bego/pages/categories/categories_state.dart';
import 'package:becomponent/page.dart';
import 'package:becore/getx.dart';

class CategoriesController extends BePageController<CategoriesState> {
  late String? _category;

  @override
  void onInit() {
    super.onInit();
    final categoryId = Get.parameters['categoryId'];
    _category = categoryId;
    loadItems();
  }

  Future<void> loadItems() async {
    try {
      change(SuccessStatus(CategoriesState.initial(category: _category ?? '')));
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void selectItem(final String itemId) {
    Get.toNamed<void>('/categories/${_category ?? ''}/$itemId');
  }

  void goBack() {
    Get.back<void>();
  }
}

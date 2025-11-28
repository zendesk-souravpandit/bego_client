import 'package:bego/pages/category_details/category_details_state.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';

class CategoryDetailsController extends BePageController<CategoryDetailsState> {
  final String category;
  final String itemId;

  CategoryDetailsController({required this.category, required this.itemId});

  @override
  void onInit() {
    super.onInit();
    loadItemDetails();
  }

  Future<void> loadItemDetails() async {
    try {
      change(
        SuccessStatus(
          CategoryDetailsState.initial(category: category, itemId: itemId),
        ),
      );
    } catch (e) {
      change(ErrorStatus(Exception(e.toString())));
    }
  }

  void increaseQuantity() {
    final currentState = state;
    change(
      SuccessStatus(currentState.copyWith(quantity: currentState.quantity + 1)),
    );
  }

  void decreaseQuantity() {
    final currentState = state;
    if (currentState.quantity > 1) {
      change(
        SuccessStatus(
          currentState.copyWith(quantity: currentState.quantity - 1),
        ),
      );
    }
  }

  Future<void> addToCart() async {
    final currentState = state;

    try {
      change(SuccessStatus(currentState.copyWith(isLoading: true)));

      // Simulate add to cart API call
      await Future<void>.delayed(const Duration(seconds: 1));

      change(SuccessStatus(currentState.copyWith(isLoading: false)));

      // Navigate to cart
      await Get.toNamed<void>('/cart');
    } catch (e) {
      change(
        SuccessStatus(
          currentState.copyWith(
            isLoading: false,
            errorMessage: 'Failed to add to cart',
          ),
        ),
      );
    }
  }

  void goBack() {
    Get.back<void>();
  }
}

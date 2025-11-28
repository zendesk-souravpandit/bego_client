import 'package:bego/pages/cart/cart_state.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';

class CartController extends BePageController<CartState> {
  CartController();

  @override
  void onInit() {
    super.onInit();
    change(SuccessStatus(CartState.initial()));
  }

  void nextStep() {
    final currentState = state;
    if (currentState.currentStep < 3) {
      change(
        SuccessStatus(
          currentState.copyWith(currentStep: currentState.currentStep + 1),
        ),
      );
    }
  }

  void previousStep() {
    final currentState = state;
    if (currentState.currentStep > 1) {
      change(
        SuccessStatus(
          currentState.copyWith(currentStep: currentState.currentStep - 1),
        ),
      );
    }
  }

  Future<void> checkout() async {
    final currentState = state;

    try {
      change(SuccessStatus(currentState.copyWith(isLoading: true)));

      // Simulate checkout API call
      await Future<void>.delayed(const Duration(seconds: 2));

      change(SuccessStatus(currentState.copyWith(isLoading: false)));

      // Navigate to home or order confirmation
      await Get.toNamed<void>('/home');
    } catch (e) {
      change(
        SuccessStatus(
          currentState.copyWith(
            isLoading: false,
            errorMessage: 'Checkout failed. Please try again.',
          ),
        ),
      );
    }
  }

  void updateShippingAddress(final String address) {
    final currentState = state;
    change(SuccessStatus(currentState.copyWith(shippingAddress: address)));
  }

  void updatePaymentMethod(final String method) {
    final currentState = state;
    change(SuccessStatus(currentState.copyWith(paymentMethod: method)));
  }

  void goBack() {
    Get.back<void>();
  }
}

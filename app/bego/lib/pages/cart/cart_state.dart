import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';
part 'cart_state.g.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    required final List<String> cartItems,
    required final int currentStep,
    required final String? shippingAddress,
    required final String? paymentMethod,
    required final double totalPrice,
    required final bool isLoading,
    required final String? errorMessage,
  }) = _CartState;

  factory CartState.initial() => const CartState(
    cartItems: ['Item 1', 'Item 2', 'Item 3'],
    currentStep: 1,
    shippingAddress: null,
    paymentMethod: null,
    totalPrice: 45000.0,
    isLoading: false,
    errorMessage: null,
  );

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);
}

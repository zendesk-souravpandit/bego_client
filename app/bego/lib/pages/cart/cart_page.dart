import 'package:bego/constants/strings.dart';
import 'package:bego/pages/cart/cart_state.dart';
import 'package:bego/pages/cart/cart_controller.dart';
import 'package:becomponent/src/page/be_page.dart';
import 'package:becomponent/src/page/be_page_status_resolver.dart';
import 'package:flutter/material.dart';

class CartPage extends BePage<CartState, CartController> {
  CartPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<CartController>(
          successBuilder:
              (final BuildContext context, final CartController controller) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(AppStrings.checkout),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: controller.goBack,
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Step indicator
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStepIndicator(
                                1,
                                AppStrings.step1,
                                controller.state.currentStep,
                              ),
                              _buildStepIndicator(
                                2,
                                AppStrings.step2,
                                controller.state.currentStep,
                              ),
                              _buildStepIndicator(
                                3,
                                AppStrings.step3,
                                controller.state.currentStep,
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        // Step content
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (controller.state.currentStep == 1)
                                _buildReviewStep(controller)
                              else if (controller.state.currentStep == 2)
                                _buildShippingStep(controller)
                              else
                                _buildPaymentStep(controller),
                              const SizedBox(height: 24),
                              if (controller.state.errorMessage != null)
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    controller.state.errorMessage!,
                                    style: TextStyle(
                                      color: Colors.red.shade900,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (controller.state.currentStep > 1)
                                    ElevatedButton.icon(
                                      onPressed: controller.previousStep,
                                      icon: const Icon(Icons.arrow_back),
                                      label: const Text(AppStrings.back),
                                    ),
                                  if (controller.state.currentStep < 3)
                                    ElevatedButton.icon(
                                      onPressed: controller.nextStep,
                                      label: const Text(AppStrings.stepNext),
                                      icon: const Icon(Icons.arrow_forward),
                                    )
                                  else
                                    ElevatedButton(
                                      onPressed: controller.state.isLoading
                                          ? null
                                          : controller.checkout,
                                      child: controller.state.isLoading
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : const Text(AppStrings.placeOrder),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final CartController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );

  static Widget _buildStepIndicator(
    final int step,
    final String label,
    final int currentStep,
  ) {
    final isActive = step <= currentStep;
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: isActive ? Colors.blue : Colors.grey,
          child: Text(
            step.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  static Widget _buildReviewStep(final CartController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.reviewItems,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.state.cartItems.length,
          itemBuilder: (final context, final index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: Text(controller.state.cartItems[index]),
                subtitle: const Text('₹ 15,000'),
                trailing: const Text('Qty: 1'),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '${AppStrings.total}:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '₹ ${controller.state.totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildShippingStep(final CartController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.shippingAddress,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          onChanged: controller.updateShippingAddress,
          maxLines: 4,
          decoration: InputDecoration(
            labelText: AppStrings.shippingAddress,
            border: OutlineInputBorder(),
            hintText: '123 Main St, City, State 12345',
          ),
        ),
      ],
    );
  }

  static Widget _buildPaymentStep(final CartController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.paymentMethod,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ListTile(
          title: const Text(AppStrings.creditCard),
          leading: Radio<String>(
            value: 'credit_card',
            groupValue: controller.state.paymentMethod ?? 'credit_card',
            onChanged: (final value) =>
                controller.updatePaymentMethod(value ?? 'credit_card'),
          ),
        ),
        ListTile(
          title: const Text(AppStrings.debitCard),
          leading: Radio<String>(
            value: 'debit_card',
            groupValue: controller.state.paymentMethod ?? 'credit_card',
            onChanged: (final value) =>
                controller.updatePaymentMethod(value ?? 'debit_card'),
          ),
        ),
        ListTile(
          title: const Text(AppStrings.upi),
          leading: Radio<String>(
            value: 'upi',
            groupValue: controller.state.paymentMethod ?? 'credit_card',
            onChanged: (final value) =>
                controller.updatePaymentMethod(value ?? 'upi'),
          ),
        ),
      ],
    );
  }
}

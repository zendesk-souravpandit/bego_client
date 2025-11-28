import 'package:bego/constants/strings.dart';
import 'package:bego/pages/category_details/category_details_state.dart';
import 'package:bego/pages/category_details/category_details_controller.dart';
import 'package:becomponent/src/page/be_page.dart';
import 'package:becomponent/src/page/be_page_status_resolver.dart';
import 'package:flutter/material.dart';

class CategoryDetailsPage
    extends BePage<CategoryDetailsState, CategoryDetailsController> {
  final String category;
  final String itemId;

  CategoryDetailsPage({required this.category, required this.itemId, super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<CategoryDetailsController>(
          successBuilder:
              (
                final BuildContext context,
                final CategoryDetailsController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(AppStrings.itemDetails),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: controller.goBack,
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250,
                          color: Colors.blue[100],
                          child: const Icon(Icons.image, size: 100),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.state.itemName,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${controller.state.rating}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '₹ ${controller.state.price.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                AppStrings.description,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                controller.state.description,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '${AppStrings.quantity}:',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: controller.decreaseQuantity,
                                        icon: const Icon(Icons.remove),
                                      ),
                                      Text(
                                        '${controller.state.quantity}',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      IconButton(
                                        onPressed: controller.increaseQuantity,
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: controller.state.isLoading
                                      ? null
                                      : controller.addToCart,
                                  child: controller.state.isLoading
                                      ? const CircularProgressIndicator()
                                      : const Text(AppStrings.addToCart),
                                ),
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
              (
                final BuildContext context,
                final CategoryDetailsController state,
              ) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

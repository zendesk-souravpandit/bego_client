import 'package:bego/pages/discover/business/item_view/business_item_view_state.dart';
import 'package:bego/pages/discover/business/item_view/business_item_view_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class BusinessItemViewPage
    extends BePage<BusinessItemViewState, BusinessItemViewController> {
  BusinessItemViewPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<BusinessItemViewController>(
          successBuilder:
              (
                final BuildContext context,
                final BusinessItemViewController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(controller.state.itemName),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.favorite_outline),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Item image placeholder
                        Container(
                          width: double.infinity,
                          height: 300,
                          color: Colors.grey[200],
                          child: controller.state.itemImage.isEmpty
                              ? Icon(
                                  Icons.image,
                                  size: 100,
                                  color: Colors.grey[400],
                                )
                              : Image.network(
                                  controller.state.itemImage,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title and Price
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.state.itemName,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '\$${controller.state.itemPrice.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Description
                              Text(
                                'Description',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                controller.state.itemDescription,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 24),
                              // Details section
                              if (controller.state.itemDetails.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Details',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    ...controller.state.itemDetails.entries.map(
                                      (final entry) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(entry.key),
                                            Text(entry.value.toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                  ],
                                ),
                              // Add to cart button
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: controller.addToCart,
                                  child: const Text('Add to Cart'),
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
                final BusinessItemViewController state,
              ) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

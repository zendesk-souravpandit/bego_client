import 'package:bego/pages/dashboard/owner/add_item/add_item_state.dart';
import 'package:bego/pages/dashboard/owner/add_item/add_item_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class AddItemPage extends BePage<AddItemState, AddItemController> {
  AddItemPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<AddItemController>(
          successBuilder:
              (final BuildContext context, final AddItemController controller) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Add Item'),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: controller.goBack,
                    ),
                  ),
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Item Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 4,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Price',
                            border: OutlineInputBorder(),
                            prefixText: '\$ ',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.saveItem,
                            child: const Text('Add Item'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final AddItemController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

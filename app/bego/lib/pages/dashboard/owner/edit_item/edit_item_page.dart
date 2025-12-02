import 'package:bego/pages/dashboard/owner/edit_item/edit_item_state.dart';
import 'package:bego/pages/dashboard/owner/edit_item/edit_item_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class EditItemPage extends BePage<EditItemState, EditItemController> {
  EditItemPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<EditItemController>(
          successBuilder:
              (
                final BuildContext context,
                final EditItemController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Edit Item'),
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
                        Text(
                          'Item: ${controller.state.itemName}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Item Name',
                            border: OutlineInputBorder(),
                          ),
                          controller: TextEditingController(
                            text: controller.state.itemName,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 4,
                          controller: TextEditingController(
                            text: controller.state.itemDescription,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Price',
                            border: OutlineInputBorder(),
                            prefixText: '\$ ',
                          ),
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(
                            text: controller.state.itemPrice.toString(),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.saveItem,
                            child: const Text('Update Item'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final EditItemController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

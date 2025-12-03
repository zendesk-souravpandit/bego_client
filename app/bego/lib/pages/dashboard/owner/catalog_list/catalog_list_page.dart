import 'package:bego/pages/dashboard/owner/catalog_list/catalog_list_state.dart';
import 'package:bego/pages/dashboard/owner/catalog_list/catalog_list_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class CatalogListPage extends BePage<CatalogListState, CatalogListController> {
  CatalogListPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<CatalogListController>(
          successBuilder:
              (
                final BuildContext context,
                final CatalogListController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Catalog List'),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: controller.goBack,
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: controller.addNewItem,
                      ),
                    ],
                  ),
                  body: controller.state.items.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.inventory_2_outlined,
                                size: 80,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'No items in catalog',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.state.items.length,
                          itemBuilder: (final context, final index) {
                            final item = controller.state.items[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.card_giftcard),
                                title: Text(item),
                                trailing: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () => controller.editItem(item),
                                ),
                                onTap: () => controller.editItem(item),
                              ),
                            );
                          },
                        ),
                );
              },
          customBuilder:
              (final BuildContext context, final CatalogListController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

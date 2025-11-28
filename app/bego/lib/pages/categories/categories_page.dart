import 'package:bego/constants/strings.dart';
import 'package:bego/pages/categories/categories_state.dart';
import 'package:bego/pages/categories/categories_controller.dart';
import 'package:becomponent/src/page/be_page.dart';
import 'package:becomponent/src/page/be_page_status_resolver.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends BePage<CategoriesState, CategoriesController> {
  final String category;

  CategoriesPage({required this.category, super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<CategoriesController>(
          successBuilder:
              (
                final BuildContext context,
                final CategoriesController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      '${controller.state.category} ${AppStrings.categoryTitle}',
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: controller.goBack,
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: controller.state.items.length,
                      itemBuilder: (final context, final index) {
                        final item = controller.state.items[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: Icon(
                              Icons.card_giftcard,
                              color: Colors.blue[700],
                            ),
                            title: Text(item),
                            subtitle: const Text('₹ 5,000 - ₹ 25,000'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () => controller.selectItem(item),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final CategoriesController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

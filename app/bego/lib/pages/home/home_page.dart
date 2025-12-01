import 'package:bego/constants/strings.dart';
import 'package:bego/pages/home/home_state.dart';
import 'package:bego/pages/home/home_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class HomePage extends BePage<HomeState, HomeController> {
  HomePage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<HomeController>(
          successBuilder:
              (final BuildContext context, final HomeController controller) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(AppStrings.appName),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: controller.goToCart,
                      ),
                      IconButton(
                        icon: const Icon(Icons.person),
                        onPressed: controller.goToProfile,
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.selectService,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                            itemCount: controller.state.categories.length,
                            itemBuilder: (final context, final index) {
                              final category =
                                  controller.state.categories[index];
                              return GestureDetector(
                                onTap: () =>
                                    controller.selectCategory(category),
                                child: Card(
                                  elevation: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_bag,
                                        size: 50,
                                        color: Colors.blue[700],
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        category,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final HomeController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

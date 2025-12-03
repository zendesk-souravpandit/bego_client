import 'package:bego/pages/discover/discover_state.dart';
import 'package:bego/pages/discover/discover_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends BePage<DiscoverState, DiscoverController> {
  DiscoverPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<DiscoverController>(
          successBuilder:
              (
                final BuildContext context,
                final DiscoverController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(title: const Text('Discover Businesses')),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: controller.state.tenants.length,
                      itemBuilder: (final context, final index) {
                        final tenant = controller.state.tenants[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: const Icon(Icons.business),
                            title: Text(tenant),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () => controller.selectTenant(tenant),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
        ),
      );
}

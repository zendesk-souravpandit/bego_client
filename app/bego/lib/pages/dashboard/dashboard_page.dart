import 'package:bego/pages/dashboard/dashboard_state.dart';
import 'package:bego/pages/dashboard/dashboard_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends BePage<DashboardState, DashboardController> {
  DashboardPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<DashboardController>(
          successBuilder:
              (
                final BuildContext context,
                final DashboardController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Dashboard - ${controller.state.tenantId}'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: controller.state.businesses.length,
                      itemBuilder: (final context, final index) {
                        final business = controller.state.businesses[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: const Icon(Icons.storefront),
                            title: Text(business),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () => controller.viewBusiness(business),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final DashboardController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

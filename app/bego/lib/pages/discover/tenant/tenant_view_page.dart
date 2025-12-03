import 'package:bego/pages/discover/tenant/tenant_view_state.dart';
import 'package:bego/pages/discover/tenant/tenant_view_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class TenantViewPage extends BePage<TenantViewState, TenantViewController> {
  TenantViewPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<TenantViewController>(
          successBuilder:
              (
                final BuildContext context,
                final TenantViewController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Tenant: ${controller.state.tenantId}'),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: controller.goBack,
                    ),
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
                            leading: const Icon(Icons.store),
                            title: Text(business),
                            subtitle: Text('in ${controller.state.tenantId}'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () => controller.selectBusiness(business),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final TenantViewController _) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

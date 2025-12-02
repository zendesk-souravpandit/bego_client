import 'package:bego/pages/dashboard/owner/business_owner_state.dart';
import 'package:bego/pages/dashboard/owner/business_owner_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class BusinessOwnerPage
    extends BePage<BusinessOwnerState, BusinessOwnerController> {
  BusinessOwnerPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<BusinessOwnerController>(
          successBuilder:
              (
                final BuildContext context,
                final BusinessOwnerController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Manage: ${controller.state.businessId}'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.inventory),
                            title: const Text('Catalog Management'),
                            subtitle: const Text('View and manage items'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: controller.viewCatalog,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.add_circle),
                            title: const Text('Add New Item'),
                            subtitle: const Text('Create a new item'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: controller.addItem,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.edit),
                            title: const Text('Edit Business'),
                            subtitle: const Text('Update business info'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: controller.editBusiness,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.announcement),
                            title: const Text('Announcements'),
                            subtitle: const Text('Manage announcements'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: controller.viewAnnouncements,
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
                final BusinessOwnerController state,
              ) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

import 'package:bego/pages/discover/business/business_view_state.dart';
import 'package:bego/pages/discover/business/business_view_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class BusinessViewPage
    extends BePage<BusinessViewState, BusinessViewController> {
  BusinessViewPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<BusinessViewController>(
          successBuilder:
              (
                final BuildContext context,
                final BusinessViewController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Business: ${controller.state.businessId}'),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: controller.goBack,
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: controller.state.services.length,
                      itemBuilder: (final context, final index) {
                        final service = controller.state.services[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: const Icon(Icons.card_giftcard),
                            title: Text(service),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () => controller.selectItem(service),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final BusinessViewController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

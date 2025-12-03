import 'package:bego/pages/dashboard/owner/edit_business/edit_business_state.dart';
import 'package:bego/pages/dashboard/owner/edit_business/edit_business_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class EditBusinessPage
    extends BePage<EditBusinessState, EditBusinessController> {
  EditBusinessPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<EditBusinessController>(
          successBuilder:
              (
                final BuildContext context,
                final EditBusinessController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Edit Business'),
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
                          'Business Name: ${controller.state.businessName}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Business Name',
                            border: OutlineInputBorder(),
                          ),
                          controller: TextEditingController(
                            text: controller.state.businessName,
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
                            text: controller.state.businessDescription,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.saveBusiness,
                            child: const Text('Save Changes'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final EditBusinessController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

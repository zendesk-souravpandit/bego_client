import 'package:bego/pages/dashboard/owner/announcements/announcements_state.dart';
import 'package:bego/pages/dashboard/owner/announcements/announcements_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class AnnouncementsPage
    extends BePage<AnnouncementsState, AnnouncementsController> {
  AnnouncementsPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<AnnouncementsController>(
          successBuilder:
              (
                final BuildContext context,
                final AnnouncementsController controller,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Announcements'),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: controller.goBack,
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: controller.createAnnouncement,
                      ),
                    ],
                  ),
                  body: controller.state.announcements.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.announcement_outlined,
                                size: 80,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'No announcements yet',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.state.announcements.length,
                          itemBuilder: (final context, final index) {
                            final announcement =
                                controller.state.announcements[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.notification_important,
                                ),
                                title: Text(announcement),
                                trailing: const Icon(Icons.arrow_forward),
                              ),
                            );
                          },
                        ),
                );
              },
          customBuilder:
              (
                final BuildContext context,
                final AnnouncementsController state,
              ) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

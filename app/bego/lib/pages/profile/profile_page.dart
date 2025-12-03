import 'package:bego/constants/strings.dart';
import 'package:bego/pages/profile/profile_state.dart';
import 'package:bego/pages/profile/profile_controller.dart';
import 'package:becomponent/page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends BePage<ProfileState, ProfileController> {
  ProfilePage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<ProfileController>(
          successBuilder:
              (final BuildContext context, final ProfileController controller) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(AppStrings.profile),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: controller.goBack,
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Profile header
                        Container(
                          width: double.infinity,
                          color: Colors.blue[100],
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                child: Icon(Icons.person, size: 50),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                controller.state.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Profile info
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        AppStrings.contactInformation,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.email,
                                            color: Colors.blue,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(controller.state.email),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                            color: Colors.blue,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(controller.state.phone),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Edit profile button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: controller.editProfile,
                                  icon: const Icon(Icons.edit),
                                  label: const Text(AppStrings.editProfileBtn),
                                ),
                              ),
                              const SizedBox(height: 24),
                              // Order history
                              const Text(
                                AppStrings.orderHistory,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.state.orderHistory.length,
                                itemBuilder: (final context, final index) {
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      title: Text(
                                        controller.state.orderHistory[index],
                                      ),
                                      leading: const Icon(Icons.shopping_bag),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 24),
                              // Logout button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: controller.state.isLoading
                                      ? null
                                      : controller.logout,
                                  icon: controller.state.isLoading
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  Colors.white,
                                                ),
                                          ),
                                        )
                                      : const Icon(Icons.logout),
                                  label: const Text(AppStrings.logout),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              if (controller.state.errorMessage != null)
                                Container(
                                  margin: const EdgeInsets.only(top: 16),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    controller.state.errorMessage!,
                                    style: TextStyle(
                                      color: Colors.red.shade900,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
          customBuilder:
              (final BuildContext context, final ProfileController state) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
        ),
      );
}

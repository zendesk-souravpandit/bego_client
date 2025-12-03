import 'package:bego/pages/home/home_state.dart';
import 'package:bego/pages/home/home_controller.dart';
import 'package:bego/pages/home/components/components.dart';
import 'package:becomponent/page.dart';
import 'package:beui/decoration.dart';
import 'package:flutter/material.dart';

class HomePage extends BePage<HomeState, HomeController> {
  HomePage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<HomeController>(
          successBuilder:
              (final BuildContext context, final HomeController controller) {
                final screenWidth = MediaQuery.of(context).size.width;
                final isMobile = screenWidth < 768;

                return Scaffold(
                  appBar: CustomAppBar(
                    title: 'My Properties',
                    userName: 'Courtney Henry',
                    userRole: 'Property Manager',
                    userImage:
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
                    notificationCount: 1,
                    onMenuTap: () => Scaffold.of(context).openDrawer(),
                    onNotificationTap: () {},
                    onProfileTap: controller.goToProfile,
                    onCartTap: controller.goToCart,
                  ),
                  drawer: AppNavigationDrawer(
                    userName: 'Courtney Henry',
                    userRole: 'Property Manager',
                    userImage:
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
                    items: [
                      DrawerItem(
                        icon: Icons.home,
                        label: 'My Properties',
                        onTap: () {},
                      ),
                      DrawerItem(
                        icon: Icons.people,
                        label: 'Tenants',
                        onTap: () {},
                      ),
                      DrawerItem(
                        icon: Icons.assignment,
                        label: 'Requests',
                        onTap: () {},
                      ),
                      DrawerItem(
                        icon: Icons.calendar_today,
                        label: 'Calendar',
                        onTap: () {},
                      ),
                      DrawerItem(
                        icon: Icons.description,
                        label: 'Documents',
                        onTap: () {},
                      ),
                      DrawerItem(
                        icon: Icons.settings,
                        label: 'Settings',
                        onTap: () {},
                      ),
                    ],
                    selectedIndex: 0,
                    onItemTap: (index) {},
                  ),
                  body: Container(
                    color: const Color(0xFFF9FBFE),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: isMobile
                            ? _buildMobileLayout(context, controller)
                            : _buildDesktopLayout(context, controller),
                      ),
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

  static Widget _buildMobileLayout(
    BuildContext context,
    HomeController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PropertyHeader(
          title: 'Salama Property, Thornridge Cir.',
          address: 'Syracuse, Connecticut 3564',
          imageUrl:
              'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=800',
          onMapTap: () {},
        ),
        const SizedBox(height: 24),
        PropertyStats(
          propertyCount: 32,
          tenantCount: 10,
          requestCount: 8,
          onCalendarTap: () {},
        ),
        const SizedBox(height: 24),
        PropertyRoomCard(roomName: '1th Floor, Left, Room 1', onEditTap: () {}),
        const SizedBox(height: 16),
        PropertySpecs(livingSpace: '124', rooms: 4),
        const SizedBox(height: 24),
        EquipmentTags(
          amenities: [
            'Guest toilet',
            'Suitable for flat sharing',
            'Fitted kitchen',
            'Stepless access',
            'Gardensharing',
          ],
        ),
        const SizedBox(height: 24),
        PropertyGallery(
          imageUrls: [
            'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=500',
            'https://images.unsplash.com/photo-1494145904049-0dca59b4d756?w=500',
            'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=500',
            'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=500',
          ],
          height: 120,
        ),
        const SizedBox(height: 24),
        Text(
          'Tenant Information',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TenantCard(
          name: 'Janie Williamson',
          role: 'Tenants',
          imageUrl:
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
          placementDate: '6 August 2021',
          contact: '(907) 555-0101',
          pricePerMonth: '\$293.01',
          onMessagesTap: () {},
        ),
        const SizedBox(height: 24),
        Text(
          'Documents',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        DocumentItem(
          title: 'Contract Document',
          size: '9MB',
          fileType: 'PDF',
          icon: Icons.picture_as_pdf,
          onDownloadTap: () {},
        ),
        const SizedBox(height: 12),
        DocumentItem(
          title: 'Receipts',
          size: '4.5MB',
          fileType: 'PDF',
          icon: Icons.picture_as_pdf,
          onDownloadTap: () {},
        ),
        const SizedBox(height: 12),
        DocumentItem(
          title: 'Transactions History',
          size: '12MB',
          fileType: 'XLS',
          icon: Icons.table_chart,
          onDownloadTap: () {},
        ),
      ],
    );
  }

  static Widget _buildDesktopLayout(
    BuildContext context,
    HomeController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PropertyHeader - Full width with white card
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                offset: const Offset(0, 0),
                blurRadius: 8,
                spreadRadius: 8,
              ),
            ],
          ),
          child: PropertyHeader(
            title: 'Salama Property, Thornridge Cir.',
            address: 'Syracuse, Connecticut 3564',
            imageUrl:
                'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=800',
            onMapTap: () {},
          ),
        ),

        // PropertyStats - Full width
        const SizedBox(height: 24),
        // Two column row: Left content + Right sidebar
        Container(
          padding: EdgeInsets.all(16),
          decoration: BeBoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BeBoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                offset: const Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left column - Main content
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PropertyRoomCard(
                      roomName: '1th Floor, Left, Room 1',
                      onEditTap: () {},
                    ),
                    const SizedBox(height: 16),
                    PropertySpecs(livingSpace: '124', rooms: 4),
                    const SizedBox(height: 24),
                    EquipmentTags(
                      amenities: [
                        'Guest toilet',
                        'Suitable for flat sharing',
                        'Fitted kitchen',
                        'Stepless access',
                        'Gardensharing',
                      ],
                    ),
                    const SizedBox(height: 24),
                    PropertyGallery(
                      imageUrls: [
                        'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=500',
                        'https://images.unsplash.com/photo-1494145904049-0dca59b4d756?w=500',
                        'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=500',
                        'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=500',
                      ],
                      height: 140,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Right column - Sidebar with TenantCard and Documents
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TenantCard(
                      name: 'Janie Williamson',
                      role: 'Tenants',
                      imageUrl:
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
                      placementDate: '6 August 2021',
                      contact: '(907) 555-0101',
                      pricePerMonth: '\$293.01',
                      onMessagesTap: () {},
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Documents',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    DocumentItem(
                      title: 'Contract Document',
                      size: '9MB',
                      fileType: 'PDF',
                      icon: Icons.picture_as_pdf,
                      onDownloadTap: () {},
                    ),
                    const SizedBox(height: 12),
                    DocumentItem(
                      title: 'Receipts',
                      size: '4.5MB',
                      fileType: 'PDF',
                      icon: Icons.picture_as_pdf,
                      onDownloadTap: () {},
                    ),
                    const SizedBox(height: 12),
                    DocumentItem(
                      title: 'Transactions History',
                      size: '12MB',
                      fileType: 'XLS',
                      icon: Icons.table_chart,
                      onDownloadTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

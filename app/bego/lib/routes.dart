import 'package:bego/navigation/drawer_navigator.dart';
import 'package:bego/pages/auth/auth_middleware.dart';
import 'package:bego/pages/auth/login/login_binding.dart';
import 'package:bego/pages/auth/login/login_page.dart';
import 'package:bego/pages/auth/signup/signup_binding.dart';
import 'package:bego/pages/auth/signup/signup_page.dart';
import 'package:bego/pages/cart/cart_binding.dart';
import 'package:bego/pages/cart/cart_page.dart';
import 'package:bego/pages/discover/discover_binding.dart';
import 'package:bego/pages/discover/discover_page.dart';
import 'package:bego/pages/discover/tenant/tenant_view_binding.dart';
import 'package:bego/pages/discover/tenant/tenant_view_page.dart';
import 'package:bego/pages/discover/business/business_view_binding.dart';
import 'package:bego/pages/discover/business/business_view_page.dart';
import 'package:bego/pages/discover/business/item_view/business_item_view_binding.dart';
import 'package:bego/pages/discover/business/item_view/business_item_view_page.dart';
import 'package:bego/pages/dashboard/dashboard_binding.dart';
import 'package:bego/pages/dashboard/dashboard_page.dart';
import 'package:bego/pages/dashboard/owner/business_owner_binding.dart';
import 'package:bego/pages/dashboard/owner/business_owner_page.dart';
import 'package:bego/pages/dashboard/owner/catalog_list/catalog_list_binding.dart';
import 'package:bego/pages/dashboard/owner/catalog_list/catalog_list_page.dart';
import 'package:bego/pages/dashboard/owner/edit_business/edit_business_binding.dart';
import 'package:bego/pages/dashboard/owner/edit_business/edit_business_page.dart';
import 'package:bego/pages/dashboard/owner/add_item/add_item_binding.dart';
import 'package:bego/pages/dashboard/owner/add_item/add_item_page.dart';
import 'package:bego/pages/dashboard/owner/edit_item/edit_item_binding.dart';
import 'package:bego/pages/dashboard/owner/edit_item/edit_item_page.dart';
import 'package:bego/pages/dashboard/owner/announcements/announcements_binding.dart';
import 'package:bego/pages/dashboard/owner/announcements/announcements_page.dart';
import 'package:bego/pages/home/home_binding.dart';
import 'package:bego/pages/home/home_page.dart';
import 'package:bego/pages/onboarding/onboarding_binding.dart';
import 'package:bego/pages/onboarding/onboarding_page.dart';
import 'package:bego/pages/profile/profile_binding.dart';
import 'package:bego/pages/profile/profile_page.dart';
import 'package:becomponent/app.dart';
import 'package:becore/getx.dart';
import 'package:bego/panel/my_side_panel.dart';
import 'package:flutter/material.dart';

class BegoAppDelegate extends BeAppRouteDelegate {
  // @override
  // RouteInformation get initialRouteInfo =>
  //     RouteInformation(uri: Uri.parse('/login'));

  @override
  String get mainInitRoutePath => '/home';

  @override
  final List<GetPage<dynamic>> routes = [
    // Auth routes
    GetPage(name: '/login', page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
      name: '/signup',
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: '/onboarding',
      page: () => OnboardingPage(),
      binding: OnboardingBinding(),
    ),
  ];

  @override
  List<GetMiddleware> mainMiddlewares = [AuthMiddleware()];

  @override
  List<BeMainPage<dynamic>> get mainRoutes => [
    // Discover - Customer facing discovery page
    BeMainPage(
      name: '/home',
      page: HomePage.new,
      title: 'Home',
      binding: HomeBinding(),
    ),
    BeMainPage(
      name: '/discover',
      page: DiscoverPage.new,
      title: 'Discover',
      binding: DiscoverBinding(),
      children: [
        // Tenant level businesses
        BeMainPage(
          name: '/:tenantId',
          page: TenantViewPage.new,
          title: 'Tenant Businesses',
          binding: TenantViewBinding(),
        ),
        // Business list in tenant
        BeMainPage(
          name: '/:tenantId/:businessId',
          page: BusinessViewPage.new,
          title: 'Business Detail',
          binding: BusinessViewBinding(),
        ),
        // Business detail with view
        BeMainPage(
          name: '/:tenantId/:businessId/view',
          page: BusinessViewPage.new,
          title: 'Business View',
          binding: BusinessViewBinding(),
        ),
        BeMainPage(
          name: '/:tenantId/:businessId/item/:itemId/view',
          page: BusinessItemViewPage.new,
          title: 'Business Item View',
          binding: BusinessItemViewBinding(),
        ),
      ],
    ),

    // Dashboard - Business owner management
    BeMainPage(
      name: '/dashboard/:tenantId',
      page: DashboardPage.new,
      title: 'Dashboard',
      binding: DashboardBinding(),

      children: [
        // Business owner section
        BeMainPage(
          name: '/:businessId/owner',
          page: BusinessOwnerPage.new,
          title: 'Business Owner',
          binding: BusinessOwnerBinding(),
          children: [
            // Catalog list
            BeMainPage(
              name: '/features/catalog',
              page: CatalogListPage.new,
              title: 'Catalog List',
              binding: CatalogListBinding(),
            ),
            // Edit business
            BeMainPage(
              name: '/edit',
              page: EditBusinessPage.new,
              title: 'Edit Business',
              binding: EditBusinessBinding(),
            ),
            // Add item
            BeMainPage(
              name: '/item/add',
              page: AddItemPage.new,
              title: 'Add Item',
              binding: AddItemBinding(),
            ),
            // Edit item
            BeMainPage(
              name: '/item/edit/:itemId',
              page: EditItemPage.new,
              title: 'Edit Item',
              binding: EditItemBinding(),
            ),
            // Announcements
            BeMainPage(
              name: '/announcements',
              page: AnnouncementsPage.new,
              title: 'Announcements',
              binding: AnnouncementsBinding(),
            ),
          ],
        ),
      ],
    ),

    // Cart
    BeMainPage(
      name: '/cart',
      page: CartPage.new,
      title: 'Cart',
      binding: CartBinding(),
    ),

    // Profile - User profile page
    BeMainPage(
      name: '/profile',
      page: ProfilePage.new,
      title: 'Profile',
      binding: ProfileBinding(),
    ),
  ];

  @override
  RouteFactory? get drawerRouteFactory => (final RouteSettings settings) {
    return MaterialPageRoute<void>(
      builder: (final BuildContext context) {
        return const MainDrawerNavigator();
      },
    );
  };

  @override
  RouteFactory? get sidePanelRouteFactory => (final RouteSettings settings) {
    // You can customize side panel routes based on settings.name
    return MaterialPageRoute<void>(
      builder: (final BuildContext context) {
        return const MySidePanel(); // Placeholder for side panel content
      },
    );
  };

  // @override
  // RouteFactory? get appBarRouteFactory => (final RouteSettings settings) {
  //   return MaterialPageRoute<void>(
  //     builder: (final BuildContext context) {
  //       return AppBar(
  //         automaticallyImplyLeading: false,
  //         elevation: 1,
  //         title: const Text('Bego - Service Marketplace'),
  //         actions: [
  //           ElevatedButton(onPressed: () {}, child: const Text('Button')),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: IconButton(
  //               icon: const Icon(Icons.notifications),
  //               tooltip: 'Notifications',
  //               onPressed: () {},
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: IconButton(
  //               icon: const Icon(Icons.search),
  //               tooltip: 'Search',
  //               onPressed: () {},
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // };
}

import 'package:bego/pages/auth/auth_middleware.dart';
import 'package:bego/pages/auth/login/login_binding.dart';
import 'package:bego/pages/auth/login/login_page.dart';
import 'package:bego/pages/auth/signup/signup_binding.dart';
import 'package:bego/pages/auth/signup/signup_page.dart';
import 'package:bego/pages/cart/cart_binding.dart';
import 'package:bego/pages/cart/cart_page.dart';
import 'package:bego/pages/categories/categories_binding.dart';
import 'package:bego/pages/categories/categories_page.dart';
import 'package:bego/pages/home/home_binding.dart';
import 'package:bego/pages/home/home_page.dart';
import 'package:bego/pages/onboarding/onboarding_binding.dart';
import 'package:bego/pages/onboarding/onboarding_page.dart';
import 'package:bego/pages/profile/profile_binding.dart';
import 'package:bego/pages/profile/profile_page.dart';
import 'package:becomponent/app.dart';
import 'package:becomponent/services.dart';
import 'package:becore/getx.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initBeApp(package: 'bego.app', routerDelegate: BegoAppDelegate());
  runApp(const BeApp());
}

class BegoAppDelegate extends BeAppRouteDelegate {
  // @override
  // RouteInformation get initialRouteInfo =>
  //     RouteInformation(uri: Uri.parse('/login'));

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
    // Home - Main dashboard
    BeMainPage(
      name: '/home',
      page: HomePage.new,
      title: 'Home',
      binding: HomeBinding(),
    ),

    // Browse categories with nested routes for specific categories
    BeMainPage(
      name: '/products',
      page: () => CategoriesPage(category: 'Decoration'),
      title: 'Browse',
      binding: CategoriesBinding(),
      children: [
        BeMainPage(
          name: '/:categoryId',
          page: () => CategoriesPage(category: 'Decoration'),
          title: 'Category Details',
          binding: CategoriesBinding(),
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
        return _DrawerMenu();
      },
    );
  };

  @override
  RouteFactory? get sidePanelRouteFactory => null;

  @override
  RouteFactory? get appBarRouteFactory => (final RouteSettings settings) {
    return MaterialPageRoute<void>(
      builder: (final BuildContext context) {
        return AppBar(
          backgroundColor: BeColors.blue,
          automaticallyImplyLeading: false,
          elevation: 1,
          title: const Text('Bego - Service Marketplace'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.notifications),
                tooltip: 'Notifications',
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () {},
              ),
            ),
          ],
        );
      },
    );
  };
}

class _DrawerMenu extends StatelessWidget {
  const _DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: const BoxDecoration(color: BeColors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Bego',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Service Marketplace',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          // Menu Items
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Get.toNamed('/app/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Browse Services'),
            onTap: () {
              Get.toNamed('/app/products');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Get.toNamed('/app/cart');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Get.toNamed('/app/profile');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Get.toNamed('/login');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

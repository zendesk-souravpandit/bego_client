import 'package:bego/pages/auth/login/login_controller.dart';
import 'package:bego/pages/auth/login/login_page.dart';
import 'package:bego/pages/auth/signup/signup_controller.dart';
import 'package:bego/pages/auth/signup/signup_page.dart';
import 'package:bego/pages/cart/cart_controller.dart';
import 'package:bego/pages/cart/cart_page.dart';
import 'package:bego/pages/categories/categories_page.dart';
import 'package:bego/pages/home/home_controller.dart';
import 'package:bego/pages/home/home_page.dart';
import 'package:bego/pages/onboarding/onboarding_controller.dart';
import 'package:bego/pages/onboarding/onboarding_page.dart';
import 'package:bego/pages/profile/profile_controller.dart';
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
  @override
  final List<GetPage<dynamic>> routes = [
    // Auth routes
    GetPage(name: '/login', page: () => LoginPage(), binding: _LoginBinding()),
    GetPage(
      name: '/signup',
      page: () => SignupPage(),
      binding: _SignupBinding(),
    ),
    GetPage(
      name: '/onboarding',
      page: () => OnboardingPage(),
      binding: _OnboardingBinding(),
    ),
  ];

  @override
  List<GetMiddleware> mainMiddlewares = [_AuthMiddleware()];

  @override
  List<BeMainPage<dynamic>> get mainRoutes => [
    // Home - Main dashboard
    BeMainPage(
      name: '/home',
      page: HomePage.new,
      title: 'Home',
      binding: _HomeBinding(),
    ),

    // Browse categories
    BeMainPage(
      name: '/browse',
      page: () => CategoriesPage(category: 'Decoration'),
      title: 'Browse',
      binding: _BrowseBinding(),
    ),

    // Cart
    BeMainPage(
      name: '/cart',
      page: CartPage.new,
      title: 'Cart',
      binding: _CartBinding(),
    ),

    // Profile - User profile page
    BeMainPage(
      name: '/profile',
      page: ProfilePage.new,
      title: 'Profile',
      binding: _ProfileBinding(),
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

class _AuthMiddleware extends GetMiddleware {
  _AuthMiddleware();

  bool isLoggedIn = true; // Replace with actual login check logic

  @override
  RouteDecoder redirectDelegate(final RouteDecoder? route) {
    if (!isLoggedIn &&
        route?.route?.name != '/login' &&
        route?.route?.name != '/signup') {
      return RouteDecoder.fromRoute('/login');
    }
    return RouteDecoder.fromRoute(route?.route?.name ?? '/home');
  }
}

// Bindings
class _HomeBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<HomeController>(HomeController.new),
  ];
}

class _BrowseBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [];
}

class _OnboardingBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<OnboardingController>(OnboardingController.new),
  ];
}

class _LoginBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<LoginController>(LoginController.new),
  ];
}

class _SignupBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<SignupController>(SignupController.new),
  ];
}

class _CartBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<CartController>(CartController.new),
  ];
}

class _ProfileBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<ProfileController>(ProfileController.new),
  ];
}

// Drawer Menu Widget
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
              Get.toNamed('/home');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Browse Services'),
            onTap: () {
              Get.toNamed('/browse');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Get.toNamed('/cart');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Get.toNamed('/profile');
              Navigator.pop(context);
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

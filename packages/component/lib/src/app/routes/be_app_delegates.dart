import 'package:becomponent/app.dart';
import 'package:becomponent/src/app/routes/be_get_delegates.dart';
import 'package:becomponent/src/page/components/unknown_widget.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

class BeAppDelegate extends BeRouteDelegate {
  @override
  final List<GetPage<dynamic>> routes = [
    GetPage(
      preventDuplicates: true,
      participatesInRootNavigator: true,
      name: '/app',
      page: () => const BeAppPage(),
      middlewares: [AuthMiddleware()],
      unknownRoute: GetPage(name: '/', page: () => const UnknownWidget()),
      title: null,
      children: [
        GetPage(
          name: '/home',
          page: () => const DashboardView(),
          participatesInRootNavigator: false,
          bindings: [
            // Add DashboardBinding() here
          ],
          unknownRoute: GetPage(name: '/', page: () => const UnknownWidget()),
        ),
        GetPage(
          middlewares: [
            // Only enter when authenticated
            // EnsureAuthMiddleware(),
          ],
          name: '/profile',
          page: () => const ProfileView(),
          title: 'Profile',
          transition: Transition.size,
          participatesInRootNavigator: false,
          bindings: [
            // Add ProfileBinding() here
          ],
        ),

        GetPage(
          name: '/products',
          page: () => const ProductsView(),
          title: 'Products',
          transition: Transition.cupertino,
          showCupertinoParallax: true,
          participatesInRootNavigator: false,
          bindings: [
            // Add ProductsBinding(), ProductDetailsBinding()
          ],
          children: [
            GetPage(
              name: '/:productId',
              transition: Transition.cupertino,
              showCupertinoParallax: true,
              participatesInRootNavigator: false,
              page: () => const ProductDetailsView(),
              bindings: const [
                // Add ProductDetailsBinding()
              ],
              middlewares: [
                // Only enter when authenticated
                // EnsureAuthMiddleware(),
              ],
            ),
          ],
        ),
        // GetPage(
        //   name: '/products/:productId',
        //   transition: Transition.cupertino,
        //   showCupertinoParallax: true,
        //   page: () => const ProductDetailsView(),
        //   bindings: const [
        //     // Add ProductDetailsBinding()
        //   ],
        //   middlewares: [
        //     // Only enter when authenticated
        //     // EnsureAuthMiddleware(),
        //   ],
        // ),
      ],
    ),
    GetPage(
      name: '/settings',
      page: () => const SettingsView(),
      participatesInRootNavigator: true,
      bindings: [
        // Add SettingsBinding() here
      ],
    ),
    GetPage(
      middlewares: [
        // Only enter when not authenticated
        // EnsureNotAuthedMiddleware(),
      ],
      name: '/login',
      page: () => const LoginView(),
      bindings: [
        // Add LoginBinding()
      ],
    ),
  ];

  /// Optional navigator observers.
  @override
  List<NavigatorObserver> get navigatorObservers => [];

  /// Pick pages for the root navigator based on a single RouteDecoder.
  /// Default implementation: returns all pages from the current branch that participate in root navigator.
  @override
  Iterable<GetPage<dynamic>> pickPagesForRootNavigator(final RouteDecoder decoder) {
    final pages = <GetPage<dynamic>>[];
    final activeBranch = decoder.currentTreeBranch;
    for (final page in activeBranch) {
      // Add page if it participates in root navigator and not already added
      if ((page.participatesInRootNavigator ?? true) && !pages.contains(page)) {
        pages.add(page);
      }
    }
    return pages;
  }

  // final delegateNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'BeAppDelegateNavigator');

  /// Builds the GetDelegate with configured routes, observers, and filtering.
  @override
  GetDelegate createDelegate() {
    return GetDelegate(
      pages: routes,
      // navigatorObservers: navigatorObservers,
      // pickPagesForRootNavigator: pickPagesForRootNavigator,
      // backButtonPopMode: PopMode.history,
      // preventDuplicateHandlingMode: PreventDuplicateHandlingMode.recreate,
      // navigatorKey: delegateNavigatorKey,
    );
  }
}

// Home view matches '/home' route
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Welcome to the Home Page')),
    );
  }
}

// Dashboard view matches '/home/dashboard'
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: const Center(child: Text('Dashboard Content')),
    );
  }
}

// Profile view matches '/home/profile'

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('ProfileView is working', style: TextStyle(fontSize: 20)),
            const Hero(tag: 'heroLogo', child: FlutterLogo()),
            MaterialButton(
              child: const Text('Show a test dialog'),
              onPressed: () {
                //shows a dialog
                Get.defaultDialog<void>(title: 'Test Dialog !!', barrierDismissible: true);
              },
            ),
            MaterialButton(
              child: const Text('Show a test dialog in Home router outlet'),
              onPressed: () {
                //shows a dialog
                Get.defaultDialog<void>(
                  title: 'Test Dialog In Home Outlet !!',
                  barrierDismissible: true,
                  id: '/app',
                  // navigatorKey: Get.nestedKey(Routes.HOME),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  // Example product IDs
  final List<String> productIds = const ['1001', '1002', '1003', '1004'];

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.builder(
        itemCount: productIds.length,
        itemBuilder: (final context, final index) {
          final id = productIds[index];
          return ListTile(
            title: Text('Product $id'),
            onTap: () {
              // print('Selected product ID: $id');
              // Navigate to product details page with the selected productId
              // Get.toNamed<void>('/app/products/$id', id: '/app');
              Get.toNamed<void>('/app/products/$id');
            },
          );
        },
      ),
    );
  }
}

// Product details view matches '/home/products/:productId'
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(final BuildContext context) {
    // Retrieve productId param from route if needed:
    final productId = Get.parameters['productId'];
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Center(child: Text('Details for product: $productId')),
    );
  }
}

// Settings view matches '/settings'
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Page')),
    );
  }
}

// Login view matches '/login'
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            // Add login action here
            Get.back<void>();
          },
        ),
      ),
    );
  }
}

class AuthMiddleware extends GetMiddleware {
  AuthMiddleware();

  // @override
  // RouteDecoder redirectDelegate(final RouteDecoder? route) {
  //   print(route?.route?.name);
  //   if (route?.route?.name != '/dashboard') {
  //     return RouteDecoder.fromRoute('/profile');
  //   }
  //   print(route);
  //   return RouteDecoder.fromRoute(route?.route?.name ?? '/not-found');
  // }

  @override
  Widget onPageBuilt(final Widget page) {
    final widget = super.onPageBuilt(page);
    // final controller = Get.find<BeAppController>();
    final userId = Get.parameters['user_id'];
    final tenantId = Get.parameters['tenant_id'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: widget),
        Wrap(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Go to Profile')),
            ElevatedButton(
              onPressed: () {
                // controller.navigatorMainKey.currentState?.pushNamed('/not-found');
                Get.back<void>();
              },
              child: const Text('Close Get.Back'),
            ),
          ],
        ),
        Text('User ID: $userId, Tenant ID: $tenantId'),
      ],
    );
  }
}

import 'package:bego/navigation/drawer_navigator.dart';
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
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

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
      name: '/category',
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
        return const MainDrawerNavigator();
      },
    );
  };

  @override
  RouteFactory? get sidePanelRouteFactory => null;

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

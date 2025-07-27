// ignore_for_file: library_private_types_in_public_api

import 'package:becomponent/app.dart';
import 'package:becomponent/services.dart';
import 'package:becore/getx.dart';
import 'package:beui/mulitchild.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:playground/use_case_item_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initBeApp(package: 'demo.app', routerDelegate: BeAppDelegate());
  runApp(const BeApp());
}

class BeAppDelegate extends BeAppRouteDelegate {
  // @override
  // RouteInformation get initialRouteInfo => RouteInformation(uri: Uri.parse('/login'));
  @override
  final List<GetPage<dynamic>> routes = [
    GetPage(name: '/settings', page: () => const SettingsView()),
    GetPage(name: '/login', page: () => const LoginView()),
  ];

  @override
  List<GetMiddleware> mainMiddlewares = [AuthMiddleware()];

  @override
  List<BeMainPage<dynamic>> get mainRoutes => [
    BeMainPage(name: '/home', page: DropdownExample.new),
    BeMainPage(name: '/profile', page: () => const ProfileView(), title: 'Profile', transition: Transition.size),
    BeMainPage(
      name: '/products',
      page: () => const ProductsView(),
      children: [
        BeMainPage(
          name: '/:productId',
          transition: Transition.cupertino,
          showCupertinoParallax: true,
          page: () => const ProductDetailsView(),
        ),
      ],
    ),
  ];

  @override
  RouteFactory? get drawerRouteFactory => (final RouteSettings settings) {
    if (settings.name == '/custom-drawer') {
      return MaterialPageRoute<void>(
        builder: (final BuildContext context) {
          return RouteListPage();
        },
      );
    }

    return MaterialPageRoute<void>(
      builder: (final BuildContext context) {
        return const Text('Drawer Panel');
      },
    );
  };

  @override
  RouteFactory? get sidePanelRouteFactory => (final RouteSettings settings) {
    return MaterialPageRoute<void>(
      builder: (final BuildContext context) {
        return const Text('Right Side Panel');
      },
    );
  };

  @override
  RouteFactory? get appBarRouteFactory => (final RouteSettings settings) {
    return MaterialPageRoute<void>(
      builder: (final BuildContext context) {
        return AppBar(
          backgroundColor: BeColors.yellow,
          automaticallyImplyLeading: true,
          leadingWidth: 0,
          actionsPadding: EdgeInsets.zero,
          leading: const SizedBox.shrink(),
          elevation: 1,
          title: const Text('App Bar'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BeBadge(rounded: true, child: const Icon(Icons.notifications)),
            ),
          ],
        );
      },
    );
  };
}

class AuthMiddleware extends GetMiddleware {
  AuthMiddleware();

  bool isLoggedIn = true; // Replace with actual login check logic
  @override
  RouteDecoder redirectDelegate(final RouteDecoder? route) {
    if (!isLoggedIn) {
      return RouteDecoder.fromRoute('/login');
    }
    return RouteDecoder.fromRoute(route?.route?.name ?? '/not-found');
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
      body: ListView(
        children: [
          const Text('Dashboard View is working', style: TextStyle(fontSize: 20)),
          // const GoogleLogoWidget(size: 32),
          const SizedBox(height: 20),
          const Center(child: Text('Dashboard Content')),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.find<BeAppController>().pushDrawerWidget<void>(const Text('New Drawer Page'));
              // Get.find<BeAppController>().pushAppBar<void>(const Text('New AppBar Page'));
            },
            child: const Text('Change App Button'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<BeAppController>().popAppBar<void>();
            },
            child: const Text('Pop AppBar Page'),
          ),

          ElevatedButton(
            onPressed: () {
              Get.find<BeAppController>().pushDrawer<void>('/custom-drawer');
              // Get.find<BeAppController>().pushDrawer<void>(const Text('New Drawer Page'));
              // Get.find<BeAppController>().pushDrawer<void>(const Text('New Drawer Page'));
            },
            child: const Text('Change Drawer Button'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<BeAppController>().popDrawer<void>(routeNameUntil: '/');
            },
            child: const Text('Pop Drawer Page'),
          ),
          ElevatedButton(
            onPressed: () {
              // Get.find<BeAppController>().pushRightPanel<void>(const Text('New Right Panel Page'));
            },
            child: const Text('Change Right Panel Button'),
          ),
          ElevatedButton(
            onPressed: () {
              // Get.find<BeAppController>().popRightPanel<void>();
              // Get.find<BeAppController>().panelOrder.value = [PanelType.drawer, PanelType.right, PanelType.main];
              Get.find<BeAppController>().movePanel(BePanelType.side, 1);
            },
            child: const Text('Pop Right Panel Page'),
          ),
        ],
      ),
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
    return Scaffold(appBar: AppBar(title: const Text('Settings')), body: const Center(child: Text('Settings Page')));
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
            // Get.back<void>();
            Get.toNamed<void>('/app'); // Navigate to the main app route
          },
        ),
      ),
    );
  }
}

class RouteListPage extends StatelessWidget {
  RouteListPage({super.key});

  final List<_RouteItem> routeItems = [
    _RouteItem(label: 'Dashboard', route: '/app'),
    _RouteItem(label: 'Profile', route: '/app/profile'),
    _RouteItem(label: 'Products', route: '/app/products'),
    _RouteItem(label: 'Products1', route: '/app/products/123'),
    _RouteItem(label: 'Settings', route: '/settings'),
    _RouteItem(label: 'Login', route: '/login'),
  ];

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route List')),
      body: ListView.builder(
        itemCount: routeItems.length,
        itemBuilder: (final context, final index) {
          final item = routeItems[index];
          return ListTile(
            title: Text(item.label),
            onTap: () {
              Get.toNamed<void>(item.route);
            },
          );
        },
      ),
    );
  }
}

class _RouteItem {
  _RouteItem({required this.label, required this.route});
  final String label;
  final String route;
}

// class ResizablePanelsScaffold extends StatefulWidget {
//   const ResizablePanelsScaffold({super.key});

//   @override
//   State<ResizablePanelsScaffold> createState() => _ResizablePanelsScaffoldState();
// }

// class _ResizablePanelsScaffoldState extends State<ResizablePanelsScaffold> {
//   double leftPanelWidth = 250.0;
//   double rightPanelWidth = 250.0;

//   bool isDraggingLeft = false;
//   bool isDraggingRight = false;

//   @override
//   Widget build(final BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final bool isMobile = screenWidth < 600;
//     final bool isDesktop = screenWidth >= 1024;

//     return Scaffold(
//       appBar: AppBar(title: const Text('Resizable Left and Right Panels')),
//       drawer:
//           isMobile
//               ? Drawer(child: Container(color: Colors.blue[100], child: const Center(child: Text('Left Drawer Panel'))))
//               : null,
//       body: Row(
//         children: [
//           // Left Panel or Drawer
//           if (!isMobile)
//             SizedBox(
//               width: leftPanelWidth,
//               child: Container(color: Colors.blue[100], child: const Center(child: Text('Left Drawer Panel'))),
//             ),

//           // Left draggable divider
//           if (!isMobile)
//             GestureDetector(
//               behavior: HitTestBehavior.translucent,
//               onHorizontalDragStart: (_) {
//                 setState(() {
//                   isDraggingLeft = true;
//                 });
//               },
//               onHorizontalDragUpdate: (final details) {
//                 setState(() {
//                   leftPanelWidth += details.delta.dx;
//                   leftPanelWidth = leftPanelWidth.clamp(100.0, 400.0);
//                 });
//               },
//               onHorizontalDragEnd: (_) {
//                 setState(() {
//                   isDraggingLeft = false;
//                 });
//               },
//               child: MouseRegion(
//                 cursor: SystemMouseCursors.resizeColumn,
//                 child: Container(
//                   width: 8,
//                   color: isDraggingLeft ? Colors.blue.withOpacity(0.5) : Colors.transparent,
//                   child: Center(child: Container(width: 2, height: 40, color: Colors.grey)),
//                 ),
//               ),
//             ),

//           // Main Panel expands to fill remaining space between panels
//           Expanded(child: Container(color: Colors.grey[200], child: const Center(child: Text('Main Panel')))),

//           // Right draggable divider (only if right panel is visible)
//           if (isDesktop)
//             GestureDetector(
//               behavior: HitTestBehavior.translucent,
//               onHorizontalDragStart: (_) {
//                 setState(() {
//                   isDraggingRight = true;
//                 });
//               },
//               onHorizontalDragUpdate: (final details) {
//                 setState(() {
//                   rightPanelWidth -= details.delta.dx;
//                   rightPanelWidth = rightPanelWidth.clamp(0.0, 400.0);
//                 });
//               },
//               onHorizontalDragEnd: (_) {
//                 setState(() {
//                   isDraggingRight = false;
//                 });
//               },
//               child: MouseRegion(
//                 cursor: SystemMouseCursors.resizeColumn,
//                 child: Container(
//                   width: 8,
//                   color: isDraggingRight ? Colors.green.withOpacity(0.5) : Colors.transparent,
//                   child: Center(child: Container(width: 2, height: 40, color: Colors.grey)),
//                 ),
//               ),
//             ),

//           // Right Panel
//           if (isDesktop)
//             SizedBox(
//               width: rightPanelWidth,
//               child: Container(color: Colors.green[100], child: const Center(child: Text('Right Panel'))),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedPositionedReorderExample extends StatefulWidget {
//   const AnimatedPositionedReorderExample({super.key});

//   @override
//   _AnimatedPositionedReorderExampleState createState() => _AnimatedPositionedReorderExampleState();
// }

// class _AnimatedPositionedReorderExampleState extends State<AnimatedPositionedReorderExample> {
//   List<String> order = ['A', 'B', 'C'];
//   final Map<String, Color> colors = {'A': Colors.red, 'B': Colors.green, 'C': Colors.blue};

//   // Keys to measure sizes of children
//   final Map<String, GlobalKey> keys = {'A': GlobalKey(), 'B': GlobalKey(), 'C': GlobalKey()};

//   List<double> positions = []; // x position per child index

//   double totalWidth = 0;

//   @override
//   void initState() {
//     super.initState();

//     // After first frame, measure positions
//     WidgetsBinding.instance.addPostFrameCallback((_) => calculatePositions());
//   }

//   /// Calculates positions of children based on their widths plus spacing
//   void calculatePositions() {
//     const double spacing = 8.0;
//     final List<double> widths = [];
//     for (final id in order) {
//       final ctx = keys[id]!.currentContext;
//       if (ctx == null) {
//         widths.add(0);
//       } else {
//         final size = ctx.size;
//         widths.add(size?.width ?? 0);
//       }
//     }

//     final List<double> pos = [];
//     double dx = 0;
//     for (final w in widths) {
//       pos.add(dx);
//       dx += w + spacing;
//     }

//     setState(() {
//       positions = pos;
//       totalWidth = dx - spacing; // subtract last spacing
//     });
//   }

//   void reorder() {
//     setState(() {
//       // Rotate order for example reorder
//       order = [order[1], order[2], order[0]];
//     });

//     // Calculate positions after next frame layout completes
//     WidgetsBinding.instance.addPostFrameCallback((_) => calculatePositions());
//   }

//   Widget buildChild(final String id, final int index) {
//     return AnimatedPositioned(
//       key: ValueKey(id),
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.easeInOut,
//       left: positions.isNotEmpty ? positions[index] : 0,
//       top: 0,
//       width: keys[id]?.currentContext?.size?.width ?? 100, // Use measured width or default
//       bottom: 0,
//       child: Container(
//         key: keys[id],
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(color: colors[id], borderRadius: BorderRadius.circular(12)),
//         child: Text(id, style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }

//   @override
//   Widget build(final BuildContext context) {
//     // Use a fixed height container for the stack

//     return Scaffold(
//       appBar: AppBar(title: const Text('AnimatedPositioned Reorder Example')),
//       body: Stack(
//         clipBehavior: Clip.none,
//         children: order.asMap().entries.map((final entry) => buildChild(entry.value, entry.key)).toList(),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: reorder, child: const Icon(Icons.shuffle)),
//     );
//   }
// }

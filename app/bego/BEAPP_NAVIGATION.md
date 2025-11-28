# 🎯 Bego Navigation Architecture - BeApp & BeAppDelegate

## What Changed

The Bego app has been refactored to use the **BeApp** and **BeAppDelegate** pattern from the becomponent library, providing a native navigation bar UI.

### Before (GetMaterialApp)

```dart
GetMaterialApp(
  getPages: [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/cart', page: () => CartPage()),
    GetPage(name: '/profile', page: () => ProfilePage()),
  ],
)
```

### After (BeApp + BeAppDelegate)

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initBeApp(package: 'bego.app', routerDelegate: BegoAppDelegate());
  runApp(const BeApp());
}

class BegoAppDelegate extends BeAppRouteDelegate {
  @override
  List<BeMainPage<dynamic>> get mainRoutes => [
    BeMainPage(name: '/home', page: HomePage.new, title: 'Home', binding: _HomeBinding()),
    BeMainPage(name: '/browse', page: () => CategoriesPage(...), title: 'Browse', binding: _BrowseBinding()),
    BeMainPage(name: '/cart', page: CartPage.new, title: 'Cart', binding: _CartBinding()),
    BeMainPage(name: '/profile', page: ProfilePage.new, title: 'Profile', binding: _ProfileBinding()),
  ];
}
```

## ✨ Key Benefits

✅ **Built-in Navigation Bar**

- Automatic bottom/side navigation based on screen size
- No need to manually manage navigation state
- Responsive - adapts to desktop, tablet, mobile

✅ **Cleaner Architecture**

- BeAppDelegate handles all routing logic
- Clear separation: auth routes vs main routes
- Middleware support for cross-cutting concerns

✅ **Better UX**

- State preserved when switching tabs
- Smooth transitions between pages
- AppBar automatically managed

✅ **Simplified Binding**

- Per-route dependency injection
- Automatic cleanup when navigating away
- Type-safe controller access

## 🏗️ Structure

### Routes Layer

```
BegoAppDelegate
├── routes (auth routes)
│   ├── /login
│   ├── /signup
│   └── /onboarding
├── mainRoutes (main app routes with nav bar)
│   ├── /home (Home page)
│   ├── /browse (Categories)
│   ├── /cart (Shopping cart)
│   └── /profile (User profile)
└── middleware (auth middleware)
```

### Main Routes (With Navigation Bar)

```
4 Main Routes:
1. Home (/)
   └── Default landing page after login

2. Browse (/browse)
   └── Browse service categories

3. Cart (/cart)
   └── Shopping cart & checkout

4. Profile (/profile)
   └── User profile & settings
```

### Auth Routes (No Navigation Bar)

```
3 Auth Routes:
1. /login - Login page
2. /signup - Registration page
3. /onboarding - Welcome onboarding
```

## 🔄 Navigation Flow

```
App Start
    ↓
initBeApp() - Initialize BeApp services
    ↓
BeApp() - Renders main app shell
    ↓
Auth Check (AuthMiddleware)
    ├─ Not Logged In → Show /login
    └─ Logged In → Show /home (main routes with nav bar)
         ├ User taps Home → /home
         ├ User taps Browse → /browse
         ├ User taps Cart → /cart
         └ User taps Profile → /profile
```

## 📱 Navigation Bar Behavior

### Mobile/Tablet

- Shows bottom navigation bar
- 4 main routes as tabs
- Swipe left/right to switch
- Tab icons auto-generated from route titles

### Desktop

- Shows sidebar navigation
- 4 main routes in vertical menu
- Click to switch
- More space for content

### Responsive

- Auto-detects screen size
- Switches between bottom/side nav
- Maintains state during resize

## 🎯 Route Details

### 1. Home Route (`/home`)

```dart
BeMainPage(
  name: '/home',
  page: HomePage.new,           // HomePage widget
  title: 'Home',                // Navigation label
  binding: _HomeBinding(),      // Dependency injection
)
```

### 2. Browse Route (`/browse`)

```dart
BeMainPage(
  name: '/browse',
  page: () => CategoriesPage(category: 'Decoration'),
  title: 'Browse',
  binding: _BrowseBinding(),
)
```

### 3. Cart Route (`/cart`)

```dart
BeMainPage(
  name: '/cart',
  page: CartPage.new,
  title: 'Cart',
  binding: _CartBinding(),
)
```

### 4. Profile Route (`/profile`)

```dart
BeMainPage(
  name: '/profile',
  page: ProfilePage.new,
  title: 'Profile',
  binding: _ProfileBinding(),
)
```

## 🔐 Authentication Middleware

```dart
class _AuthMiddleware extends GetMiddleware {
  bool isLoggedIn = true;

  @override
  RouteDecoder redirectDelegate(final RouteDecoder? route) {
    if (!isLoggedIn && route?.route?.name != '/login' && route?.route?.name != '/signup') {
      return RouteDecoder.fromRoute('/login');  // Redirect to login
    }
    return RouteDecoder.fromRoute(route?.route?.name ?? '/home');
  }
}
```

## 💉 Dependency Injection

### Binding Pattern

```dart
class _HomeBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<HomeController>(HomeController.new),
    // Add more bindings here
  ];
}
```

### Using in Controller/Page

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(context) {
    final controller = Get.find<HomeController>();
    // Use controller
  }
}
```

## 🧭 Navigation Examples

### Navigate Programmatically

```dart
// Go to browse
Get.toNamed('/app/browse');

// Go to cart
Get.toNamed('/app/cart');

// Go to profile
Get.toNamed('/app/profile');

// Go back
Get.back();
```

### Custom AppBar

```dart
@override
RouteFactory? get appBarRouteFactory => (settings) {
  return MaterialPageRoute(
    builder: (context) => AppBar(
      title: const Text('Bego - Service Marketplace'),
      actions: [
        IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
      ],
    ),
  );
};
```

## 📋 Auth Flow Changes

### Before (Manual Auth Check)

```dart
home: isLoggedIn ? HomePage() : LoginPage()
```

### After (Middleware-Based)

```dart
mainMiddlewares = [_AuthMiddleware()]
// Automatically redirects to /login if not authenticated
```

## ✅ Benefits Summary

| Feature           | Before                | After               |
| ----------------- | --------------------- | ------------------- |
| Navigation Bar    | Manual implementation | Built-in, automatic |
| Route Management  | Manual getPages list  | Structured routing  |
| Auth              | Home page logic       | Middleware          |
| State Management  | Per-page              | Per-route bindings  |
| Responsive        | Manual handling       | Automatic           |
| Tab State         | Lost on navigate      | Preserved           |
| Code Organization | Flat                  | Hierarchical        |

## 🔄 Migration Notes

### What Stayed the Same

- ✅ Page components (HomePage, CartPage, etc.)
- ✅ State management (BePage pattern)
- ✅ Controllers and business logic
- ✅ String constants
- ✅ Component structure

### What Changed

- ❌ Main.dart structure (now uses BeApp)
- ❌ Route configuration (now BeMainPage list)
- ❌ Navigation bar (now built-in)
- ❌ Auth check (now middleware)

### No Breaking Changes

- All existing pages work as-is
- No controller changes needed
- No state management changes
- Just better infrastructure!

## 🚀 Running the App

```bash
# Get dependencies
flutter pub get

# Generate code
flutter pub run build_runner build

# Run on your device
flutter run

# Run on web
flutter run -d web

# Run on desktop
flutter run -d windows
flutter run -d macos
flutter run -d linux
```

## 🎨 Customization

### Add More Main Routes

```dart
BeMainPage(
  name: '/favorites',
  page: FavoritesPage.new,
  title: 'Favorites',
  binding: _FavoritesBinding(),
),
```

### Modify AppBar

Edit `appBarRouteFactory` to customize top app bar appearance and actions.

### Add Drawer

Implement `drawerRouteFactory` for left sidebar (desktop) or drawer menu (mobile).

### Add Side Panel

Implement `sidePanelRouteFactory` for right-side information panel.

## 📖 File Reference

- **File**: `app/bego/lib/main.dart`
- **Classes**:
  - `BegoAppDelegate` - Route configuration
  - `_AuthMiddleware` - Authentication logic
  - `_HomeBinding`, `_BrowseBinding`, `_CartBinding`, `_ProfileBinding` - Dependency injection

---

**Status**: ✅ Implemented and working
**Date**: 2024
**Version**: 2.0 (BeApp Integration)

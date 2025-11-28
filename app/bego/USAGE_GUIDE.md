# Bego Flutter Boilerplate - Usage Guide

## Quick Start

### 1. Running the App

```bash
cd app/bego
flutter pub get
flutter run
```

### 2. Project Structure

```
lib/
├── main.dart                    # App entry point with GetMaterialApp setup
├── constants/
│   └── strings.dart            # All UI text constants
└── pages/
    ├── splash/                 # Initial loading screen
    │   ├── splash_page.dart
    │   ├── splash_state.dart
    │   └── splash_controller.dart
    ├── onboarding/             # 3-step user onboarding
    ├── auth/
    │   ├── login/
    │   └── signup/
    ├── home/                   # 8 service categories grid
    │   ├── components/
    │   │   └── category_card.dart
    │   ├── home_page.dart
    │   ├── home_state.dart
    │   └── home_controller.dart
    ├── categories/             # Items list for selected category
    ├── category_details/       # Item details with quantity
    ├── cart/                   # 3-step checkout process
    │   ├── components/
    │   │   └── checkout_step.dart
    │   ├── cart_page.dart
    │   ├── cart_state.dart
    │   └── cart_controller.dart
    └── profile/                # User profile & order history
        └── components/
            ├── profile_header.dart
            └── profile_menu_item.dart
```

## Architecture Pattern: BePage

Every page follows a three-file pattern:

### 1. State (Immutable Data)

```dart
// lib/pages/home/home_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required List<String> categories,
    required bool isLoading,
    String? errorMessage,
  }) = _HomeState;
}
```

### 2. Controller (Business Logic)

```dart
// lib/pages/home/home_controller.dart
import 'package:becore/getx.dart';
import 'home_state.dart';

class HomeController extends BePageController<HomeState> {
  @override
  void onInit() {
    super.onInit();
    // Initialize with default state
    change(SuccessStatus(
      HomeState(
        categories: const [
          'Decoration',
          'Venue',
          'Rent Car',
          'Parlour',
          'Chef',
          'Photography',
          'Music Band',
          'Catering',
        ],
        isLoading: false,
      ),
    ));
  }

  void selectCategory(String category) {
    Get.toNamed('/categories/$category');
  }

  void goToCart() {
    Get.toNamed('/cart');
  }

  void goToProfile() {
    Get.toNamed('/profile');
  }
}
```

### 3. Page (UI Widget)

```dart
// lib/pages/home/home_page.dart
import 'package:flutter/material.dart';
import 'package:becomponent/src/page/be_page.dart';
import 'home_state.dart';
import 'home_controller.dart';

class HomePage extends BePage<HomeState, HomeController> {
  HomePage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<HomeController>(
          successBuilder: (context, controller) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Bego'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: controller.goToCart,
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: controller.goToProfile,
                  ),
                ],
              ),
              body: GridView.builder(
                itemCount: controller.state.categories.length,
                itemBuilder: (context, index) {
                  final category = controller.state.categories[index];
                  return GestureDetector(
                    onTap: () => controller.selectCategory(category),
                    child: Card(child: Center(child: Text(category))),
                  );
                },
              ),
            );
          },
          customBuilder: (context, state) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      );
}
```

## Navigation Guide

### Named Routes

```dart
// Navigate to categories
Get.toNamed('/categories/Decoration');

// Navigate to item details
Get.toNamed('/categories/Decoration/item1');

// Navigate to cart
Get.toNamed('/cart');

// Navigate to profile
Get.toNamed('/profile');

// Navigate back
Get.back();
```

### Route Parameters

```dart
// In categories page - access category name
final category = Get.parameters['category'] ?? 'Decoration';

// In details page - access category and item ID
final category = Get.parameters['category'] ?? 'Decoration';
final itemId = Get.parameters['itemId'] ?? 'item1';
```

## Using String Constants

All UI text should use the centralized `AppStrings` class:

```dart
import 'package:bego/constants/strings.dart';

// Use constants
Text(AppStrings.selectService)
TextField(
  decoration: InputDecoration(
    labelText: AppStrings.email,
    prefixIcon: const Icon(Icons.email),
  ),
)
ElevatedButton(
  onPressed: () {},
  child: const Text(AppStrings.addToCart),
)
```

## Available String Constants

```dart
// App
AppStrings.appName              // 'Bego'
AppStrings.appTitle             // 'Bego - Service Marketplace'

// Splash
AppStrings.splash              // 'Bego'
AppStrings.loadingMessage      // 'Loading...'

// Onboarding
AppStrings.onboardingTitle     // 'Welcome to Bego'
AppStrings.stepNext            // 'Next'
AppStrings.stepSkip            // 'Skip'

// Auth
AppStrings.login               // 'Login'
AppStrings.signup              // 'Sign Up'
AppStrings.email               // 'Email'
AppStrings.password            // 'Password'
AppStrings.forgotPassword      // 'Forgot Password?'

// Home & Categories
AppStrings.selectService       // 'Select a Service'
AppStrings.categories          // ['Decoration', 'Venue', ...]
AppStrings.categoryTitle       // 'Items'

// Cart & Checkout
AppStrings.cart                // 'Cart'
AppStrings.checkout            // 'Checkout'
AppStrings.reviewItems         // 'Review Items'
AppStrings.shippingAddress     // 'Shipping Address'
AppStrings.paymentMethod       // 'Payment Method'
AppStrings.placeOrder          // 'Place Order'
AppStrings.total               // 'Total'

// Profile
AppStrings.profile             // 'Profile'
AppStrings.orderHistory        // 'Order History'
AppStrings.logout              // 'Logout'

// Services (8 categories)
AppStrings.decoration          // 'Decoration'
AppStrings.venue               // 'Venue'
AppStrings.rentCar             // 'Rent Car'
AppStrings.parlour             // 'Parlour'
AppStrings.chef                // 'Chef'
AppStrings.photography         // 'Photography'
AppStrings.musicBand           // 'Music Band'
AppStrings.catering            // 'Catering'
```

## State Management Examples

### Reading State

```dart
// In controller
if (state.isLoading) {
  // Show loading indicator
}
if (state.errorMessage != null) {
  // Show error message
}

// Access state properties
final items = state.cartItems;
final total = state.totalPrice;
final userName = state.name;
```

### Updating State

```dart
// Update state in controller
change(SuccessStatus(
  HomeState(
    categories: newCategories,
    isLoading: false,
  ),
));

// Show loading
change(LoadingStatus());

// Show error
change(ErrorStatus(message: 'Something went wrong'));
```

## Adding New Page

### Step 1: Create State File

```dart
// lib/pages/new_page/new_page_state.dart
@freezed
abstract class NewPageState with _$NewPageState {
  const factory NewPageState({
    required String title,
    required bool isLoading,
    String? errorMessage,
  }) = _NewPageState;
}
```

### Step 2: Create Controller

```dart
// lib/pages/new_page/new_page_controller.dart
class NewPageController extends BePageController<NewPageState> {
  @override
  void onInit() {
    super.onInit();
    change(SuccessStatus(
      NewPageState(
        title: 'New Page',
        isLoading: false,
      ),
    ));
  }
}
```

### Step 3: Create Page

```dart
// lib/pages/new_page/new_page_page.dart
class NewPage extends BePage<NewPageState, NewPageController> {
  NewPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<NewPageController>(
          successBuilder: (context, controller) {
            return Scaffold(
              appBar: AppBar(title: Text(controller.state.title)),
              body: const Center(child: Text('New Page')),
            );
          },
        ),
      );
}
```

### Step 4: Add Route to main.dart

```dart
// In getPages list
GetPage(
  name: '/new-page',
  page: () => NewPage(),
  binding: _NewPageBinding(),
),

// Add binding
class _NewPageBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<NewPageController>(NewPageController.new),
  ];
}
```

## Debugging

### Enable GetX Debugging

```dart
// In main.dart
GetMaterialApp(
  enableLog: true,  // Logs all navigations
  logWriterCallback: print,
  // ... rest of config
)
```

### Check State Updates

```dart
// In controller
void someMethod() {
  print('Current state: $state');
  print('Is loading: ${state.isLoading}');
  print('Error: ${state.errorMessage}');
}
```

## Common Issues & Solutions

### Issue: Page not found

**Solution**: Check route spelling in `Get.toNamed()` matches `GetPage` name in main.dart

### Issue: State not updating

**Solution**: Make sure to call `change()` with new state in controller

### Issue: Parameters not passed

**Solution**: Use `Get.parameters['key']` in page constructor, not in controller

### Issue: Binding not injecting

**Solution**: Verify binding name matches route name in main.dart getPages list

---

For more info on BePage architecture, check becomponent library documentation.
For more info on GetX, visit: https://github.com/jonataslaw/getx

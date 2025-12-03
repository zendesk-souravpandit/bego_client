# Bego App - Page Creation Guide for AI Agents

## Overview

This guide provides a comprehensive boilerplate structure for creating new pages in the Bego Flutter app. The app follows a strict hierarchical routing pattern with the BeApp architecture and GetX state management using Freezed for immutable states.

---

## Table of Contents

1. [Project Structure](#project-structure)
2. [File Templates](#file-templates)
3. [Routing Architecture](#routing-architecture)
4. [Step-by-Step Guide](#step-by-step-guide)
5. [Examples](#examples)

---

## Project Structure

### Base Directory

```
lib/pages/
├── auth/
│   ├── auth_middleware.dart
│   ├── login/
│   ├── signup/
│   └── onboarding/
├── discover/
│   ├── discover_page.dart
│   ├── discover_controller.dart
│   ├── discover_binding.dart
│   ├── discover_state.dart
│   ├── components/
│   ├── tenant/
│   ├── business/
│   └── business/item_view/
├── dashboard/
│   ├── dashboard_page.dart
│   ├── dashboard_controller.dart
│   ├── dashboard_binding.dart
│   ├── dashboard_state.dart
│   ├── components/
│   └── owner/
├── cart/
├── profile/
└── onboarding/
```

### Mandatory Files Per Page

Every page MUST have these 5 files:

```
page_name/
├── {page_name}_page.dart         (UI Widget)
├── {page_name}_controller.dart   (Business Logic)
├── {page_name}_binding.dart      (Dependency Injection)
├── {page_name}_state.dart        (Immutable State with Freezed)
└── components/
    └── {page_name}_component.dart (Boilerplate Component)
```

---

## File Templates

### 1. `{page_name}_controller.dart`

```dart
import 'package:becore/getx.dart';

class MyPageController extends GetxController {
  // Extract parameters from route
  String get paramId => Get.parameters['paramId'] ?? '';

  // State management
  late MyPageState _state;
  MyPageState get state => _state;

  @override
  void onInit() {
    super.onInit();
    _state = MyPageState.initial();
  }

  // Business logic methods
  void loadData() {
    // Implement data loading
    _state = _state.copyWith(
      // Update state properties
    );
  }
}
```

### 2. `{page_name}_binding.dart`

```dart
import 'package:becore/getx.dart';
import 'package:bego/pages/page_name/{page_name}_controller.dart';

class MyPageBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<MyPageController>(MyPageController.new),
  ];
}
```

### 3. `{page_name}_state.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part '{page_name}_state.freezed.dart';
part '{page_name}_state.g.dart';

@freezed
abstract class MyPageState with _$MyPageState {
  const factory MyPageState({
    @Default([]) List<String> items,
    @Default('') String title,
    @Default(false) bool isLoading,
  }) = _MyPageState;

  factory MyPageState.initial() => const MyPageState(
    items: [],
    title: 'My Page',
    isLoading: false,
  );

  factory MyPageState.fromJson(Map<String, dynamic> json) =>
      _$MyPageStateFromJson(json);
}
```

### 4. `{page_name}_page.dart`

```dart
import 'package:flutter/material.dart';
import 'package:becore/getx.dart';
import 'package:bego/pages/page_name/{page_name}_controller.dart';
import 'package:bego/pages/page_name/components/{page_name}_component.dart';

class MyPage extends GetView<MyPageController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: Obx(
        () => MyPageComponent(),
      ),
    );
  }
}
```

### 5. `components/{page_name}_component.dart`

```dart
import 'package:flutter/material.dart';

class MyPageComponent extends StatelessWidget {
  const MyPageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('My Page'),
    );
  }
}
```

---

## Routing Architecture

### Route Hierarchy Levels

#### Level 1: Main Routes (Top-level)

- **Purpose:** Primary navigation destinations
- **Pattern:** `/route_name`
- **Examples:** `/discover`, `/dashboard/:tenantId`, `/cart`, `/profile`
- **Features:** Has navigation bar (except auth routes)

#### Level 2: Nested Routes (Child routes)

- **Purpose:** Sub-pages within main routes
- **Pattern:** `/parent/:param/child/:childParam`
- **Examples:** `/discover/:tenantId`, `/dashboard/:tenantId/:businessId/owner`
- **Features:** Inherits navigation bar from parent

#### Level 3: Deep Routes (Grandchild routes)

- **Purpose:** Specific feature pages within nested routes
- **Pattern:** `/parent/:param/child/:childParam/feature/path`
- **Examples:** `/dashboard/:tenantId/:businessId/owner/item/add`
- **Features:** Multiple parameter passing through hierarchy

### Current Route Map

```
GET PAGES (Auth - No Nav Bar):
├── /login → LoginPage
├── /signup → SignupPage
└── /onboarding → OnboardingPage

MAIN ROUTES (BeMainPage with Nav Bar):
├── /discover → DiscoverPage
│   ├── /:tenantId → TenantViewPage
│   ├── /:tenantId/:businessId → BusinessViewPage
│   ├── /:tenantId/:businessId/view → BusinessViewPage
│   └── /:tenantId/:businessId/item/:itemId/view → BusinessItemViewPage
│
├── /dashboard/:tenantId → DashboardPage
│   └── /:businessId/owner → BusinessOwnerPage
│       ├── /features/catalog → CatalogListPage
│       ├── /edit → EditBusinessPage
│       ├── /item/add → AddItemPage
│       ├── /item/edit/:itemId → EditItemPage
│       └── /announcements → AnnouncementsPage
│
├── /cart → CartPage
└── /profile → ProfilePage
```

---

## Step-by-Step Guide

### Adding a New Main Page

#### Step 1: Create Page Directory

```bash
mkdir -p lib/pages/my_feature/{components}
```

#### Step 2: Create Controller

File: `lib/pages/my_feature/my_feature_controller.dart`

- Extract route parameters using `Get.parameters`
- Manage state via `_state` property
- Implement business logic methods

#### Step 3: Create State

File: `lib/pages/my_feature/my_feature_state.dart`

- Use `@freezed abstract class` decorator
- Define all properties with `@Default()` values
- Implement `factory MyFeatureState.initial()`
- Implement `factory MyFeatureState.fromJson()`

#### Step 4: Create Binding

File: `lib/pages/my_feature/my_feature_binding.dart`

- Inject controller using `Bind.lazyPut<MyFeatureController>()`
- Return list of dependencies

#### Step 5: Create Page

File: `lib/pages/my_feature/my_feature_page.dart`

- Extend `GetView<MyFeatureController>`
- Use `Obx()` for reactive UI updates
- Build Scaffold with AppBar and body

#### Step 6: Create Component

File: `lib/pages/my_feature/components/my_feature_component.dart`

- Stateless widget with boilerplate UI
- Display page title and basic content

#### Step 7: Add Route to routes.dart

```dart
// Import the files
import 'package:bego/pages/my_feature/my_feature_binding.dart';
import 'package:bego/pages/my_feature/my_feature_page.dart';

// Add to mainRoutes
BeMainPage(
  name: '/my-feature',
  page: MyFeaturePage.new,
  title: 'My Feature',
  binding: MyFeatureBinding(),
),
```

### Adding a Nested Child Page

#### Step 1: Create Child Directory

```bash
mkdir -p lib/pages/parent/child_feature/{components}
```

#### Step 2: Create All 5 Files

Follow same structure as main page

#### Step 3: Add to Parent Route

```dart
BeMainPage(
  name: '/parent',
  page: ParentPage.new,
  title: 'Parent',
  binding: ParentBinding(),
  children: [
    BeMainPage(
      name: '/child',
      page: ChildPage.new,
      title: 'Child',
      binding: ChildBinding(),
    ),
  ],
)
```

### Adding a Deep Nested Page (3+ levels)

#### Step 1: Create Deep Directory

```bash
mkdir -p lib/pages/level1/level2/level3/{components}
```

#### Step 2: Create All 5 Files

```dart
// Controller extracts multiple parameters
String get param1 => Get.parameters['param1'] ?? '';
String get param2 => Get.parameters['param2'] ?? '';
String get param3 => Get.parameters['param3'] ?? '';
```

#### Step 3: Add to Grandparent Route

```dart
BeMainPage(
  name: '/level1/:param1',
  page: Level1Page.new,
  binding: Level1Binding(),
  children: [
    BeMainPage(
      name: '/:param2/level2',
      page: Level2Page.new,
      binding: Level2Binding(),
      children: [
        BeMainPage(
          name: '/:param3/level3',
          page: Level3Page.new,
          binding: Level3Binding(),
        ),
      ],
    ),
  ],
)
```

---

## Examples

### Example 1: Simple Feature Page (Cart)

**Directory:** `lib/pages/cart/`

**Files:**

1. **cart_controller.dart**

```dart
import 'package:becore/getx.dart';

class CartController extends GetxController {
  late CartState _state;
  CartState get state => _state;

  @override
  void onInit() {
    super.onInit();
    _state = CartState.initial();
  }

  void clearCart() {
    _state = _state.copyWith(items: []);
  }
}
```

2. **cart_state.dart**

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';
part 'cart_state.g.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<String> items,
    @Default(0.0) double total,
  }) = _CartState;

  factory CartState.initial() => const CartState(
    items: [],
    total: 0.0,
  );

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);
}
```

3. **cart_binding.dart**

```dart
import 'package:becore/getx.dart';
import 'package:bego/pages/cart/cart_controller.dart';

class CartBinding extends Binding {
  @override
  List<Bind<dynamic>> dependencies() => [
    Bind.lazyPut<CartController>(CartController.new),
  ];
}
```

4. **cart_page.dart**

```dart
import 'package:flutter/material.dart';
import 'package:becore/getx.dart';
import 'package:bego/pages/cart/cart_controller.dart';
import 'package:bego/pages/cart/components/cart_component.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Obx(() => CartComponent()),
    );
  }
}
```

5. **components/cart_component.dart**

```dart
import 'package:flutter/material.dart';

class CartComponent extends StatelessWidget {
  const CartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Cart'),
    );
  }
}
```

---

### Example 2: Nested Feature Page (Dashboard with Owner Section)

**Directory:** `lib/pages/dashboard/owner/`

**Route Parameter Usage:**

- Parent: `/dashboard/:tenantId`
- Child: `/:businessId/owner`
- Full Path: `/dashboard/{tenantId}/{businessId}/owner`

**Files:**

1. **business_owner_controller.dart**

```dart
import 'package:becore/getx.dart';

class BusinessOwnerController extends GetxController {
  String get tenantId => Get.parameters['tenantId'] ?? '';
  String get businessId => Get.parameters['businessId'] ?? '';

  late BusinessOwnerState _state;
  BusinessOwnerState get state => _state;

  @override
  void onInit() {
    super.onInit();
    _state = BusinessOwnerState.initial(
      tenantId: tenantId,
      businessId: businessId,
    );
  }

  void updateBusinessName(String newName) {
    _state = _state.copyWith(name: newName);
  }
}
```

2. **business_owner_state.dart**

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_owner_state.freezed.dart';
part 'business_owner_state.g.dart';

@freezed
abstract class BusinessOwnerState with _$BusinessOwnerState {
  const factory BusinessOwnerState({
    required String tenantId,
    required String businessId,
    @Default('') String name,
    @Default('') String description,
  }) = _BusinessOwnerState;

  factory BusinessOwnerState.initial({
    required String tenantId,
    required String businessId,
  }) => BusinessOwnerState(
    tenantId: tenantId,
    businessId: businessId,
    name: 'Business Name',
    description: 'Business Description',
  );

  factory BusinessOwnerState.fromJson(Map<String, dynamic> json) =>
      _$BusinessOwnerStateFromJson(json);
}
```

---

### Example 3: Deep Nested Feature (Item Management)

**Directory:** `lib/pages/dashboard/owner/edit_item/`

**Route:** `/dashboard/:tenantId/:businessId/owner/item/edit/:itemId`

**Files:**

1. **edit_item_controller.dart**

```dart
import 'package:becore/getx.dart';

class EditItemController extends GetxController {
  String get tenantId => Get.parameters['tenantId'] ?? '';
  String get businessId => Get.parameters['businessId'] ?? '';
  String get itemId => Get.parameters['itemId'] ?? '';

  late EditItemState _state;
  EditItemState get state => _state;

  @override
  void onInit() {
    super.onInit();
    _state = EditItemState.initial(
      tenantId: tenantId,
      businessId: businessId,
      itemId: itemId,
    );
    loadItem();
  }

  Future<void> loadItem() async {
    // Load item from API using itemId
    _state = _state.copyWith(isLoading: false);
  }

  void saveItem() {
    // Save changes to API
  }
}
```

2. **edit_item_state.dart**

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_item_state.freezed.dart';
part 'edit_item_state.g.dart';

@freezed
abstract class EditItemState with _$EditItemState {
  const factory EditItemState({
    required String tenantId,
    required String businessId,
    required String itemId,
    @Default('') String name,
    @Default('') String description,
    @Default(0.0) double price,
    @Default(false) bool isLoading,
  }) = _EditItemState;

  factory EditItemState.initial({
    required String tenantId,
    required String businessId,
    required String itemId,
  }) => EditItemState(
    tenantId: tenantId,
    businessId: businessId,
    itemId: itemId,
  );

  factory EditItemState.fromJson(Map<String, dynamic> json) =>
      _$EditItemStateFromJson(json);
}
```

---

## Important Rules

### ✅ DO

- Create unique page/controller/binding for each route
- Use `@freezed abstract class` for state classes
- Extract parameters in controller getters
- Use `Obx()` for reactive updates
- Name files consistently: `{page_name}_*.dart`
- Add components folder with boilerplate component
- Import all files in routes.dart

### ❌ DON'T

- Reuse same page for multiple different routes
- Use mutable state management
- Create state files without `abstract` keyword
- Mix UI logic in controller
- Create nested routes without parent route
- Skip any of the 5 mandatory files
- Hardcode parameter values in controller

### 🔧 Parameter Passing Rules

```
Route Pattern:          Parameter Access:
/discover               (no parameters)
/:tenantId              Get.parameters['tenantId']
/:tenantId/:businessId  Get.parameters['tenantId'] and Get.parameters['businessId']
/item/:itemId/edit      Get.parameters['itemId']
```

---

## File Naming Conventions

```
Page Feature: my_feature
├── my_feature_page.dart         (UI)
├── my_feature_controller.dart   (Logic)
├── my_feature_binding.dart      (DI)
├── my_feature_state.dart        (State)
└── components/
    └── my_feature_component.dart (Boilerplate UI)

Route Path: /my-feature (kebab-case in routes)
Class Names: MyFeaturePage, MyFeatureController, MyFeatureState (PascalCase)
File Names: my_feature_*.dart (snake_case)
```

---

## Checklist for New Page Creation

- [ ] Directory created: `lib/pages/{page_name}/`
- [ ] `{page_name}_controller.dart` created with state management
- [ ] `{page_name}_state.dart` created with `@freezed abstract class`
- [ ] `{page_name}_binding.dart` created with dependency injection
- [ ] `{page_name}_page.dart` created with UI
- [ ] `components/{page_name}_component.dart` created
- [ ] Imports added to `routes.dart`
- [ ] Route added to `mainRoutes` list
- [ ] All class names follow PascalCase convention
- [ ] All file names follow snake_case convention
- [ ] Parameters extracted using `Get.parameters`
- [ ] State uses `copyWith()` for updates
- [ ] Page uses `Obx()` for reactive updates
- [ ] No compilation errors in routes.dart

---

## Troubleshooting

### Error: "Target of URI doesn't exist: '\*.freezed.dart'"

**Solution:** Run `flutter pub run build_runner build --delete-conflicting-outputs`

### Error: "Missing concrete implementations of getter mixin"

**Solution:** Add `abstract` keyword before class declaration in state file

### Error: "Unused import in routes.dart"

**Solution:** Ensure binding and page are actually used in route definition

### Error: "Get.parameters returns null"

**Solution:** Verify parameter name in route matches parameter access in controller

### Parameter not passing to nested route

**Solution:** Ensure parent and child routes both include the parameter in their name patterns

---

## Next Steps

1. Choose a feature to implement
2. Follow step-by-step guide for your use case
3. Create all 5 mandatory files
4. Add route to `routes.dart`
5. Run `flutter pub run build_runner build`
6. Test navigation

For questions or clarifications, refer to existing pages like `/discover`, `/dashboard`, or `/cart` as reference implementations.

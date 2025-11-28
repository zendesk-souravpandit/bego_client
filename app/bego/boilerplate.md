# Bego Flutter Boilerplate - Task Summary

## Overview

Create a complete, production-ready Flutter boilerplate application based on userflow screenshot attached also with nestead routes app (Bego) following the BePage architecture pattern from the becomponent library.

## Architecture Requirements

### 1. **Page Structure Pattern**

Each page must follow a strict three-file pattern:

#### a) `*_state.dart` - Immutable State (Freezed)

- Use `@freezed` annotation for immutable state classes
- Implement `_$PageNameState` mixin
- Include factory constructor with `.initial()` for default values
- Add JSON serialization support with `factory PageName.fromJson()`
- Fields typically include:
  - Data model (e.g., categories list, items)
  - `isLoading: bool` - for async operations
  - `errorMessage: String?` - for error handling

**Example:**

```dart
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required final List<String> categories,
    required final bool isLoading,
    required final String? errorMessage,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    categories: [...],
    isLoading: false,
    errorMessage: null,
  );

  factory HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);
}
```

#### b) `*_controller.dart` - Business Logic (BePageController)

- Extend `BePageController<State>` from becomponent library
- Manage state reactively using GetX patterns
- Implement `onInit()` to load initial data
- Include methods for user interactions and navigation
- Use GetX navigation with named routes for page transitions

**Example:**

```dart
class HomeController extends BePageController<HomeState> {
  HomeController() : super(HomeState.initial());

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    // Update state with loading
    // Fetch data
    // Update state with result
  }

  void goToCategory(String category) {
    Get.toNamed<void>('/categories/$category');
  }
}
```

#### c) `*_page.dart` - UI Widget (BePage)

- Extend `BePage<State, Controller>` from becomponent library
- Use `BePageStatusWidgetResolver` for status handling (loading, success, error, empty)
- Display UI based on state
- Include navigation buttons and user interactions
- Placeholder UI: Use `Center(Text())` for initial implementation

**Example:**

```dart
class HomePage extends BePage<HomeState, HomeController> {
  HomePage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<HomeState>(
          successBuilder: (context, state) {
            return Column(
              children: [
                Text('Categories: ${state.categories.length}'),
                // Category buttons here
              ],
            );
          },
          emptyBuilder: (context) => const Text('No categories found'),
          customBuilder: (context, state) => const Text('Loading...'),
        ),
      );
}
```

### 2. **Folder Structure**

```
lib/pages/
├── home/
│   ├── home_state.dart
│   ├── home_controller.dart
│   ├── home_page.dart
│   └── components/
│       ├── category_button.dart
│       └── (other UI components)
├── categories/
│   ├── category_state.dart
│   ├── category_controller.dart
│   ├── category_page.dart
│   └── components/
├── category_details/
│   ├── category_details_state.dart
│   ├── category_details_controller.dart
│   ├── category_details_page.dart
│   └── components/
├── cart/
│   ├── cart_state.dart
│   ├── cart_controller.dart
│   ├── cart_page.dart
│   └── components/
├── profile/
│   ├── profile_state.dart
│   ├── profile_controller.dart
│   ├── profile_page.dart
│   └── components/
├── auth/
│   ├── login/
│   │   ├── login_state.dart
│   │   ├── login_controller.dart
│   │   ├── login_page.dart
│   │   └── components/
│   └── signup/
│       ├── signup_state.dart
│       ├── signup_controller.dart
│       ├── signup_page.dart
│       └── components/
├── splash/
│   ├── splash_state.dart
│   ├── splash_controller.dart
│   ├── splash_page.dart
│   └── components/
└── onboarding/
    ├── onboarding_state.dart
    ├── onboarding_controller.dart
    ├── onboarding_page.dart
    └── components/
```

### 3. **Import Standards**

- Use `import 'package:becore/getx.dart';` instead of `import 'package:get/get.dart';`
- Use `import 'package:becomponent/becomponent.dart';` for BePage and BePageController
- Use relative imports for local files: `import 'package:bego/pages/home/home_state.dart';`

### 4. **Navigation Setup (main.dart)**

- Configure GetMaterialApp with named routes
- Use GetPages with dynamic parameters for parameterized routes
- Route examples:
  - `/` - Splash
  - `/home` - Home
  - `/categories/:category` - Categories list
  - `/categories/:category/:itemId` - Category details
  - `/cart` - Cart
  - `/profile` - Profile
  - `/login` - Login
  - `/signup` - Signup
  - `/onboarding` - Onboarding

### 5. **State Management Features**

- **Loading State**: Show loading indicator when `isLoading: true`
- **Error Handling**: Display error messages when `errorMessage` is not null
- **Data Binding**: Use `Obx()` or `GetBuilder()` for reactive UI updates
- **Status Resolution**: BePageStatusWidgetResolver handles loading/success/error/empty states

### 6. **Page Requirements**

#### Splash Page

- Show app logo/splash screen
- Auto-navigate to onboarding or home after 2-3 seconds
- Check user authentication status

#### Onboarding Page

- Display app features/tutorial
- Navigation buttons: Skip, Next, Start
- Persist onboarding completion status

#### Login Page

- Email/password input fields
- Login button
- Forgot password link
- Navigate to signup

#### Signup Page

- Registration form fields
- Signup button
- Terms & conditions checkbox
- Navigate to login

#### Home Page

- Display service categories (8 categories):
  - decoration
  - venue
  - rent-car
  - parlour
  - chef
  - etc.
- Category buttons navigate to category details with parameter

#### Categories Page

- List items for selected category
- Display category name
- Item selection navigates to details

#### Category Details Page

- Show item details
- Display price, description, ratings
- Add to cart button
- Navigate to cart

#### Cart Page

- Show selected items
- 3-step checkout process:
  1. Review items & quantities
  2. Shipping address
  3. Payment method
- Order summary with total
- Checkout button

#### Profile Page

- Display user information (name, email, phone)
- Edit profile button
- Order history
- Logout button

### 7. **Code Generation**

After creating all files:

```bash
flutter pub run build_runner build
```

This generates:

- `*_state.freezed.dart` - Freezed state implementations
- `*_state.g.dart` - JSON serialization
- Enables `copyWith()` and immutable state patterns

### 8. **Key Principles**

1. **Consistency**: All pages follow identical structure (state/controller/page)
2. **Separation of Concerns**: State logic separate from UI, controller separate from both
3. **Immutability**: Freezed ensures state immutability
4. **Reactivity**: GetX reactive state management with Obx/GetBuilder
5. **Navigation**: GetX named routes with parameters
6. **Error Handling**: Loading and error states built into state management
7. **Scalability**: Components folder allows breaking down UI into smaller, reusable pieces
8. **Type Safety**: Freezed and GetX provide compile-time type safety

### 9. **Naming Conventions**

- Files: `snake_case.dart` (e.g., `home_page.dart`)
- Classes: `PascalCase` (e.g., `HomePage`, `HomeController`)
- State classes: `PascalCase` with `State` suffix (e.g., `HomeState`)
- Controllers: `PascalCase` with `Controller` suffix (e.g., `HomeController`)
- Pages: `PascalCase` with `Page` suffix (e.g., `HomePage`)

## Current Implementation Status

### ✅ Completed

- Home page: state, controller, page (using BePage pattern)
- Category page: state file created
- Folder structure: components/ subfolders created
- Import standardization: Using `becore/getx.dart`

### ⏳ In Progress

- Update controller to use BePageController instead of GetxController
- Update page to extend BePage instead of StatelessWidget

### ⏳ Pending

- Category controller and page
- Cart, Profile, Auth, Splash, Onboarding pages
- Code generation (build_runner)
- Main.dart router configuration
- Testing and validation

## Next Steps

1. Update home_controller.dart to extend BePageController<HomeState>
2. Update home_page.dart to extend BePage<HomeState, HomeController>
3. Continue with remaining pages following the same pattern
4. Configure main.dart with GetMaterialApp and routes
5. Run code generation
6. Test navigation and state management

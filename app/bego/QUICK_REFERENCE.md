# Bego Flutter Boilerplate - Quick Reference Guide

## 📊 What Was Created

### Total Files: 57

- **27 Source Files** (state, controller, page)
- **9 Freezed Generated Files** (\*.freezed.dart)
- **9 JSON Generated Files** (\*.g.dart)
- **1 Main Entry Point** (main.dart)
- **1 Documentation** (BOILERPLATE_SUMMARY.md)

### Pages Created: 9

1. **Splash** - Loading & authentication check
2. **Onboarding** - 3-step tutorial
3. **Login** - User authentication
4. **Signup** - User registration
5. **Home** - Service categories grid
6. **Categories** - Items list by category
7. **Category Details** - Item details with add to cart
8. **Cart** - 3-step checkout wizard
9. **Profile** - User info & order history

---

## 🎯 File Structure Pattern

Every page follows this exact pattern:

### State File (`*_state.dart`)

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part '*_state.freezed.dart';
part '*_state.g.dart';

@freezed
class PageNameState with _$PageNameState {
  const factory PageNameState({
    required final String field1,
    required final bool isLoading,
    required final String? errorMessage,
  }) = _PageNameState;

  factory PageNameState.initial() => const PageNameState(...);

  factory PageNameState.fromJson(Map<String, dynamic> json) =>
      _$PageNameStateFromJson(json);
}
```

### Controller File (`*_controller.dart`)

```dart
import 'package:bego/pages/pagename/*_state.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';

class PageNameController extends BePageController<PageNameState> {
  PageNameController();

  @override
  void onInit() {
    super.onInit();
    change(SuccessStatus(PageNameState.initial()));
  }

  void methodName() {
    change(SuccessStatus(state.copyWith(field1: newValue)));
  }
}
```

### Page File (`*_page.dart`)

```dart
import 'package:bego/pages/pagename/*_state.dart';
import 'package:bego/pages/pagename/*_controller.dart';
import 'package:becomponent/src/page/be_page.dart';
import 'package:becomponent/src/page/be_page_status_resolver.dart';
import 'package:flutter/material.dart';

class PageNamePage extends BePage<PageNameState, PageNameController> {
  PageNamePage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<PageNameController>(
          successBuilder: (context, controller) {
            return Scaffold(
              // UI implementation
            );
          },
        ),
      );
}
```

---

## 🚀 How to Add a New Page

1. **Create folder structure:**

   ```bash
   lib/pages/mypage/
   ```

2. **Create state file** (`mypage_state.dart`):

   - Add `@freezed` annotation
   - Define fields
   - Create `.initial()` factory
   - Add JSON serialization

3. **Create controller** (`mypage_controller.dart`):

   - Extend `BePageController<MyPageState>`
   - Implement `onInit()`
   - Add action methods

4. **Create page** (`mypage_page.dart`):

   - Extend `BePage<MyPageState, MyPageController>`
   - Add `BePageStatusWidgetResolver`
   - Build UI in `successBuilder`

5. **Add route to main.dart:**

   ```dart
   GetPage(
     name: '/mypage',
     page: () => MyPage(),
     binding: _MyPageBinding(),
   ),

   class _MyPageBinding extends Bindings {
     @override
     void dependencies() {
       Get.put(MyPageController());
     }
   }
   ```

6. **Run code generation:**
   ```bash
   flutter pub run build_runner build
   ```

---

## 🔄 Navigation Patterns

### Simple Navigation (No Parameters)

```dart
Get.toNamed<void>('/home');
```

### Navigation with Parameters

```dart
Get.toNamed<void>('/categories/Decoration');
```

### Replace Current Route

```dart
Get.offNamed<void>('/home');
```

### Replace All Routes (Logout Flow)

```dart
Get.offAllNamed<void>('/login');
```

### Get Parameters in Controller

```dart
final category = Get.parameters['category'] ?? 'default';
```

---

## 📦 State Management Patterns

### Update State

```dart
change(SuccessStatus(state.copyWith(field: newValue)));
```

### Show Loading

```dart
change(SuccessStatus(state.copyWith(isLoading: true)));
```

### Show Error

```dart
change(SuccessStatus(state.copyWith(
  isLoading: false,
  errorMessage: 'Error message'
)));
```

### Async Operation

```dart
Future<void> myAsyncMethod() async {
  change(SuccessStatus(state.copyWith(isLoading: true)));

  try {
    // Do something
    await Future.delayed(Duration(seconds: 1));

    change(SuccessStatus(state.copyWith(
      isLoading: false,
      errorMessage: null
    )));
  } catch (e) {
    change(SuccessStatus(state.copyWith(
      isLoading: false,
      errorMessage: e.toString()
    )));
  }
}
```

---

## 🎨 UI Patterns

### Show Loading Indicator

```dart
if (controller.state.isLoading)
  const CircularProgressIndicator()
else
  // Normal UI
```

### Show Error Message

```dart
if (controller.state.errorMessage != null)
  Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.red.shade100,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(controller.state.errorMessage!),
  )
```

### GridView with State

```dart
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
  ),
  itemCount: controller.state.items.length,
  itemBuilder: (context, index) {
    return ItemWidget(item: controller.state.items[index]);
  },
)
```

### ListView with State

```dart
ListView.builder(
  itemCount: controller.state.items.length,
  itemBuilder: (context, index) {
    return ItemTile(item: controller.state.items[index]);
  },
)
```

---

## 🔧 Common Tasks

### Disable Button During Loading

```dart
onPressed: controller.state.isLoading ? null : controller.myMethod,
```

### Show/Hide Based on State

```dart
if (controller.state.someField != null)
  SomeWidget()
else
  EmptyWidget()
```

### Conditional Styling

```dart
color: controller.state.isLoading ? Colors.grey : Colors.blue,
```

### Listen to State Changes (if needed)

```dart
@override
void onInit() {
  super.onInit();
  ever<PageNameState>(_state, (newState) {
    // React to state changes
  });
}
```

---

## 🏃 Running the App

### Install dependencies

```bash
cd app/bego
flutter pub get
```

### Generate code (if needed)

```bash
flutter pub run build_runner build
```

### Run on device/simulator

```bash
flutter run
```

### Clean build

```bash
flutter clean && flutter pub get && flutter pub run build_runner build
```

---

## 🐛 Debugging Tips

### Check state values

```dart
debugPrint('Current state: ${controller.state.toJson()}');
```

### Monitor route changes

```dart
Get.toNamed('/home'); // Check console for route info
```

### Verify generated files

```bash
find lib/pages -name "*.freezed.dart" -o -name "*.g.dart"
```

### Analyze code

```bash
flutter analyze
```

---

## 📚 Key Imports

### Always use these imports in pages:

```dart
import 'package:becore/getx.dart';
import 'package:becomponent/src/page/be_page.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becomponent/src/page/be_page_status_resolver.dart';
```

### Don't use:

- ~~`import 'package:get/get.dart';`~~ Use `becore/getx.dart` instead
- ~~`import 'package:flutter_stateless_widget';`~~ Use BePage instead

---

## 💡 Best Practices

1. **Always use named routes** - Easier to navigate and test
2. **Keep state minimal** - Only data needed for UI
3. **Use copyWith()** - Never mutate state directly
4. **Handle errors** - Always show error messages to users
5. **Show loading states** - Disable buttons during async operations
6. **Use becore/getx** - For consistent imports across project
7. **Generate code after changes** - Always run build_runner after state changes
8. **Test navigation** - Ensure all routes work correctly

---

## 🎯 Next Steps

1. Connect to real backend APIs
2. Add data models/repositories
3. Implement real authentication
4. Add unit and widget tests
5. Setup CI/CD pipeline
6. Implement analytics
7. Add crash reporting
8. Deploy to app stores

---

## 📞 Support

For issues or questions:

1. Check BOILERPLATE_SUMMARY.md for detailed documentation
2. Review example pages for patterns
3. Check GetX and Freezed documentation
4. Run `flutter analyze` to check for errors

Happy coding! 🚀

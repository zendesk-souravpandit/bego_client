# 🚀 BeApp Navigation - Quick Start Guide

## What You Get Now

A beautiful, responsive navigation bar that automatically appears in your Bego app:

```
┌─────────────────────────────┐
│ Bego - Service Marketplace  │  ← AppBar (Notifications, Search buttons)
├─────────────────────────────┤
│                             │
│     Page Content            │
│     (Home/Browse/Cart/      │
│      Profile)               │
│                             │
├─────────────────────────────┤
│ 🏠 Home │ 🛍️ Browse │ 🛒 Cart │ 👤 Profile │  ← Navigation Bar (Mobile)
└─────────────────────────────┘
```

## 🎯 4 Main Routes (Auto Navigation)

| Route      | Icon | Title   | Purpose                  |
| ---------- | ---- | ------- | ------------------------ |
| `/home`    | 🏠   | Home    | Dashboard - Service home |
| `/browse`  | 🛍️   | Browse  | Browse all categories    |
| `/cart`    | 🛒   | Cart    | Shopping cart & checkout |
| `/profile` | 👤   | Profile | User profile & settings  |

## 🔄 How to Navigate

### From Code (In Controllers/Pages)

```dart
// Navigate to Browse page
Get.toNamed('/app/browse');

// Navigate to Cart
Get.toNamed('/app/cart');

// Navigate to Profile
Get.toNamed('/app/profile');

// Go back to Home
Get.toNamed('/app/home');
```

### From UI (Buttons)

```dart
ElevatedButton(
  onPressed: () => Get.toNamed('/app/browse'),
  child: const Text('Browse Services'),
)
```

### From Navigation Bar

Just tap the navigation bar button - automatic!

## 📱 Responsive Behavior

### Mobile (< 600px width)

- Shows **bottom navigation bar** with 4 tabs
- Swipe left/right to navigate
- Tap tab to switch pages

### Tablet (600-1024px width)

- Shows **bottom navigation bar** or **side rail**
- Tap or drag to navigate
- More space for content

### Desktop (> 1024px width)

- Shows **left sidebar** with navigation menu
- Click menu items to navigate
- Full-width content area

## 🔐 Auth Flow

### Not Logged In

```
App starts
    ↓
AuthMiddleware checks login
    ↓
Not logged in → Redirect to /login
```

### Logged In

```
App starts
    ↓
AuthMiddleware checks login
    ↓
Logged in → Show /home (with nav bar)
    ↓
User can navigate between 4 main routes
```

### Login/Signup/Onboarding

These routes show **without** the navigation bar:

```
/login      → Login page
/signup     → Registration page
/onboarding → Onboarding screens
```

## 💡 Key Files

**Main Setup**: `lib/main.dart`

**Classes**:

- `BegoAppDelegate` - Routes & middleware
- `_AuthMiddleware` - Login checks
- `_HomeBinding`, `_BrowseBinding`, `_CartBinding`, `_ProfileBinding` - Dependency injection

**Configuration**:

- `initBeApp()` - Initialize BeApp services
- `BeApp()` - Main app widget
- `mainRoutes` - Navigation bar routes
- `routes` - Auth routes (no nav bar)

## ⚙️ Configuration

### Add More Main Routes

Edit `mainRoutes` in `BegoAppDelegate`:

```dart
BeMainPage(
  name: '/wishlist',
  page: WishlistPage.new,
  title: 'Wishlist',
  binding: _WishlistBinding(),
),
```

### Customize AppBar

Edit `appBarRouteFactory` in `BegoAppDelegate`:

```dart
title: const Text('Your Custom Title'),
actions: [
  // Add your custom actions
],
```

### Change Login Check

In `_AuthMiddleware`:

```dart
bool isLoggedIn = checkUserLoggedIn(); // Your logic here
```

## 🎨 Styling

The navigation bar automatically uses Material 3 styling from BeColors:

```dart
backgroundColor: BeColors.blue        // Navigation color
BeColors.green, BeColors.red, etc.    // Other colors available
```

## 🔗 Related Documentation

- **BEAPP_NAVIGATION.md** - Detailed architecture
- **USAGE_GUIDE.md** - General development guide
- **DELIVERY_SUMMARY.md** - Full feature list

## 🚀 Running

```bash
# Get dependencies
flutter pub get

# Run the app
flutter run

# Run on web
flutter run -d web

# Run on desktop
flutter run -d windows    # Windows
flutter run -d macos      # macOS
flutter run -d linux      # Linux
```

## ✨ What You Don't Need Anymore

❌ Manual bottom navigation bar
❌ Manual route state management
❌ Manual auth page routing
❌ Manual AppBar in each page
❌ Manual page transition handling

All handled automatically by BeApp! ✅

---

**Questions?** See BEAPP_NAVIGATION.md for detailed documentation.

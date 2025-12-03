# User Profile Popover - Quick Reference

## ⚡ Quick Start

### Basic Usage

```dart
CustomAppBar(
  title: 'Dashboard',
  userName: 'Wei Chan',
  userRole: 'Product Manager',
  userImage: 'https://...',
  isDarkMode: isDarkMode,
  onActivityTap: () => print('Activity'),
  onIntegrationsTap: () => print('Integrations'),
  onSettingsTap: () => print('Settings'),
  onAddAccountTap: () => print('Add Account'),
  onLogoutTap: () => print('Logout'),
  onDarkModeToggle: () {
    setState(() => isDarkMode = !isDarkMode);
  },
)
```

## 📦 Component Files

| File                                | Purpose                         |
| ----------------------------------- | ------------------------------- |
| `user_profile_popover_content.dart` | Main popover widget             |
| `custom_app_bar.dart`               | AppBar with popover integration |
| `USER_PROFILE_GUIDE.md`             | Full documentation              |

## 🎯 Key Parameters

```dart
// User Information
required String userName          // Display name
required String userEmail         // Email address
required String userImage         // Avatar URL

// Callbacks
VoidCallback? onActivityTap       // Activity menu
VoidCallback? onIntegrationsTap   // Integrations menu
VoidCallback? onSettingsTap       // Settings menu
VoidCallback? onAddAccountTap     // Add Account menu
VoidCallback? onLogoutTap         // Logout menu
VoidCallback? onDarkModeToggle    // Dark mode switch

// State
bool isDarkMode                   // Current theme state
```

## 🎨 Styling Quick Edits

**Change popover width:**

```dart
// In user_profile_popover_content.dart
Container(
  width: 350,  // Change this (default: 280)
  decoration: BoxDecoration(
```

**Change PRO badge color:**

```dart
Container(
  decoration: BoxDecoration(
    color: Colors.green[100],  // Change this
    borderRadius: BorderRadius.circular(3),
  ),
```

**Change menu item icon:**

```dart
_buildMenuItem(
  icon: Icons.trending_up_outlined,  // Change this
  label: 'Activity',
  onTap: onActivityTap,
),
```

## 🔄 Common Patterns

### Navigate on Settings Tap

```dart
onSettingsTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => SettingsPage()),
  );
}
```

### Logout Handler

```dart
onLogoutTap: () async {
  await FirebaseAuth.instance.signOut();
  if (mounted) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
```

### Dynamic Dark Mode

```dart
onDarkModeToggle: () {
  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
}
```

### Add Account Dialog

```dart
onAddAccountTap: () {
  showDialog(
    context: context,
    builder: (_) => AddAccountDialog(),
  );
}
```

## 📐 Layout Quick Facts

- **Width**: 280px
- **Avatar Radius**: 28px
- **Menu item icon size**: 20px
- **Font size (label)**: 14px
- **Divider color**: Colors.grey[200]
- **Background**: Colors.white
- **Shadow blur**: 8px

## 🚀 Implementation Checklist

- [ ] Add new callbacks to CustomAppBar parameters
- [ ] Import UserProfilePopoverContent
- [ ] Create \_profileController in State
- [ ] Add profile controller initialization in build()
- [ ] Add profile controller disposal in dispose()
- [ ] Test avatar click opens popover
- [ ] Test all menu items
- [ ] Test dark mode toggle
- [ ] Implement callback handlers in parent widget

## 💡 Pro Tips

1. Use DiceBear API for test avatars:

   ```dart
   'https://api.dicebear.com/7.x/avataaars/svg?seed=$userName'
   ```

2. Get email from Firebase:

   ```dart
   userEmail: FirebaseAuth.instance.currentUser?.email ?? 'user@example.com'
   ```

3. Store dark mode in SharedPreferences:

   ```dart
   await prefs.setBool('isDarkMode', isDarkMode);
   ```

4. Hide popover after action:
   ```dart
   onSettingsTap: () {
     _profileController.hide();
     Navigator.push(...);
   }
   ```

## 🐛 Quick Troubleshooting

| Problem                | Solution                                 |
| ---------------------- | ---------------------------------------- |
| Popover doesn't open   | Check \_profileController initialization |
| Menu items don't work  | Verify callbacks are defined             |
| Avatar image broken    | Use valid NetworkImage URL               |
| Dark mode not working  | Ensure state updates properly            |
| Popover position wrong | Check childAnchor/popoverAnchor values   |

## 📊 Feature Comparison

| Feature          | Implemented | Customizable |
| ---------------- | ----------- | ------------ |
| User avatar      | ✅          | ✅           |
| PRO badge        | ✅          | ✅           |
| Dark mode toggle | ✅          | ✅           |
| Menu items       | ✅          | ✅           |
| Icons            | ✅          | ✅           |
| Colors           | ✅          | ✅           |
| Size/Width       | ✅          | ✅           |

---

**Status**: Production Ready ✅  
**Last Updated**: December 4, 2025

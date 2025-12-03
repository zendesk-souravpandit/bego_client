# User Profile Popover Component

A beautiful, reusable user profile menu popover component that displays user information, settings options, and account management features. Designed to match the Wei Chan reference UI with dark mode toggle, activity tracking, integrations, and logout functionality.

## 📁 Component Structure

```
notifications/
├── widgets/
│   ├── user_profile_popover_content.dart    # Main profile popover widget
│   ├── notification_tile.dart
│   ├── notification_list.dart
│   └── notification_popover_content.dart
├── models/
│   └── notification_item.dart
├── notifications.dart                        # Barrel export
└── sample_notifications.dart
```

## 🎯 Features

- **User Profile Header**
  - Avatar (circular with network image)
  - User name and email display
  - PRO badge for premium users
- **Dark Mode Toggle**
  - Switch control for theme switching
  - Easy access to theme preferences
- **Menu Items**
  - Activity tracking
  - Integrations management
  - Settings access
  - Add account option
  - Logout button
- **Footer**

  - Version information
  - Terms & Conditions link

- **Styling**
  - Clean white background
  - Smooth shadows and rounded corners
  - Proper spacing and typography
  - Hover effects on menu items
  - Responsive design

## 🚀 Integration

### 1. Add callbacks to CustomAppBar

```dart
CustomAppBar(
  title: 'Dashboard',
  userName: 'Wei Chan',
  userRole: 'Product Manager',
  userImage: 'https://...',
  isDarkMode: isDarkMode,
  onActivityTap: () {
    // Handle activity tap
  },
  onIntegrationsTap: () {
    // Handle integrations tap
  },
  onSettingsTap: () {
    // Handle settings tap
  },
  onAddAccountTap: () {
    // Handle add account
  },
  onLogoutTap: () {
    // Handle logout
  },
  onDarkModeToggle: () {
    // Toggle dark mode
    setState(() {
      isDarkMode = !isDarkMode;
    });
  },
)
```

### 2. Implementation Example

```dart
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
        userName: 'Wei Chan',
        userRole: 'Product Manager',
        userImage: 'https://...',
        isDarkMode: isDarkMode,
        onActivityTap: () => print('Activity tapped'),
        onIntegrationsTap: () => print('Integrations tapped'),
        onSettingsTap: () => _navigateToSettings(),
        onAddAccountTap: () => _showAddAccountDialog(),
        onLogoutTap: () => _handleLogout(),
        onDarkModeToggle: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
      body: YourContent(),
    );
  }

  void _navigateToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SettingsPage()),
    );
  }

  void _showAddAccountDialog() {
    // Show add account dialog
  }

  void _handleLogout() {
    // Perform logout logic
  }
}
```

## 🎨 Customization

### Change Colors

Edit the `UserProfilePopoverContent` widget:

```dart
// User info background
Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blue[50],  // Change this
    borderRadius: BorderRadius.circular(12),
  ),
  // ...
)

// PRO badge color
Container(
  decoration: BoxDecoration(
    color: Colors.amber[100],  // Change this
    borderRadius: BorderRadius.circular(3),
  ),
  // ...
)
```

### Change Icons

```dart
_buildMenuItem(
  icon: Icons.dashboard,  // Change icon
  label: 'Dashboard',
  onTap: onDashboardTap,
),
```

### Change Width

In `UserProfilePopoverContent.build()`:

```dart
Container(
  width: 350,  // Change width (default: 280)
  decoration: BoxDecoration(
    // ...
  ),
)
```

## 🔄 Callback Reference

| Callback            | Type            | Description                                  |
| ------------------- | --------------- | -------------------------------------------- |
| `onActivityTap`     | `VoidCallback?` | Called when Activity menu item is tapped     |
| `onIntegrationsTap` | `VoidCallback?` | Called when Integrations menu item is tapped |
| `onSettingsTap`     | `VoidCallback?` | Called when Settings menu item is tapped     |
| `onAddAccountTap`   | `VoidCallback?` | Called when Add Account menu item is tapped  |
| `onLogoutTap`       | `VoidCallback?` | Called when Logout menu item is tapped       |
| `onDarkModeToggle`  | `VoidCallback?` | Called when dark mode toggle is switched     |

## 🎯 Behavior

1. **Opening the Popover**

   - Click/tap on the user avatar in the app bar
   - Popover appears aligned to the top-right of the avatar

2. **Menu Navigation**

   - Hover over menu items for visual feedback
   - Tap menu items to perform actions
   - Popover automatically closes after selection

3. **Dark Mode**
   - Toggle dark mode switch
   - Callback fires immediately for theme switching
   - Switch state reflects current theme

## 📐 Layout Structure

```
┌─────────────────────────────┐
│ [Avatar] Name              │
│          email@email.com   │  [PRO Badge]
├─────────────────────────────┤
│ 🌙 Dark Mode         [Toggle]
├─────────────────────────────┤
│ 📊 Activity                 │
│ 🔗 Integrations            │
│ ⚙️  Settings                │
├─────────────────────────────┤
│ ➕ Add Account             │
│ 🚪 Logout                  │
├─────────────────────────────┤
│ v1.5.69 · Terms & Cond.    │
└─────────────────────────────┘
```

## 🔧 Tips & Tricks

1. **Network Images** - Use `NetworkImage` for avatar URLs:

   ```dart
   CircleAvatar(
     radius: 28,
     backgroundImage: NetworkImage(userImage),
   )
   ```

2. **Placeholder Avatar** - Use DiceBear API for testing:

   ```dart
   'https://api.dicebear.com/7.x/avataaars/svg?seed=Felix'
   ```

3. **Email from Auth** - Get user email from your auth provider:

   ```dart
   userEmail: FirebaseAuth.instance.currentUser?.email ?? 'user@example.com'
   ```

4. **Disable Menu Items** - Wrap item in visibility logic:
   ```dart
   if (hasPermission)
     _buildMenuItem(
       icon: Icons.settings,
       label: 'Settings',
       onTap: onSettingsTap,
     ),
   ```

## 🐛 Troubleshooting

**Issue**: Popover doesn't appear

- **Solution**: Ensure BePopover controller is properly initialized
- **Check**: `_profileController` is created in State

**Issue**: Menu items not responding

- **Solution**: Verify callbacks are not null before calling
- **Check**: All callbacks wrapped with `?.call()`

**Issue**: Avatar image not loading

- **Solution**: Verify NetworkImage URL is accessible
- **Check**: Use placeholder or errorBuilder in real implementation

**Issue**: Popover closes on click

- **Solution**: This is expected behavior, implement navigation in callbacks
- **Check**: Use `_profileController.hide()` in callback before navigation

## 📝 Best Practices

1. **State Management** - Store dark mode state in a provider or bloc for app-wide consistency
2. **Navigation** - Handle navigation inside callbacks, not in the widget itself
3. **Error Handling** - Add error boundaries around network image loading
4. **Accessibility** - Add semantic labels to menu items for screen readers
5. **Performance** - Memoize callbacks to prevent unnecessary rebuilds

## 🔗 Related Components

- `CustomAppBar` - Main app bar containing the profile popover
- `NotificationPopoverContent` - Sibling popover for notifications
- `BePopover` - Base BeUI component for overlay positioning
- `BeTheme` - Design system integration

## 📄 Files Location

- **Component**: `/lib/pages/home/components/notifications/widgets/user_profile_popover_content.dart`
- **AppBar Integration**: `/lib/pages/home/components/custom_app_bar.dart`
- **Usage Example**: See integration section above

---

**Created**: December 4, 2025  
**Framework**: Flutter with BeUI  
**Status**: Production Ready

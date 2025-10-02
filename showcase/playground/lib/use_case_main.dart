import 'package:beui/foundation.dart';
import 'package:beui/mulitchild.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BeTheme(colors: BeColorsLight(), child: AvatarExample())));
}

class AvatarExample extends StatelessWidget {
  const AvatarExample({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BeAvatar Component Showcase'),
        backgroundColor: BeColors.primary,
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle('Basic Avatars'),
            SizedBox(height: 16),
            _BasicAvatarsSection(),

            SizedBox(height: 32),
            _SectionTitle('Avatar Sizes'),
            SizedBox(height: 16),
            _AvatarSizesSection(),

            SizedBox(height: 32),
            _SectionTitle('Avatar Styles'),
            SizedBox(height: 16),
            _AvatarStylesSection(),

            SizedBox(height: 32),
            _SectionTitle('Status Indicators'),
            SizedBox(height: 16),
            _StatusIndicatorsSection(),

            SizedBox(height: 32),
            _SectionTitle('Avatars with Badges'),
            SizedBox(height: 16),
            _AvatarBadgesSection(),

            SizedBox(height: 32),
            _SectionTitle('Interactive Avatars'),
            SizedBox(height: 16),
            _InteractiveAvatarsSection(),

            SizedBox(height: 32),
            _SectionTitle('Avatar Gallery'),
            SizedBox(height: 16),
            _AvatarGallerySection(),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(final BuildContext context) {
    return Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: BeColors.gray800));
  }
}

class _BasicAvatarsSection extends StatelessWidget {
  const _BasicAvatarsSection();

  @override
  Widget build(final BuildContext context) {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        BeAvatar.initials(initials: 'JD', style: BeAvatarStyle.hexagon),
        BeAvatar.initials(initials: 'AB', backgroundColor: BeColors.secondary),
        BeAvatar.custom(backgroundColor: BeColors.tertiary, child: Icon(Icons.person_2_rounded, color: Colors.white)),
        BeAvatar(), // Default fallback
      ],
    );
  }
}

class _AvatarSizesSection extends StatelessWidget {
  const _AvatarSizesSection();

  @override
  Widget build(final BuildContext context) {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        BeAvatar.initials(initials: 'xs', size: BeAvatarSize.xsmall),
        BeAvatar.initials(initials: 'S', size: BeAvatarSize.small),
        BeAvatar.initials(initials: 'M', size: BeAvatarSize.medium),
        BeAvatar.initials(initials: 'L', size: BeAvatarSize.large),
        BeAvatar.initials(initials: 'XL', size: BeAvatarSize.extraLarge),
      ],
    );
  }
}

class _AvatarStylesSection extends StatelessWidget {
  const _AvatarStylesSection();

  @override
  Widget build(final BuildContext context) {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        BeAvatar.initials(initials: 'C', style: BeAvatarStyle.circle, backgroundColor: BeColors.primary),
        BeAvatar.initials(initials: 'R', style: BeAvatarStyle.rounded, backgroundColor: BeColors.secondary),
        BeAvatar.initials(initials: 'S', style: BeAvatarStyle.square, backgroundColor: BeColors.tertiary),
      ],
    );
  }
}

class _StatusIndicatorsSection extends StatelessWidget {
  const _StatusIndicatorsSection();

  @override
  Widget build(final BuildContext context) {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        BeAvatar.initials(initials: 'ON', status: BeAvatarStatus.online, rounded: true),
        BeAvatar.initials(initials: 'OF', status: BeAvatarStatus.offline),
        BeAvatar.initials(initials: 'AW', status: BeAvatarStatus.away),
        BeAvatar.initials(initials: 'BY', status: BeAvatarStatus.busy),
      ],
    );
  }
}

class _AvatarBadgesSection extends StatelessWidget {
  const _AvatarBadgesSection();

  @override
  Widget build(final BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        const BeAvatar.initials(
          initials: 'NT',
          showBadge: true,
          badgeContent: _NotificationBadge(count: 3),
          badgePosition: BeBadgePosition.topRight,
        ),
        const BeAvatar.initials(
          initials: 'ST',
          showBadge: true,
          badgeContent: _StarBadge(),
          badgePosition: BeBadgePosition.topLeft,
        ),
        const BeAvatar.initials(
          initials: 'VR',
          showBadge: true,
          badgeContent: _VerifiedBadge(),
          badgePosition: BeBadgePosition.bottomRight,
        ),
        BeAvatar.initials(
          initials: 'AD',
          showBadge: true,
          badgeContent: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(color: BeColors.error, shape: BoxShape.circle),
            child: const Icon(Icons.admin_panel_settings, color: Colors.white, size: 16),
          ),
          badgePosition: BeBadgePosition.topRight,
        ),
      ],
    );
  }
}

class _InteractiveAvatarsSection extends StatefulWidget {
  const _InteractiveAvatarsSection();

  @override
  State<_InteractiveAvatarsSection> createState() => _InteractiveAvatarsSectionState();
}

class _InteractiveAvatarsSectionState extends State<_InteractiveAvatarsSection> {
  String _selectedAvatar = '';

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            BeAvatar.image(
              image: const NetworkImage('https://dummyjson.com/icon/abc123/150'),
              elevation: 2,
              border: Border.all(color: Colors.green),
            ),

            BeAvatar.initials(initials: 'T1', onTap: () => _onAvatarTap('User 1'), elevation: 2),
            BeAvatar.initials(
              initials: 'T2',
              onTap: () => _onAvatarTap('User 2'),
              elevation: 4,
              backgroundColor: BeColors.secondary,
            ),
            BeAvatar.initials(
              initials: 'T3',
              onTap: () => _onAvatarTap('User 3'),
              elevation: 6,
              backgroundColor: BeColors.tertiary,
            ),
          ],
        ),
        if (_selectedAvatar.isNotEmpty) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: BeColors.gray100, borderRadius: BorderRadius.circular(8)),
            child: Text(
              'Selected: $_selectedAvatar',
              style: const TextStyle(fontWeight: FontWeight.w500, color: BeColors.gray700),
            ),
          ),
        ],
      ],
    );
  }

  void _onAvatarTap(final String user) {
    setState(() {
      _selectedAvatar = user;
    });
  }
}

class _AvatarGallerySection extends StatelessWidget {
  const _AvatarGallerySection();

  @override
  Widget build(final BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        // Row 1: Different users with various states
        const BeAvatar.initials(rounded: false, initials: 'AM', status: BeAvatarStatus.online),
        const BeAvatar.initials(
          rounded: false,
          initials: 'BT',
          status: BeAvatarStatus.busy,
          showBadge: true,
          badgeContent: _NotificationBadge(count: 9),
        ),
        const BeAvatar.initials(
          rounded: false,
          initials: 'CF',
          status: BeAvatarStatus.away,
          style: BeAvatarStyle.rounded,
        ),
        const BeAvatar.initials(
          rounded: false,
          initials: 'DK',
          status: BeAvatarStatus.offline,
          style: BeAvatarStyle.square,
        ),

        // Row 2: Different backgrounds and styles
        const BeAvatar.initials(
          rounded: false,
          initials: 'EL',
          backgroundColor: BeColors.success,
          style: BeAvatarStyle.circle,
        ),
        const BeAvatar.initials(
          rounded: false,
          initials: 'FG',
          backgroundColor: BeColors.warning,
          style: BeAvatarStyle.rounded,
        ),
        const BeAvatar.initials(
          rounded: false,
          initials: 'GH',
          backgroundColor: BeColors.error,
          style: BeAvatarStyle.square,
        ),
        const BeAvatar.initials(
          rounded: false,
          initials: 'HI',
          backgroundColor: BeColors.info,
          style: BeAvatarStyle.circle,
        ),

        // Row 3: Custom content and badges
        const BeAvatar.custom(backgroundColor: BeColors.gray600, child: Icon(Icons.camera_alt, color: Colors.white)),
        const BeAvatar.custom(backgroundColor: BeColors.purple, child: Icon(Icons.music_note, color: Colors.white)),
        const BeAvatar.initials(
          initials: 'VIP',
          backgroundColor: BeColors.orange,
          showBadge: true,
          badgeContent: _CrownBadge(),
        ),
        const BeAvatar(), // Default fallback
      ],
    );
  }
}

// Badge Components
class _NotificationBadge extends StatelessWidget {
  const _NotificationBadge({required this.count});

  final int count;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: 20,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: const BoxDecoration(color: BeColors.error, shape: BoxShape.circle),
      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      child: Center(
        child: Text(
          count > 99 ? '99+' : count.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _StarBadge extends StatelessWidget {
  const _StarBadge();

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(color: BeColors.warning, shape: BoxShape.circle),
      child: const Icon(Icons.star, color: Colors.white, size: 14),
    );
  }
}

class _VerifiedBadge extends StatelessWidget {
  const _VerifiedBadge();

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(color: BeColors.success, shape: BoxShape.circle),
      child: const Icon(Icons.check, color: Colors.white, size: 14),
    );
  }
}

class _CrownBadge extends StatelessWidget {
  const _CrownBadge();

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(color: BeColors.warning, shape: BoxShape.circle),
      child: const Icon(Icons.workspace_premium, color: Colors.white, size: 16),
    );
  }
}
//                                onChanged(option.value);
//                              }
//                            }
//                            : null,
//                    child: Container(
//                      padding: const EdgeInsets.symmetric(vertical: 8),
//                      child: Row(
//                        children: [
//                          Checkbox(
//                            value: selected,
//                            onChanged:
//                                enabled
//                                    ? (_) {
//                                      state.didChange(option.value);
//                                      if (onChanged != null) {
//                                        onChanged(option.value);
//                                      }
//                                    }
//                                    : null,
//                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//                            activeColor: Colors.blue,
//                            checkColor: Colors.white,
//                          ),
//                          const SizedBox(width: 12),
//                          Text(option.label, style: TextStyle(color: enabled ? Colors.black : Colors.grey.shade400)),
//                        ],
//                      ),
//                    ),
//                  );
//                }),
//                if (state.hasError)
//                  Padding(
//                    padding: const EdgeInsets.only(top: 5),
//                    child: Text(
//                      state.errorText ?? '',
//                      style: TextStyle(color: Theme.of(state.context).colorScheme.error, fontSize: 12),
//                    ),
//                  ),
//              ],
//            );
//          },
//        );

//   final List<CustomRadioOption<T>> options;
// }

// // // Example App demonstrating the widget
// // void main() {
// //   runApp(const MaterialApp(home: CustomCheckboxRadioExample()));
// // }

// class CustomCheckboxRadioExample extends StatefulWidget {
//   const CustomCheckboxRadioExample({super.key});

//   @override
//   State<CustomCheckboxRadioExample> createState() => _CustomCheckboxRadioExampleState();
// }

// class _CustomCheckboxRadioExampleState extends State<CustomCheckboxRadioExample> {
//   final _formKey = GlobalKey<FormState>();
//   String? _selectedFruit;

//   final List<CustomRadioOption<String>> _fruitOptions = [
//     CustomRadioOption(value: 'apple', label: 'Apple'),
//     CustomRadioOption(value: 'banana', label: 'Banana'),
//     CustomRadioOption(value: 'orange', label: 'Orange'),
//   ];

//   void _submit() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected fruit: $_selectedFruit')));
//     }
//   }

//   void _reset() {
//     _formKey.currentState!.reset();
//     setState(() {
//       _selectedFruit = null;
//     });
//   }

//   @override
//   Widget build(final BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Custom Rounded Checkbox Radio')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomCheckboxRadioFormField<String>(
//                 options: _fruitOptions,
//                 initialValue: _selectedFruit,
//                 onSaved: (final value) => _selectedFruit = value,
//                 validator: (final value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select a fruit';
//                   }
//                   return null;
//                 },
//                 onChanged: (final value) {
//                   setState(() {
//                     _selectedFruit = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 children: [
//                   ElevatedButton(onPressed: _submit, child: const Text('Submit')),
//                   const SizedBox(width: 16),
//                   OutlinedButton(onPressed: _reset, child: const Text('Reset')),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

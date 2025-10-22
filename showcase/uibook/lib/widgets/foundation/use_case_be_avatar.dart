import 'package:beui/foundation.dart';
import 'package:beui/mulitchild.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeAvatar', path: 'widget/foundation', type: BeAvatar)
Widget useCaseBeAvatar(final BuildContext context) {
  final size = context.knobs.object.dropdown<BeAvatarSize>(label: 'Size', options: BeAvatarSize.values);

  final style = context.knobs.object.dropdown<BeAvatarStyle>(label: 'Style', options: BeAvatarStyle.values);

  final status = context.knobs.object.dropdown<BeAvatarStatus>(label: 'Status', options: BeAvatarStatus.values);

  final avatarType = context.knobs.object.dropdown<_AvatarType>(label: 'Avatar Type', options: _AvatarType.values);

  final initials = context.knobs.string(label: 'Initials', initialValue: 'JD');

  final showBadge = context.knobs.boolean(label: 'Show Badge', initialValue: false);

  final badgePosition = context.knobs.object.dropdown<BeBadgePosition>(
    label: 'Badge Position',
    options: BeBadgePosition.values,
  );

  final elevation = context.knobs.double.slider(label: 'Elevation', initialValue: 0, min: 0, max: 10);

  final backgroundColor = context.knobs.colorOrNull(label: 'Background Color');

  final foregroundColor = context.knobs.colorOrNull(label: 'Foreground Color');

  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeAvatar Component', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Main configurable avatar
          Center(
            child: _buildConfigurableAvatar(
              avatarType: avatarType,
              initials: initials,
              size: size,
              style: style,
              status: status,
              showBadge: showBadge,
              badgePosition: badgePosition,
              elevation: elevation,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
            ),
          ),

          const SizedBox(height: 32),

          // Showcase different variations
          const Text('Size Variations', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children:
                BeAvatarSize.values
                    .map((final size) => BeAvatar.initials(initials: _getSizeLabel(size), size: size, style: style))
                    .toList(),
          ),

          const SizedBox(height: 24),
          const Text('Style Variations', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children:
                BeAvatarStyle.values
                    .map(
                      (final avatarStyle) => BeAvatar.initials(
                        initials: _getStyleLabel(avatarStyle),
                        size: size,
                        style: avatarStyle,
                        backgroundColor: _getStyleColor(avatarStyle),
                      ),
                    )
                    .toList(),
          ),

          const SizedBox(height: 24),
          const Text('Status Variations', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children:
                BeAvatarStatus.values
                    .where((final s) => s != BeAvatarStatus.none)
                    .map(
                      (final avatarStatus) => BeAvatar.initials(
                        initials: _getStatusLabel(avatarStatus),
                        size: size,
                        style: style,
                        status: avatarStatus,
                      ),
                    )
                    .toList(),
          ),

          const SizedBox(height: 24),
          const Text('Badge Examples', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              BeAvatar.initials(
                initials: 'NT',
                size: size,
                style: style,
                showBadge: true,
                badgeContent: _buildNotificationBadge(3),
                badgePosition: BeBadgePosition.topRight,
              ),
              BeAvatar.initials(
                initials: 'ST',
                size: size,
                style: style,
                showBadge: true,
                badgeContent: _buildStarBadge(),
                badgePosition: BeBadgePosition.topLeft,
              ),
              BeAvatar.initials(
                initials: 'VF',
                size: size,
                style: style,
                showBadge: true,
                badgeContent: _buildVerifiedBadge(),
                badgePosition: BeBadgePosition.bottomRight,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

enum _AvatarType { initials, icon, fallback }

Widget _buildConfigurableAvatar({
  required final _AvatarType avatarType,
  required final String initials,
  required final BeAvatarSize size,
  required final BeAvatarStyle style,
  required final BeAvatarStatus status,
  required final bool showBadge,
  required final BeBadgePosition badgePosition,
  required final double elevation,
  final Color? backgroundColor,
  final Color? foregroundColor,
}) {
  final Widget badgeContent = _buildNotificationBadge(5);

  switch (avatarType) {
    case _AvatarType.initials:
      return BeAvatar.initials(
        initials: initials,
        size: size,
        style: style,
        status: status,
        showBadge: showBadge,
        badgeContent: badgeContent,
        badgePosition: badgePosition,
        elevation: elevation,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      );
    case _AvatarType.icon:
      return BeAvatar.custom(
        size: size,
        style: style,
        status: status,
        showBadge: showBadge,
        badgeContent: badgeContent,
        badgePosition: badgePosition,
        elevation: elevation,
        backgroundColor: backgroundColor ?? BeColors.secondary,
        foregroundColor: foregroundColor,
        child: const Icon(Icons.person, color: Colors.white),
      );
    case _AvatarType.fallback:
      return BeAvatar(
        size: size,
        style: style,
        status: status,
        showBadge: showBadge,
        badgeContent: badgeContent,
        badgePosition: badgePosition,
        elevation: elevation,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      );
  }
}

Widget _buildNotificationBadge(final int count) {
  return Container(
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

Widget _buildStarBadge() {
  return Container(
    width: 20,
    height: 20,
    decoration: const BoxDecoration(color: BeColors.warning, shape: BoxShape.circle),
    child: const Icon(Icons.star, color: Colors.white, size: 14),
  );
}

Widget _buildVerifiedBadge() {
  return Container(
    width: 20,
    height: 20,
    decoration: const BoxDecoration(color: BeColors.success, shape: BoxShape.circle),
    child: const Icon(Icons.check, color: Colors.white, size: 14),
  );
}

String _getSizeLabel(final BeAvatarSize size) {
  switch (size) {
    case BeAvatarSize.xsmall:
      return 'S';
    case BeAvatarSize.small:
      return 'S';
    case BeAvatarSize.medium:
      return 'M';
    case BeAvatarSize.large:
      return 'L';
    case BeAvatarSize.extraLarge:
      return 'XL';
  }
}

String _getStyleLabel(final BeAvatarStyle style) {
  switch (style) {
    case BeAvatarStyle.hexagon:
      return 'H';
    case BeAvatarStyle.circle:
      return 'C';
    case BeAvatarStyle.rounded:
      return 'R';
    case BeAvatarStyle.square:
      return 'S';
  }
}

String _getStatusLabel(final BeAvatarStatus status) {
  switch (status) {
    case BeAvatarStatus.online:
      return 'ON';
    case BeAvatarStatus.offline:
      return 'OF';
    case BeAvatarStatus.away:
      return 'AW';
    case BeAvatarStatus.busy:
      return 'BY';
    case BeAvatarStatus.none:
      return '';
  }
}

Color _getStyleColor(final BeAvatarStyle style) {
  switch (style) {
    case BeAvatarStyle.hexagon:
      return BeColors.secondary;
    case BeAvatarStyle.circle:
      return BeColors.primary;
    case BeAvatarStyle.rounded:
      return BeColors.secondary;
    case BeAvatarStyle.square:
      return BeColors.tertiary;
  }
}

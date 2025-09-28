import 'package:becomponent/selector.dart';
import 'package:beui/beui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Real-world form scenarios using BeSelectorCombobox
@widgetbook.UseCase(name: 'User Registration Form', type: BeSelectorCombobox)
Widget userRegistrationForm(final BuildContext context) {
  return _FormWrapper(
    title: 'Create Account',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BeInput.outlined(labelText: 'Full Name', hintText: 'Enter your full name'),
        const SizedBox(height: 16),
        const BeInput.outlined(labelText: 'Email', hintText: 'your@email.com'),
        const SizedBox(height: 16),
        BeSelectorCombobox<DepartmentOption>(
          title: 'Department',
          description: 'Select your department',
          placeholder: 'Choose department...',
          options: _getDepartmentOptions(),
          onChange: (final selected) => debugPrint('Department: ${selected?.label}'),
          renderIcon: (final dept) => Icon(_getDepartmentIcon(dept.value), size: 20, color: Colors.blue),
        ),
        const SizedBox(height: 16),
        BeSelectorCombobox<RoleOption>(
          title: 'Role',
          description: 'Your job role',
          placeholder: 'Select role...',
          options: _getRoleOptions(),
          onChange: (final selected) => debugPrint('Role: ${selected?.label}'),
        ),
        const SizedBox(height: 16),
        BeSelectorCombobox<SkillOption>(
          title: 'Skills',
          description: 'Select your skills (max 5)',
          placeholder: 'Add skills...',
          isMultiSelect: true,
          maxTags: 3,
          options: _getSkillOptions(),
          onChange: (final selected) => debugPrint('Skills: ${(selected as List).length}'),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: BeButton.outline(onPressed: () => debugPrint('Cancel'), child: const BeText.labelLarge('Cancel')),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: BeButton.primary(
                onPressed: () => debugPrint('Create Account'),
                child: const BeText.labelLarge('Create Account'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Issue Tracker Form', type: BeSelectorCombobox)
Widget issueTrackerForm(final BuildContext context) {
  return _FormWrapper(
    title: 'Create Issue',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BeInput.outlined(labelText: 'Issue Title', hintText: 'Brief description of the issue'),
        const SizedBox(height: 16),
        BeSelectorCombobox<ProjectOption>(
          title: 'Project',
          description: 'Which project is this for?',
          placeholder: 'Select project...',
          options: _getProjectOptions(),
          onChange: (final selected) => debugPrint('Project: ${selected?.label}'),
          message: const FieldMessage(type: ValidationType.error, content: 'Project selection is required'),
        ),
        const SizedBox(height: 16),
        BeSelectorCombobox<PriorityOption>(
          title: 'Priority',
          placeholder: 'Set priority...',
          options: _getPriorityOptions(),
          onChange: (final selected) => debugPrint('Priority: ${selected?.label}'),
          renderOption:
              (final priority) => Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(color: _getPriorityColor(priority.value), shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 8),
                  BeText.bodyMedium(priority.label),
                ],
              ),
        ),
        const SizedBox(height: 16),
        BeSelectorCombobox<UserOption>(
          title: 'Assignees',
          description: 'Who should work on this?',
          placeholder: 'Assign to team members...',
          isMultiSelect: true,
          maxTags: 2,
          options: _getTeamMemberOptions(),
          onChange: (final selected) => debugPrint('Assigned: ${(selected as List).length}'),
          renderOption:
              (final user) => Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: user.isOnline ? Colors.green : Colors.grey,
                    child: BeText.labelSmall(user.name.substring(0, 1).toUpperCase(), color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [BeText.bodyMedium(user.name), BeText.bodySmall(user.role, color: Colors.grey[600])],
                    ),
                  ),
                  if (user.isOnline)
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                    ),
                ],
              ),
        ),
        const SizedBox(height: 16),
        const BeInput.outlined(labelText: 'Description', hintText: 'Detailed description of the issue...', maxLines: 4),
        const SizedBox(height: 24),
        BeButton.primary(
          onPressed: () => debugPrint('Issue Created'),
          fullWidth: true,
          child: const BeText.labelLarge('Create Issue'),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'E-commerce Filters', type: BeSelectorCombobox)
Widget ecommerceFilters(final BuildContext context) {
  return _FormWrapper(
    title: 'Product Filters',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BeSelectorCombobox<CategoryOption>(
          title: 'Category',
          placeholder: 'All categories',
          options: _getCategoryOptions(),
          onChange: (final selected) => debugPrint('Category: ${selected?.label}'),
        ),
        const SizedBox(height: 16),
        BeSelectorCombobox<BrandOption>(
          title: 'Brands',
          description: 'Select multiple brands',
          placeholder: 'All brands',
          isMultiSelect: true,
          maxTags: 2,
          options: _getBrandOptions(),
          onChange: (final selected) => debugPrint('Brands: ${(selected as List).length}'),
        ),
        const SizedBox(height: 16),
        BeSelectorCombobox<PriceRangeOption>(
          title: 'Price Range',
          placeholder: 'Any price',
          options: _getPriceRangeOptions(),
          onChange: (final selected) => debugPrint('Price: ${selected?.label}'),
        ),
        const SizedBox(height: 16),
        BeSelectorCombobox<TagOption>(
          title: 'Features',
          description: 'Product features and tags',
          placeholder: 'Add features...',
          isMultiSelect: true,
          maxTags: 4,
          options: _getFeatureOptions(),
          onChange: (final selected) => debugPrint('Features: ${(selected as List).length}'),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: BeButton.outline(
                onPressed: () => debugPrint('Clear Filters'),
                child: const BeText.labelLarge('Clear'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: BeButton.primary(
                onPressed: () => debugPrint('Apply Filters'),
                child: const BeText.labelLarge('Apply Filters'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// Wrapper for consistent form styling
class _FormWrapper extends StatelessWidget {
  const _FormWrapper({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return BeCard.elevated(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [BeText.titleLarge(title), const SizedBox(height: 24), child],
        ),
      ),
    );
  }
}

// Helper functions and data providers
RenderOptions<DepartmentOption> _getDepartmentOptions() {
  final options = [
    const DepartmentOption(value: 'engineering', label: 'Engineering'),
    const DepartmentOption(value: 'design', label: 'Design'),
    const DepartmentOption(value: 'product', label: 'Product'),
    const DepartmentOption(value: 'marketing', label: 'Marketing'),
    const DepartmentOption(value: 'sales', label: 'Sales'),
    const DepartmentOption(value: 'hr', label: 'Human Resources'),
  ];

  return RenderOptions<DepartmentOption>(
    fetchSearchOptions: (final searchText) => debugPrint('Dept search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

IconData _getDepartmentIcon(final String value) {
  switch (value) {
    case 'engineering':
      return Icons.code;
    case 'design':
      return Icons.palette;
    case 'product':
      return Icons.lightbulb;
    case 'marketing':
      return Icons.campaign;
    case 'sales':
      return Icons.trending_up;
    case 'hr':
      return Icons.people;
    default:
      return Icons.business;
  }
}

RenderOptions<RoleOption> _getRoleOptions() {
  final options = [
    const RoleOption(value: 'junior', label: 'Junior Developer'),
    const RoleOption(value: 'senior', label: 'Senior Developer'),
    const RoleOption(value: 'lead', label: 'Tech Lead'),
    const RoleOption(value: 'manager', label: 'Engineering Manager'),
    const RoleOption(value: 'designer', label: 'Product Designer'),
    const RoleOption(value: 'pm', label: 'Product Manager'),
  ];

  return RenderOptions<RoleOption>(
    fetchSearchOptions: (final searchText) => debugPrint('Role search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

RenderOptions<SkillOption> _getSkillOptions() {
  final options = [
    const SkillOption(value: 'flutter', label: 'Flutter'),
    const SkillOption(value: 'react', label: 'React'),
    const SkillOption(value: 'nodejs', label: 'Node.js'),
    const SkillOption(value: 'python', label: 'Python'),
    const SkillOption(value: 'design', label: 'UI/UX Design'),
    const SkillOption(value: 'figma', label: 'Figma'),
    const SkillOption(value: 'aws', label: 'AWS'),
    const SkillOption(value: 'docker', label: 'Docker'),
  ];

  return RenderOptions<SkillOption>(
    fetchSearchOptions: (final searchText) => debugPrint('Skill search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

RenderOptions<ProjectOption> _getProjectOptions() {
  final options = [
    const ProjectOption(value: 'mobile', label: 'Mobile App'),
    const ProjectOption(value: 'web', label: 'Web Platform'),
    const ProjectOption(value: 'api', label: 'API Gateway'),
    const ProjectOption(value: 'dashboard', label: 'Admin Dashboard'),
  ];

  return RenderOptions<ProjectOption>(
    fetchSearchOptions: (final searchText) => debugPrint('Project search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

RenderOptions<PriorityOption> _getPriorityOptions() {
  final options = [
    const PriorityOption(value: 'low', label: 'Low'),
    const PriorityOption(value: 'medium', label: 'Medium'),
    const PriorityOption(value: 'high', label: 'High'),
    const PriorityOption(value: 'critical', label: 'Critical'),
  ];

  return RenderOptions<PriorityOption>(
    fetchSearchOptions: (final searchText) => debugPrint('Priority search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

Color _getPriorityColor(final String value) {
  switch (value) {
    case 'low':
      return Colors.green;
    case 'medium':
      return Colors.orange;
    case 'high':
      return Colors.red;
    case 'critical':
      return Colors.purple;
    default:
      return Colors.grey;
  }
}

RenderOptions<UserOption> _getTeamMemberOptions() {
  final options = [
    const UserOption(value: 'alice', name: 'Alice Johnson', role: 'Frontend Developer', isOnline: true),
    const UserOption(value: 'bob', name: 'Bob Smith', role: 'Backend Developer', isOnline: false),
    const UserOption(value: 'carol', name: 'Carol Davis', role: 'Product Manager', isOnline: true),
    const UserOption(value: 'david', name: 'David Wilson', role: 'UI Designer', isOnline: true),
  ];

  return RenderOptions<UserOption>(
    fetchSearchOptions: (final searchText) => debugPrint('User search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

RenderOptions<CategoryOption> _getCategoryOptions() {
  final options = [
    const CategoryOption(value: 'electronics', label: 'Electronics'),
    const CategoryOption(value: 'clothing', label: 'Clothing'),
    const CategoryOption(value: 'books', label: 'Books'),
    const CategoryOption(value: 'home', label: 'Home & Garden'),
    const CategoryOption(value: 'sports', label: 'Sports & Outdoors'),
  ];

  return RenderOptions<CategoryOption>(
    fetchSearchOptions: (final searchText) => debugPrint('Category search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

RenderOptions<BrandOption> _getBrandOptions() {
  final options = [
    const BrandOption(value: 'apple', label: 'Apple'),
    const BrandOption(value: 'samsung', label: 'Samsung'),
    const BrandOption(value: 'nike', label: 'Nike'),
    const BrandOption(value: 'adidas', label: 'Adidas'),
    const BrandOption(value: 'sony', label: 'Sony'),
  ];

  return RenderOptions<BrandOption>(
    fetchSearchOptions: (final searchText) => debugPrint('Brand search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

RenderOptions<PriceRangeOption> _getPriceRangeOptions() {
  final options = [
    const PriceRangeOption(value: '0-50', label: 'Under \$50'),
    const PriceRangeOption(value: '50-100', label: '\$50 - \$100'),
    const PriceRangeOption(value: '100-200', label: '\$100 - \$200'),
    const PriceRangeOption(value: '200+', label: 'Over \$200'),
  ];

  return RenderOptions<PriceRangeOption>(
    fetchSearchOptions: (final searchText) => debugPrint('Price search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

RenderOptions<TagOption> _getFeatureOptions() {
  final options = [
    const TagOption(value: 'wireless', label: 'Wireless'),
    const TagOption(value: 'waterproof', label: 'Waterproof'),
    const TagOption(value: 'portable', label: 'Portable'),
    const TagOption(value: 'premium', label: 'Premium'),
    const TagOption(value: 'eco-friendly', label: 'Eco-friendly'),
    const TagOption(value: 'fast-shipping', label: 'Fast Shipping'),
  ];

  return RenderOptions<TagOption>(
    fetchSearchOptions: (final searchText) => debugPrint('Tag search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

// Option classes
class DepartmentOption implements SelectorOption {
  const DepartmentOption({required this.value, required this.label});
  @override
  final String value;
  @override
  final String label;
  @override
  bool get isDisabled => false;
  @override
  List<SelectorOption>? get options => null;
  @override
  bool operator ==(final Object other) => identical(this, other) || other is DepartmentOption && value == other.value;
  @override
  int get hashCode => value.hashCode;
}

class RoleOption implements SelectorOption {
  const RoleOption({required this.value, required this.label});
  @override
  final String value;
  @override
  final String label;
  @override
  bool get isDisabled => false;
  @override
  List<SelectorOption>? get options => null;
  @override
  bool operator ==(final Object other) => identical(this, other) || other is RoleOption && value == other.value;
  @override
  int get hashCode => value.hashCode;
}

class SkillOption implements SelectorOption {
  const SkillOption({required this.value, required this.label});
  @override
  final String value;
  @override
  final String label;
  @override
  bool get isDisabled => false;
  @override
  List<SelectorOption>? get options => null;
  @override
  bool operator ==(final Object other) => identical(this, other) || other is SkillOption && value == other.value;
  @override
  int get hashCode => value.hashCode;
}

class ProjectOption implements SelectorOption {
  const ProjectOption({required this.value, required this.label});
  @override
  final String value;
  @override
  final String label;
  @override
  bool get isDisabled => false;
  @override
  List<SelectorOption>? get options => null;
  @override
  bool operator ==(final Object other) => identical(this, other) || other is ProjectOption && value == other.value;
  @override
  int get hashCode => value.hashCode;
}

class PriorityOption implements SelectorOption {
  const PriorityOption({required this.value, required this.label});
  @override
  final String value;
  @override
  final String label;
  @override
  bool get isDisabled => false;
  @override
  List<SelectorOption>? get options => null;
  @override
  bool operator ==(final Object other) => identical(this, other) || other is PriorityOption && value == other.value;
  @override
  int get hashCode => value.hashCode;
}

class UserOption implements SelectorOption {
  const UserOption({required this.value, required this.name, required this.role, this.isOnline = false});
  @override
  final String value;
  final String name;
  final String role;
  final bool isOnline;
  @override
  String get label => name;
  @override
  bool get isDisabled => false;
  @override
  List<SelectorOption>? get options => null;
  @override
  bool operator ==(final Object other) => identical(this, other) || other is UserOption && value == other.value;
  @override
  int get hashCode => value.hashCode;
}

class CategoryOption implements SelectorOption {
  const CategoryOption({required this.value, required this.label});
  @override
  final String value;
  @override
  final String label;
  @override
  bool get isDisabled => false;
  @override
  List<SelectorOption>? get options => null;
  @override
  bool operator ==(final Object other) => identical(this, other) || other is CategoryOption && value == other.value;
  @override
  int get hashCode => value.hashCode;
}

class BrandOption implements SelectorOption {
  const BrandOption({required this.value, required this.label});
  @override
  final String value;
  @override
  final String label;
  @override
  bool get isDisabled => false;
  @override
  List<SelectorOption>? get options => null;
  @override
  bool operator ==(final Object other) => identical(this, other) || other is BrandOption && value == other.value;
  @override
  int get hashCode => value.hashCode;
}

class PriceRangeOption implements SelectorOption {
  const PriceRangeOption({required this.value, required this.label});
  @override
  final String value;
  @override
  final String label;
  @override
  bool get isDisabled => false;
  @override
  List<SelectorOption>? get options => null;
  @override
  bool operator ==(final Object other) => identical(this, other) || other is PriceRangeOption && value == other.value;
  @override
  int get hashCode => value.hashCode;
}

class TagOption implements SelectorOption {
  const TagOption({required this.value, required this.label});
  @override
  final String value;
  @override
  final String label;
  @override
  bool get isDisabled => false;
  @override
  List<SelectorOption>? get options => null;
  @override
  bool operator ==(final Object other) => identical(this, other) || other is TagOption && value == other.value;
  @override
  int get hashCode => value.hashCode;
}

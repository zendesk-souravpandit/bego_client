import 'package:becomponent/selector.dart';
import 'package:beui/beui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// UIBook showcase for BeSelectorCombobox component
@widgetbook.UseCase(name: 'Single Select Basic', type: BeSelectorCombobox)
Widget singleSelectBasic(final BuildContext context) {
  return _SelectorWrapper(
    child: BeSelectorCombobox<ProjectOption>(
      title: 'Select Project',
      description: 'Choose a single project from the list',
      placeholder: 'Search projects...',
      options: _getStaticProjectOptions(),
      onChange: (final selected) => debugPrint('Selected: ${selected?.label}'),
      renderIcon: (final option) => Icon(Icons.folder, size: 20, color: option.isActive ? Colors.green : Colors.grey),
    ),
  );
}

@widgetbook.UseCase(name: 'Multi Select with Tags', type: BeSelectorCombobox)
Widget multiSelectWithTags(final BuildContext context) {
  return _SelectorWrapper(
    child: BeSelectorCombobox<ProjectOption>(
      title: 'Select Multiple Projects',
      description: 'Choose multiple projects (max 3 tags shown)',
      placeholder: 'Search and select projects...',
      isMultiSelect: true,
      maxTags: 3,
      options: _getStaticProjectOptions(),
      onChange: (final selected) => debugPrint('Selected: ${(selected as List).length} projects'),
    ),
  );
}

@widgetbook.UseCase(name: 'API Integration Loading', type: BeSelectorCombobox)
Widget apiIntegrationLoading(final BuildContext context) {
  return _SelectorWrapper(
    child: BeSelectorCombobox<ApiProjectOption>(
      title: 'Remote Projects',
      description: 'Projects loaded from API with search',
      placeholder: 'Type to search remote projects...',
      options: _getLoadingApiOptions(),
      onChange: (final selected) => debugPrint('Selected: ${selected?.label}'),
      searchDebounceTime: const Duration(milliseconds: 300),
    ),
  );
}

@widgetbook.UseCase(name: 'With Validation Error', type: BeSelectorCombobox)
Widget withValidationError(final BuildContext context) {
  return _SelectorWrapper(
    child: BeSelectorCombobox<ProjectOption>(
      title: 'Required Project Selection',
      description: 'This field is required',
      placeholder: 'Please select a project...',
      options: _getStaticProjectOptions(),
      onChange: (final selected) => debugPrint('Selected: ${selected?.label}'),
      message: const FieldMessage(type: ValidationType.error, content: 'Please select a project to continue'),
    ),
  );
}

@widgetbook.UseCase(name: 'Grouped Options', type: BeSelectorCombobox)
Widget groupedOptions(final BuildContext context) {
  return _SelectorWrapper(
    child: BeSelectorCombobox<GroupedProjectOption>(
      title: 'Project Categories',
      description: 'Options organized by type',
      placeholder: 'Search across all categories...',
      options: _getGroupedOptions(),
      onChange: (final selected) => debugPrint('Selected: ${selected?.label}'),
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Rendering', type: BeSelectorCombobox)
Widget customRendering(final BuildContext context) {
  return _SelectorWrapper(
    child: BeSelectorCombobox<UserOption>(
      title: 'Team Members',
      description: 'Select team members with custom rendering',
      placeholder: 'Search team members...',
      isMultiSelect: true,
      maxTags: 2,
      options: _getUserOptions(),
      onChange: (final selected) => debugPrint('Selected: ${(selected as List).length} members'),
      renderOption:
          (final user) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [BeText.bodyMedium(user.name), BeText.bodySmall(user.email, color: Colors.grey[600])],
          ),
      renderIcon:
          (final user) => CircleAvatar(
            radius: 12,
            backgroundColor: user.isOnline ? Colors.green : Colors.grey,
            child: BeText.labelSmall(user.name.substring(0, 1).toUpperCase(), color: Colors.white),
          ),
    ),
  );
}

@widgetbook.UseCase(name: 'Form Integration', type: BeSelectorCombobox)
Widget formIntegration(final BuildContext context) {
  return _SelectorWrapper(
    child: Column(
      children: [
        const BeInput.outlined(labelText: 'Task Title', hintText: 'Enter task title...'),
        const SizedBox(height: 16),
        BeSelectorCombobox<ProjectOption>(
          title: 'Project',
          description: 'Select the project for this task',
          placeholder: 'Choose project...',
          options: _getStaticProjectOptions(),
          onChange: (final selected) => debugPrint('Project: ${selected?.label}'),
        ),
        const SizedBox(height: 16),
        BeSelectorCombobox<UserOption>(
          title: 'Assignees',
          description: 'Who should work on this?',
          placeholder: 'Add team members...',
          isMultiSelect: true,
          options: _getUserOptions(),
          onChange: (final selected) => debugPrint('Assignees: ${(selected as List).length}'),
        ),
        const SizedBox(height: 24),
        BeButton.primary(
          onPressed: () => debugPrint('Form submitted'),
          fullWidth: true,
          child: const BeText.labelLarge('Create Task'),
        ),
      ],
    ),
  );
}

// Wrapper widget for consistent styling
class _SelectorWrapper extends StatelessWidget {
  const _SelectorWrapper({required this.child});

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return BeCard(padding: const EdgeInsets.all(24), child: SizedBox(width: 400, child: child));
  }
}

// Helper functions for creating static options
RenderOptions<ProjectOption> _getStaticProjectOptions() {
  final options = [
    const ProjectOption(value: 'proj1', label: 'Mobile App', isActive: true),
    const ProjectOption(value: 'proj2', label: 'Web Platform', isActive: true),
    const ProjectOption(value: 'proj3', label: 'Desktop Client', isActive: false),
    const ProjectOption(value: 'proj4', label: 'API Gateway', isActive: true),
    const ProjectOption(value: 'proj5', label: 'Data Pipeline', isActive: false),
    const ProjectOption(value: 'proj6', label: 'Analytics Dashboard', isActive: true),
    const ProjectOption(value: 'proj7', label: 'Customer Portal', isActive: true),
  ];

  return RenderOptions<ProjectOption>(
    fetchSearchOptions: (final searchText) {
      // Simulate search filtering
      debugPrint('Searching for: $searchText');
    },
    isLoading: false,
    isError: false,
    options: options,
  );
}

RenderOptions<ApiProjectOption> _getLoadingApiOptions() {
  return const RenderOptions<ApiProjectOption>(
    fetchSearchOptions: _simulateApiSearch,
    isLoading: true,
    isError: false,
    options: [],
  );
}

void _simulateApiSearch(final String searchText) {
  debugPrint('API search for: $searchText');
}

RenderOptions<GroupedProjectOption> _getGroupedOptions() {
  final options = [
    const GroupedProjectOption(
      value: 'frontend',
      label: 'Frontend Projects',
      options: [
        GroupedProjectOption(value: 'react-app', label: 'React App'),
        GroupedProjectOption(value: 'vue-app', label: 'Vue App'),
        GroupedProjectOption(value: 'flutter-app', label: 'Flutter App'),
      ],
    ),
    const GroupedProjectOption(
      value: 'backend',
      label: 'Backend Projects',
      options: [
        GroupedProjectOption(value: 'node-api', label: 'Node.js API'),
        GroupedProjectOption(value: 'python-api', label: 'Python API'),
        GroupedProjectOption(value: 'go-service', label: 'Go Microservice'),
      ],
    ),
    const GroupedProjectOption(
      value: 'mobile',
      label: 'Mobile Projects',
      options: [
        GroupedProjectOption(value: 'ios-app', label: 'iOS App'),
        GroupedProjectOption(value: 'android-app', label: 'Android App'),
        GroupedProjectOption(value: 'react-native', label: 'React Native'),
      ],
    ),
  ];

  return RenderOptions<GroupedProjectOption>(
    fetchSearchOptions: (final searchText) => debugPrint('Group search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

RenderOptions<UserOption> _getUserOptions() {
  final options = [
    const UserOption(value: 'user1', name: 'Alice Johnson', email: 'alice@company.com', isOnline: true),
    const UserOption(value: 'user2', name: 'Bob Smith', email: 'bob@company.com', isOnline: false),
    const UserOption(value: 'user3', name: 'Carol Davis', email: 'carol@company.com', isOnline: true),
    const UserOption(value: 'user4', name: 'David Wilson', email: 'david@company.com', isOnline: true),
    const UserOption(value: 'user5', name: 'Eva Brown', email: 'eva@company.com', isOnline: false),
  ];

  return RenderOptions<UserOption>(
    fetchSearchOptions: (final searchText) => debugPrint('User search: $searchText'),
    isLoading: false,
    isError: false,
    options: options,
  );
}

// Option classes for UIBook examples
class ProjectOption implements SelectorOption {
  const ProjectOption({required this.value, required this.label, this.isActive = true});

  @override
  final String value;

  @override
  final String label;

  final bool isActive;

  @override
  bool get isDisabled => !isActive;

  @override
  List<SelectorOption>? get options => null;

  @override
  bool operator ==(final Object other) => identical(this, other) || other is ProjectOption && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class ApiProjectOption implements SelectorOption {
  const ApiProjectOption({required this.value, required this.label});

  @override
  final String value;

  @override
  final String label;

  @override
  bool get isDisabled => false;

  @override
  List<SelectorOption>? get options => null;

  @override
  bool operator ==(final Object other) => identical(this, other) || other is ApiProjectOption && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class GroupedProjectOption implements SelectorOption {
  const GroupedProjectOption({required this.value, required this.label, this.options});

  @override
  final String value;

  @override
  final String label;

  @override
  final List<SelectorOption>? options;

  @override
  bool get isDisabled => false;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) || other is GroupedProjectOption && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class UserOption implements SelectorOption {
  const UserOption({required this.value, required this.name, required this.email, this.isOnline = false});

  @override
  final String value;

  final String name;
  final String email;
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

import 'package:becomponent/src/widgets/selector/be_selector_combobox.dart';
import 'package:becomponent/src/widgets/selector/selector_hooks.dart';
import 'package:becore/hooks.dart';
import 'package:flutter/material.dart';

/// Example usage and demo of BeSelectorCombobox
class SelectorExamples extends HookWidget {
  const SelectorExamples({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selector Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSingleSelectExample(),
            const SizedBox(height: 32),
            _buildMultiSelectExample(),
            const SizedBox(height: 32),
            _buildApiDrivenExample(),
            const SizedBox(height: 32),
            _buildGroupedOptionsExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleSelectExample() {
    final selectedOption = useState<ProjectOption?>(null);
    final staticOptions = useStaticOptions(_getProjectOptions());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Single Select Example',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        BeSelectorCombobox<ProjectOption>(
          title: 'Select Project',
          description: 'Choose a single project from the list',
          placeholder: 'Search projects...',
          selected: selectedOption.value,
          options: staticOptions,
          onChange: (final selected) => selectedOption.value = selected as ProjectOption?,
          renderIcon:
              (final option) =>
                  Icon(Icons.folder, size: 20, color: option.isActive ? Colors.green : Colors.grey),
        ),
        if (selectedOption.value != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('Selected: ${selectedOption.value!.label}'),
          ),
      ],
    );
  }

  Widget _buildMultiSelectExample() {
    final selectedOptions = useState<List<ProjectOption>>([]);
    final staticOptions = useStaticOptions(_getProjectOptions());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Multi Select Example',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        BeSelectorCombobox<ProjectOption>(
          title: 'Select Multiple Projects',
          description: 'Choose multiple projects (max 3 tags shown)',
          placeholder: 'Search and select projects...',
          isMultiSelect: true,
          maxTags: 3,
          selected: selectedOptions.value,
          options: staticOptions,
          onChange: (final selected) => selectedOptions.value = selected as List<ProjectOption>,
        ),
        if (selectedOptions.value.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('Selected ${selectedOptions.value.length} projects'),
          ),
      ],
    );
  }

  Widget _buildApiDrivenExample() {
    final selectedOption = useState<ApiProjectOption?>(null);

    // Simulated API hook
    final apiOptions = useSelectorOptions<ApiProjectOption>(_simulateApiCall);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'API-Driven Example',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        BeSelectorCombobox<ApiProjectOption>(
          title: 'Search Remote Projects',
          description: 'Projects loaded from API with debounced search',
          placeholder: 'Type to search remote projects...',
          selected: selectedOption.value,
          options: apiOptions,
          onChange: (final selected) => selectedOption.value = selected as ApiProjectOption?,
          searchDebounceTime: const Duration(milliseconds: 500),
        ),
      ],
    );
  }

  Widget _buildGroupedOptionsExample() {
    final selectedOption = useState<GroupedProjectOption?>(null);
    final groupedOptions = useStaticOptions(_getGroupedOptions());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Grouped Options Example',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        BeSelectorCombobox<GroupedProjectOption>(
          title: 'Select from Groups',
          description: 'Options organized by categories',
          placeholder: 'Search across all groups...',
          selected: selectedOption.value,
          options: groupedOptions,
          onChange: (final selected) => selectedOption.value = selected as GroupedProjectOption?,
        ),
      ],
    );
  }

  // Sample data and API simulation
  List<ProjectOption> _getProjectOptions() {
    return [
      const ProjectOption(value: 'proj1', label: 'Mobile App', isActive: true),
      const ProjectOption(value: 'proj2', label: 'Web Platform', isActive: true),
      const ProjectOption(value: 'proj3', label: 'Desktop Client', isActive: false),
      const ProjectOption(value: 'proj4', label: 'API Gateway', isActive: true),
      const ProjectOption(value: 'proj5', label: 'Data Pipeline', isActive: false),
    ];
  }

  Future<List<ApiProjectOption>> _simulateApiCall(final String searchText) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 800));

    final allProjects = [
      const ApiProjectOption(value: 'api1', label: 'Remote Project Alpha'),
      const ApiProjectOption(value: 'api2', label: 'Remote Project Beta'),
      const ApiProjectOption(value: 'api3', label: 'Remote Project Gamma'),
      const ApiProjectOption(value: 'api4', label: 'Remote Project Delta'),
    ];

    if (searchText.isEmpty) return allProjects;

    return allProjects
        .where((final p) => p.label.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  List<GroupedProjectOption> _getGroupedOptions() {
    return [
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
    ];
  }
}

// Example option classes
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
  bool operator ==(final Object other) =>
      identical(this, other) || other is ProjectOption && value == other.value;

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
  bool operator ==(final Object other) =>
      identical(this, other) || other is ApiProjectOption && value == other.value;

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

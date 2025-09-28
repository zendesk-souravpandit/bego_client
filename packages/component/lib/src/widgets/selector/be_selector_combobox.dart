import 'package:becore/hooks.dart';
import 'package:beui/beui.dart';
import 'package:flutter/material.dart';

/// Base interface for selector options (equivalent to SelectorOption in React)
abstract class SelectorOption {
  String get value;
  String get label;
  bool get isDisabled => false;
  List<SelectorOption>? get options => null; // For grouped options
}

/// Simple implementation of SelectorOption
class SimpleSelectorOption implements SelectorOption {
  const SimpleSelectorOption({
    required this.value,
    required this.label,
    this.isDisabled = false,
    this.options,
  });

  @override
  final String value;

  @override
  final String label;

  @override
  final bool isDisabled;

  @override
  final List<SelectorOption>? options;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is SimpleSelectorOption && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

/// Render options interface (equivalent to RenderOptions<T> in React)
class RenderOptions<T extends SelectorOption> {
  const RenderOptions({
    required this.fetchSearchOptions,
    required this.isLoading,
    required this.isError,
    required this.options,
  });

  final void Function(String searchText) fetchSearchOptions;
  final bool isLoading;
  final bool isError;
  final List<T> options;
}

/// Field message for validation
class FieldMessage {
  const FieldMessage({required this.type, required this.content});

  final ValidationType type;
  final String content;
}

enum ValidationType { error, warning, success }

/// Flutter equivalent of React SelectorCombobox - A sophisticated dropdown/combobox
class BeSelectorCombobox<T extends SelectorOption> extends HookWidget {
  const BeSelectorCombobox({
    super.key,
    this.title,
    this.description,
    this.message,
    this.selected,
    this.isCompact = false,
    this.isSearchable = true,
    this.isAutocomplete = true,
    this.isMultiSelect = false,
    this.isDisabled = false,
    this.placeholder = '',
    this.searchDebounceTime = const Duration(milliseconds: 700),
    this.maxTags,
    this.renderOption,
    this.renderIcon,
    this.startIcon,
    this.onChange,
    required this.options,
  });

  final String? title;
  final String? description;
  final FieldMessage? message;
  final dynamic selected; // T or List<T>
  final bool isCompact;
  final bool isSearchable;
  final bool isAutocomplete;
  final bool isMultiSelect;
  final bool isDisabled;
  final String placeholder;
  final Duration searchDebounceTime;
  final int? maxTags;
  final Widget Function(T option)? renderOption;
  final Widget Function(T option)? renderIcon;
  final Widget? startIcon;
  final void Function(dynamic selected)? onChange; // T or List<T>
  final RenderOptions<T> options;

  @override
  Widget build(final BuildContext context) {
    final theme = BeTheme.of(context);
    final searchController = useTextEditingController();
    final searchValue = useState('');
    final focusNode = useFocusNode();

    // State management
    final multiSelectedOptions = useState<List<T>>(
      isMultiSelect && selected is List<T> ? selected as List<T> : <T>[],
    );
    final singleSelectedOption = useState<T?>(
      !isMultiSelect && selected is T ? selected as T : null,
    );

    // Debounced search
    final debouncedSearchValue = useDebounce(searchValue.value, searchDebounceTime);

    // Handle search
    useEffect(() {
      if (debouncedSearchValue != searchValue.value) return null;
      options.fetchSearchOptions(debouncedSearchValue);
      return null;
    }, [debouncedSearchValue]);

    // Initialize selected values
    useEffect(() {
      if (isMultiSelect && selected is List<T>) {
        multiSelectedOptions.value = selected as List<T>;
      } else if (!isMultiSelect && selected is T) {
        singleSelectedOption.value = selected as T;
        searchController.text = (selected as T).label;
      }
      return null;
    }, [selected]);

    void handleSelection(final T option) {
      if (isMultiSelect) {
        final currentSelected = List<T>.from(multiSelectedOptions.value);
        if (currentSelected.contains(option)) {
          currentSelected.remove(option);
        } else {
          currentSelected.add(option);
        }
        multiSelectedOptions.value = currentSelected;
        onChange?.call(currentSelected);
      } else {
        singleSelectedOption.value = option;
        searchController.text = option.label;
        searchValue.value = option.label;
        onChange?.call(option);
      }
    }

    void handleSearchChange(final String value) {
      searchValue.value = value;
    }

    Widget buildSelectedTags() {
      if (!isMultiSelect || multiSelectedOptions.value.isEmpty) {
        return const SizedBox.shrink();
      }

      final selectedList = multiSelectedOptions.value;
      final displayedTags =
          maxTags != null && selectedList.length > maxTags!
              ? selectedList.take(maxTags!).toList()
              : selectedList;

      return Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          ...displayedTags.map(
            (final option) => Chip(
              label: BeText.labelSmall(option.label),
              onDeleted: () {
                final newSelected = List<T>.from(multiSelectedOptions.value);
                newSelected.remove(option);
                multiSelectedOptions.value = newSelected;
                onChange?.call(newSelected);
              },
              backgroundColor: theme.colors.primaryContainer,
              deleteIcon: Icon(Icons.close, size: 16, color: theme.colors.onPrimaryContainer),
            ),
          ),
          if (maxTags != null && selectedList.length > maxTags!)
            Chip(
              label: BeText.labelSmall('+${selectedList.length - maxTags!} more'),
              backgroundColor: theme.colors.surfaceVariant,
            ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[BeText.labelLarge(title!), const SizedBox(height: 4)],
        if (description != null) ...[
          BeText.bodySmall(description!, color: theme.colors.onSurface.withOpacity(0.7)),
          const SizedBox(height: 8),
        ],

        // Selected tags for multi-select
        buildSelectedTags(),
        if (isMultiSelect && multiSelectedOptions.value.isNotEmpty) const SizedBox(height: 8),

        // Main input field - Use DropdownMenu for single select, custom for multi-select
        if (isMultiSelect)
          _buildMultiSelectField(context, theme, searchController, focusNode, handleSearchChange)
        else
          _buildSingleSelectDropdown(context, theme, singleSelectedOption.value, handleSelection),

        // Validation message
        if (message != null) ...[
          const SizedBox(height: 4),
          BeText.bodySmall(message!.content, color: _getValidationColor(message!.type, theme)),
        ],
      ],
    );
  }

  Widget _buildSingleSelectDropdown(
    final BuildContext context,
    final BeThemeData theme,
    final T? selectedOption,
    final void Function(T option) onSelect,
  ) {
    final dropdownOptions =
        options.options
            .where((final option) => option.options == null || option.options!.isEmpty)
            .toList();

    return DropdownMenu<T>(
      controller: TextEditingController(text: selectedOption?.label ?? ''),
      enableFilter: isSearchable,
      enableSearch: isSearchable,
      requestFocusOnTap: true,
      hintText: placeholder,
      width: double.infinity,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colors.primary, width: 2),
        ),
      ),
      onSelected: (final T? value) {
        if (value != null) onSelect(value);
      },
      dropdownMenuEntries:
          dropdownOptions.map<DropdownMenuEntry<T>>((final T option) {
            return DropdownMenuEntry<T>(
              value: option,
              label: option.label,
              enabled: !option.isDisabled,
              leadingIcon: renderIcon?.call(option),
              labelWidget:
                  renderOption?.call(option) ??
                  BeText.bodyMedium(
                    option.label,
                    color: option.isDisabled ? theme.colors.onSurface.withOpacity(0.4) : null,
                  ),
            );
          }).toList(),
    );
  }

  Widget _buildMultiSelectField(
    final BuildContext context,
    final BeThemeData theme,
    final TextEditingController controller,
    final FocusNode focusNode,
    final void Function(String) onSearchChange,
  ) {
    return Column(
      children: [
        BeInput.outlined(
          controller: controller,
          focusNode: focusNode,
          enabled: !isDisabled,
          hintText: placeholder,
          prefixIcon: startIcon,
          suffixIcon: IconButton(
            icon: Icon(Icons.keyboard_arrow_down, color: theme.colors.onSurface.withOpacity(0.6)),
            onPressed: () {
              _showMultiSelectOverlay(context, theme);
            },
          ),
          onChanged: isSearchable ? onSearchChange : null,
          readOnly: !isSearchable,
        ),
      ],
    );
  }

  void _showMultiSelectOverlay(final BuildContext context, final BeThemeData theme) {
    showDialog<void>(
      context: context,
      builder: (final BuildContext context) {
        return StatefulBuilder(
          builder: (final context, final setState) {
            return AlertDialog(
              title: BeText.titleMedium(title ?? 'Select Options'),
              content: SizedBox(
                width: double.maxFinite,
                height: 400,
                child: _buildMultiSelectList(theme, setState),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const BeText.labelLarge('Done'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildMultiSelectList(final BeThemeData theme, final StateSetter setState) {
    if (options.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (options.isError) {
      return Center(child: BeText.bodyMedium('Error loading options', color: theme.colors.error));
    }

    if (options.options.isEmpty) {
      return Center(
        child: BeText.bodyMedium(
          'No options available',
          color: theme.colors.onSurface.withOpacity(0.6),
        ),
      );
    }

    return ListView.builder(
      itemCount: options.options.length,
      itemBuilder: (final context, final index) {
        final option = options.options[index];
        return _buildMultiSelectTile(option, theme, setState);
      },
    );
  }

  Widget _buildMultiSelectTile(
    final T option,
    final BeThemeData theme,
    final StateSetter setState,
  ) {
    // Get current state from the widget's state management
    final currentSelected = isMultiSelect && selected is List<T> ? selected as List<T> : <T>[];
    final isSelected = currentSelected.contains(option);

    return CheckboxListTile(
      title: renderOption?.call(option) ?? BeText.bodyMedium(option.label),
      subtitle: renderIcon?.call(option),
      value: isSelected,
      enabled: !option.isDisabled,
      onChanged: (final bool? value) {
        setState(() {
          if (value == true) {
            if (!currentSelected.contains(option)) {
              final newList = [...currentSelected, option];
              onChange?.call(newList);
            }
          } else {
            final newList = currentSelected.where((final T item) => item != option).toList();
            onChange?.call(newList);
          }
        });
      },
    );
  }

  Color _getValidationColor(final ValidationType type, final BeThemeData theme) {
    switch (type) {
      case ValidationType.error:
        return theme.colors.error;
      case ValidationType.warning:
        return theme.colors.warning;
      case ValidationType.success:
        return theme.colors.success;
    }
  }
}

import 'dart:async';
import 'package:becomponent/src/widgets/selector/be_selector_combobox.dart';
import 'package:becore/hooks.dart' hide useDebounce;

/// Simple debounce hook
T useDebounce<T>(final T value, final Duration delay) {
  final debouncedValue = useState(value);

  useEffect(() {
    final timer = Timer(delay, () {
      debouncedValue.value = value;
    });

    return timer.cancel;
  }, [value]);

  return debouncedValue.value;
}

/// Simple query state
class AsyncState<T> {
  const AsyncState({this.data, this.isLoading = false, this.isError = false});
  final T? data;
  final bool isLoading;
  final bool isError;
}

/// Simple useQuery implementation
AsyncState<T> useQuery<T>(
  final String key,
  final Future<T> Function() queryFn, {
  final Duration? staleTime,
}) {
  final state = useState(AsyncState<T>(isLoading: true));

  useEffect(() {
    queryFn()
        .then((final result) {
          state.value = AsyncState(data: result);
        })
        .catchError((final error) {
          state.value = AsyncState<T>(isError: true);
        });
    return null;
  }, [key]);

  return state.value;
}

/// Hook for managing selector options with API integration
/// Equivalent to useJiraProjectOptions in React
RenderOptions<T> useSelectorOptions<T extends SelectorOption>(
  final Future<List<T>> Function(String searchText) fetchOptions, {
  final bool filterDisabled = false,
  final String initialSearch = '',
}) {
  final searchText = useState(initialSearch);
  final isLoading = useState(false);
  final isError = useState(false);
  final options = useState<List<T>>([]);

  Future<void> fetchSearchOptions(final String search) async {
    searchText.value = search;
    isLoading.value = true;
    isError.value = false;

    try {
      final results = await fetchOptions(search);
      final filteredResults =
          filterDisabled ? results.where((final option) => !option.isDisabled).toList() : results;

      options.value = filteredResults;
    } catch (error) {
      isError.value = true;
      options.value = [];
    } finally {
      isLoading.value = false;
    }
  }

  // Initial fetch
  useEffect(() {
    fetchSearchOptions(initialSearch);
    return null;
  }, []);

  return RenderOptions<T>(
    fetchSearchOptions: fetchSearchOptions,
    isLoading: isLoading.value,
    isError: isError.value,
    options: options.value,
  );
}

/// Simplified hook for static options (no API call)
RenderOptions<T> useStaticOptions<T extends SelectorOption>(
  final List<T> staticOptions, {
  final bool enableFiltering = true,
}) {
  final searchText = useState('');
  final filteredOptions = useState(staticOptions);

  void handleSearch(final String search) {
    searchText.value = search;

    if (!enableFiltering || search.isEmpty) {
      filteredOptions.value = staticOptions;
      return;
    }

    final filtered =
        staticOptions.where((final option) {
          return option.label.toLowerCase().contains(search.toLowerCase()) ||
              option.value.toLowerCase().contains(search.toLowerCase());
        }).toList();

    filteredOptions.value = filtered;
  }

  return RenderOptions<T>(
    fetchSearchOptions: handleSearch,
    isLoading: false,
    isError: false,
    options: filteredOptions.value,
  );
}

/// Hook specifically for query-based API options
/// Integrates with the useQuery hook from api_hooks.dart
RenderOptions<T> useQueryOptions<T extends SelectorOption>(
  final String baseKey,
  final Future<List<T>> Function(String searchText) fetchOptions, {
  final Duration staleTime = const Duration(minutes: 5),
}) {
  final searchText = useState('');
  final debouncedSearch = useDebounce(searchText.value, const Duration(milliseconds: 300));

  final queryResult = useQuery<List<T>>(
    '$baseKey-$debouncedSearch',
    () => fetchOptions(debouncedSearch),
    staleTime: staleTime,
  );

  void handleSearch(final String search) {
    searchText.value = search;
  }

  return RenderOptions<T>(
    fetchSearchOptions: handleSearch,
    isLoading: queryResult.isLoading,
    isError: queryResult.isError,
    options: queryResult.data ?? [],
  );
}

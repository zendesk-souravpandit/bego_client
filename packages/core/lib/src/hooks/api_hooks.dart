import 'dart:async';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Represents the state of an async operation (like React's query states)
class AsyncState<T> {
  const AsyncState({this.data, this.error, this.isLoading = false, this.isSuccess = false, this.isError = false});

  /// Create a loading state
  factory AsyncState.loading() {
    return const AsyncState(isLoading: true);
  }

  /// Create a success state
  factory AsyncState.success(final T data) {
    return AsyncState(data: data, isSuccess: true);
  }

  /// Create an error state
  factory AsyncState.failure(final Object error) {
    return AsyncState(error: error, isError: true);
  }

  final T? data;
  final Object? error;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;

  bool get hasData => data != null;
  bool get isEmpty => data == null && !isLoading && !isError;

  AsyncState<T> copyWith({
    final T? data,
    final Object? error,
    final bool? isLoading,
    final bool? isSuccess,
    final bool? isError,
  }) {
    return AsyncState<T>(
      data: data ?? this.data,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
    );
  }
}

/// Hook for making API calls with loading, success, and error states
/// Similar to React Query's useQuery
AsyncState<T> useQuery<T>(
  final String key,
  final Future<T> Function() queryFn, {
  final bool enabled = true,
  final Duration staleTime = const Duration(minutes: 5),
  final bool refetchOnMount = true,
}) {
  final state = useState(AsyncState<T>.loading());
  final lastFetchTime = useRef<DateTime?>(null);
  final isMountedRef = useRef<bool>(true);

  useEffect(() {
    isMountedRef.value = true;
    return () {
      isMountedRef.value = false;
    };
  }, []);

  Future<void> executeQuery() async {
    if (!enabled || !isMountedRef.value) return;

    // Check if data is still fresh
    final lastFetch = lastFetchTime.value;
    if (lastFetch != null && DateTime.now().difference(lastFetch) < staleTime && state.value.hasData) {
      return;
    }

    state.value = AsyncState<T>.loading();

    try {
      final result = await queryFn();
      if (isMountedRef.value) {
        state.value = AsyncState<T>.success(result);
        lastFetchTime.value = DateTime.now();
      }
    } catch (error) {
      if (isMountedRef.value) {
        state.value = AsyncState<T>.failure(error);
      }
    }
  }

  // Initial fetch
  useEffect(() {
    if (enabled && (refetchOnMount || !state.value.hasData)) {
      executeQuery();
    }
    return null;
  }, [key, enabled]);

  return state.value;
}

/// Hook for mutations (POST, PUT, DELETE operations)
/// Similar to React Query's useMutation
({AsyncState<T> state, Future<void> Function(TVariables variables) mutate, void Function() reset})
useMutation<T, TVariables>(
  final Future<T> Function(TVariables variables) mutationFn, {
  final void Function(T data)? onSuccess,
  final void Function(Object error)? onError,
  final void Function()? onSettled,
}) {
  final state = useState(AsyncState<T>());
  final isMountedRef = useRef<bool>(true);

  useEffect(() {
    isMountedRef.value = true;
    return () {
      isMountedRef.value = false;
    };
  }, []);

  Future<void> mutate(final TVariables variables) async {
    if (!isMountedRef.value) return;

    state.value = AsyncState<T>.loading();

    try {
      final result = await mutationFn(variables);
      if (isMountedRef.value) {
        state.value = AsyncState<T>.success(result);
        onSuccess?.call(result);
      }
    } catch (error) {
      if (isMountedRef.value) {
        state.value = AsyncState<T>.failure(error);
        onError?.call(error);
      }
    } finally {
      if (isMountedRef.value) {
        onSettled?.call();
      }
    }
  }

  void reset() {
    if (isMountedRef.value) {
      state.value = AsyncState<T>();
    }
  }

  return (state: state.value, mutate: mutate, reset: reset);
}

/// Hook for managing form state
/// Similar to React Hook Form's useForm
({
  Map<String, dynamic> values,
  Map<String, String?> errors,
  void Function(String field, dynamic value) setValue,
  void Function(String field, String? error) setError,
  void Function() reset,
  bool Function() validate,
  bool isValid,
})
useForm({final Map<String, dynamic>? initialValues, final Map<String, String? Function(dynamic)>? validators}) {
  final values = useState(initialValues ?? <String, dynamic>{});
  final errors = useState(<String, String?>{});

  void setValue(final String field, final dynamic value) {
    values.value = {...values.value, field: value};

    // Clear error when user starts typing
    if (errors.value.containsKey(field)) {
      errors.value = {...errors.value}..remove(field);
    }
  }

  void setError(final String field, final String? error) {
    if (error == null) {
      errors.value = {...errors.value}..remove(field);
    } else {
      errors.value = {...errors.value, field: error};
    }
  }

  void reset() {
    values.value = initialValues ?? <String, dynamic>{};
    errors.value = <String, String?>{};
  }

  bool validate() {
    if (validators == null) return true;

    final newErrors = <String, String?>{};
    for (final entry in validators.entries) {
      final field = entry.key;
      final validator = entry.value;
      final value = values.value[field];
      final error = validator(value);
      if (error != null) {
        newErrors[field] = error;
      }
    }

    errors.value = newErrors;
    return newErrors.isEmpty;
  }

  return (
    values: values.value,
    errors: errors.value,
    setValue: setValue,
    setError: setError,
    reset: reset,
    validate: validate,
    isValid: errors.value.isEmpty,
  );
}

/// Hook for debounced values (useful for search)
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

// Simple cache storage
final Map<String, String?> _globalCache = {};

/// Hook for simple in-memory caching (replace with actual storage as needed)
({String? value, void Function(String? value) setValue}) useCache(final String key, [final String? defaultValue]) {
  final state = useState(_globalCache[key] ?? defaultValue);

  void setValue(final String? value) {
    state.value = value;
    _globalCache[key] = value;
  }

  return (value: state.value, setValue: setValue);
}

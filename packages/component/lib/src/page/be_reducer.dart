import 'package:becomponent/page.dart';
import 'package:becore/hooks.dart';
import 'package:flutter/material.dart';

typedef BePageMiddleware<S extends BePageState, A extends BePageAction> =
    void Function(A action, S state, BuildContext context)?;

/// Reducer function type with enhanced signature
typedef BePageReducer<S extends BePageState, A extends BePageAction> =
    S Function(S state, A action, [BuildContext? context]);

/// Enhanced hooks with better error messages
(S, void Function(A)) usePageReducer<
  S extends BePageState,
  A extends BePageAction
>(BuildContext context, {String? debugLabel}) {
  final ctx = BePageContext.of<S, A>(context);
  if (ctx == null) {
    throw FlutterError('''useBePageStateReducer<$S, $A> must be used
    within a BePageProvider<$S, $A>.
${debugLabel != null ? 'Debug label: $debugLabel' : ''}''');
  }
  return (ctx.state, ctx.dispatch);
}

S usePageState<S extends BePageState, A extends BePageAction>(
  BuildContext context, {
  String? debugLabel,
}) {
  final ctx = BePageContext.of<S, A>(context);
  if (ctx == null) {
    throw FlutterError(
      '''useBePageState<$S, $A> must be used within a BePageProvider<$S, $A>.
${debugLabel != null ? 'Debug label: $debugLabel' : ''}''',
    );
  }
  return ctx.state;
}

void Function(A) usePageAction<S extends BePageState, A extends BePageAction>(
  BuildContext context, {
  String? debugLabel,
}) {
  final ctx = BePageContext.of<S, A>(context);
  if (ctx == null) {
    throw FlutterError(
      '''useBePageAction<$S, $A> must be used within a BePageProvider<$S, $A>.
${debugLabel != null ? 'Debug label: $debugLabel' : ''}''',
    );
  }
  return ctx.dispatch;
}

/// Usage in widgets
/// ```
/// class MyWidget extends StatelessWidget {
///   const MyWidget({super.key});
///
///   @override
///   Widget build(BuildContext context) {
///     final count = usePageStateSelector<CounterState, BePageAction, int>(
///       context,
///       (state) => state.count,
///     );
///
///     return Text('Count $count');
///   }
/// }
/// ```

// T useStateSelector<S extends BePageState, A extends BePageAction, T>(
//   BuildContext context,
//   T Function(S state) selector, {
//   bool Function(T previous, T next)? equalityFn,
// }) {
//   final state = usePageState<S, A>(context);

//   return useMemoized(() => selector(state), [state]);
// }
T useStateSelector<S extends BePageState, A extends BePageAction, T>(
  BuildContext context,
  T Function(S state) selector, {
  bool Function(T previous, T next)? equalityFn,
}) {
  // 1. Get the current state
  final state = usePageState<S, A>(context);

  // 2. Create a memoized selector
  final selectedValue = useMemoized(() => selector(state), [state]);

  // 3. Use useState to store the selected value
  final valueNotifier = useState(selectedValue);

  // 4. Update only when the selected value actually changes
  useEffect(() {
    final newValue = selector(state);
    if (equalityFn?.call(valueNotifier.value, newValue) ??
        valueNotifier.value == newValue) {
      return;
    }
    valueNotifier.value = newValue;
    return null;
  }, [state]);

  return valueNotifier.value;
}

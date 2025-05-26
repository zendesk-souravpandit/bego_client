import 'package:becomponent/page.dart';
import 'package:becore/hooks.dart';
import 'package:flutter/material.dart';

typedef BePageMiddleware<S, A extends BeStateAction> = void Function(A action, S state, BuildContext context)?;

/// Reducer function type with enhanced signature
typedef BePageReducer<S, A extends BeStateAction> = S Function(S state, A action, [BuildContext? context]);

/// Enhanced hooks with better error messages
(S, void Function(A)) usePageReducer<S, A extends BeStateAction>(
  final BuildContext context, {
  final String? debugLabel,
}) {
  final ctx = BeStateContext.of<S, A>(context);
  if (ctx == null) {
    throw FlutterError('''useBePageStateReducer<$S, $A> must be used
    within a BePageProvider<$S, $A>.
${debugLabel != null ? 'Debug label: $debugLabel' : ''}''');
  }
  return (ctx.state, ctx.dispatch);
}

S usePageState<S, A extends BeStateAction>(final BuildContext context, {final String? debugLabel}) {
  final ctx = BeStateContext.of<S, A>(context);
  if (ctx == null) {
    throw FlutterError('''useBePageState<$S, $A> must be used within a BePageProvider<$S, $A>.
${debugLabel != null ? 'Debug label: $debugLabel' : ''}''');
  }
  return ctx.state;
}

void Function(A) usePageAction<S, A extends BeStateAction>(final BuildContext context, {final String? debugLabel}) {
  final ctx = BeStateContext.of<S, A>(context);
  if (ctx == null) {
    throw FlutterError('''useBePageAction<$S, $A> must be used within a BePageProvider<$S, $A>.
${debugLabel != null ? 'Debug label: $debugLabel' : ''}''');
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

T useStateSelector<S, A extends BeStateAction, T>(final BuildContext context, final T Function(S state) selector) {
  final state = usePageState<S, A>(context);

  return useMemoized(() => selector(state), [state]);
}

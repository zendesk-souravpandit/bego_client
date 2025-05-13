import 'package:becomponent/page.dart';
import 'package:becore/hooks.dart';
import 'package:flutter/material.dart';

class BeStateContext<S extends BeState, A extends BeStateAction>
    extends InheritedWidget {
  const BeStateContext({
    super.key,
    required this.state,
    required this.dispatch,
    required super.child,
    this.debugLabel,
  });

  final S state;
  final void Function(A action) dispatch;
  final String? debugLabel;

  @override
  bool updateShouldNotify(covariant BeStateContext<S, A> oldWidget) {
    return oldWidget.state != state;
  }

  static BeStateContext<S, A>? of<S extends BeState, A extends BeStateAction>(
    BuildContext context, {
    bool listen = true,
  }) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<BeStateContext<S, A>>()
        : context.getInheritedWidgetOfExactType<BeStateContext<S, A>>();
  }
}

/// Enhanced Provider with middleware support
class BePageProvider<S extends BeState, A extends BeStateAction>
    extends HookWidget {
  const BePageProvider({
    super.key,
    required this.initialState,
    required this.reducer,
    required this.child,
    this.middleware,
    this.debugLabel,
  });

  final S initialState;
  final BePageReducer<S, A> reducer;
  final Widget child;
  final BePageMiddleware<S, A>? middleware;
  final String? debugLabel;

  @override
  Widget build(BuildContext context) {
    final stateAndDispatch = useReducer<S, A>(
      (state, action) {
        middleware?.call(action, state, context);
        final newState = reducer(state, action, context);

        if (debugLabel != null) {
          debugPrint('[$debugLabel] Action: ${action.runtimeType}');
        }
        return newState;
      },
      initialState: initialState,
      initialAction: SetStateAction<S>(initialState) as A,
    );

    return BeStateContext<S, A>(
      state: stateAndDispatch.state,
      dispatch: stateAndDispatch.dispatch,
      debugLabel: debugLabel,
      child: child,
    );
  }
}

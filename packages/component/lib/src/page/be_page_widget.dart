import 'package:becomponent/src/page/be_page_action.dart';
import 'package:becomponent/src/page/be_page_state.dart';
import 'package:becomponent/src/page/be_reducer.dart';
import 'package:becore/hooks.dart';
import 'package:flutter/material.dart';

class BePageContext<S extends BePageState, A extends BePageAction>
    extends InheritedWidget {
  const BePageContext({
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
  bool updateShouldNotify(covariant BePageContext<S, A> oldWidget) {
    final shouldUpdate = oldWidget.state != state;
    if (debugLabel != null && shouldUpdate) {
      debugPrint('[$debugLabel] State updated');
    }
    return shouldUpdate;
  }

  static BePageContext<S, A>? of<S extends BePageState, A extends BePageAction>(
    BuildContext context, {
    bool listen = true,
  }) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<BePageContext<S, A>>()
        : context.getInheritedWidgetOfExactType<BePageContext<S, A>>();
  }
}

/// Enhanced Provider with middleware support
class BePageProvider<S extends BePageState, A extends BePageAction>
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

    return BePageContext<S, A>(
      state: stateAndDispatch.state,
      dispatch: stateAndDispatch.dispatch,
      debugLabel: debugLabel,
      child: child,
    );
  }
}

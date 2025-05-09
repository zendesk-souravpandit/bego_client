import 'package:becomponent/page.dart';
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

import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

abstract class BeRouteDelegate {
  /// Subclasses must provide the complete list of routes.
  List<GetPage<dynamic>> get routes;

  /// Optional navigator observers.
  List<NavigatorObserver> get navigatorObservers => [];

  /// Pick pages for the root navigator based on a single RouteDecoder.
  /// Default implementation: returns all pages from the current branch that participate in root navigator.
  Iterable<GetPage<dynamic>> pickPagesForRootNavigator(final RouteDecoder decoder);

  /// Builds the GetDelegate with configured routes, observers, and filtering.
  GetDelegate createDelegate();
}

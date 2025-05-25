// import 'package:becomponent/app.dart' show AppStateProvider;
// import 'package:beui/layout.dart';
import 'package:flutter/material.dart';

// Use getx for build context extension
extension ContextExt on BuildContext {
  // /// The same of [MediaQuery.sizeOf(context)]
  Size get mediaQuerySize => MediaQuery.sizeOf(this);

  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  // BeBreakpoint get breakpoint => AppStateProvider.of(this).state.breakpoint;

  // /// Returns a specific value according to the screen size
  // /// if the device width is higher than or equal to 1200 return
  // /// [desktop] value. if the device width is higher than  or equal to 600
  // /// and less than 1200 return [tablet] value.
  // /// if the device width is less than 300  return [watch] value.
  // /// in other cases return [mobile] value.
  // T responsiveValue<T>({T? watch, T? mobile, T? tablet, T? desktop}) {
  //   assert(watch != null || mobile != null
  //|| tablet != null || desktop != null,
  //'You must provide at least one value');

  //   final deviceWidth = mediaQuerySize.width;
  //   //big screen width can display smaller sizes
  //   final strictValues =
  //       [
  //         if (deviceWidth >= 1200) desktop, //desktop is allowed
  //         if (deviceWidth >= 600) tablet, //tablet is allowed
  //         if (deviceWidth >= 300) mobile, //mobile is allowed
  //         watch, //watch is allowed
  //       ].whereType<T>();
  //   final looseValues = [watch, mobile, tablet, desktop].whereType<T>();
  //   return strictValues.firstOrNull ?? looseValues.first;
  // }
}

// extension IterableExt<T> on Iterable<T> {
//   /// The first element, or `null` if the iterable is empty.
//   T? get firstOrNull {
//     final iterator = this.iterator;
//     if (iterator.moveNext()) return iterator.current;
//     return null;
//   }
// }

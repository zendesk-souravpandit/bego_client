import 'package:beui/src/widgets/common/no_splash_factory.dart';
import 'package:flutter/material.dart';

const emptyWidget = SizedBox.shrink();

const ignoreSplash = NoSplashFactory();

//
const buttonAnimationDuration = Duration(milliseconds: 100);
const buttonAnimationCurve = Curves.fastOutSlowIn;

typedef ContentWrapperBuilder = Widget Function(BuildContext context, Widget child);

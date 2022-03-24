import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> frameNavigatorKey = GlobalKey<NavigatorState>();

BuildContext getMainContext() => mainNavigatorKey.currentContext!;
BuildContext getFrameContext() => frameNavigatorKey.currentContext!;


import 'package:flutter/cupertino.dart';
import 'package:flutter_web/constants/controllers.dart';
import 'package:flutter_web/routing/routeConfig.dart';
import 'package:flutter_web/routing/router.dart';

Navigator localNavigator() => Navigator(
  key: navigationController.navigationKey,
  onGenerateRoute: generateRoute,
  initialRoute: RouteConfig.home,
);

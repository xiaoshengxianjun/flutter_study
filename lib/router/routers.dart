import 'package:flutter/material.dart';

import '../views/myHome.dart';
import '../views/user/login.dart';
import '../views/user/regist.dart';
import '../views/tabBar.dart';

final routes = {
  '/': (context) => MyHomePage(),
  '/login': (context, {arguments}) => LoginPage(arguments:arguments),
  '/regist': (context) => RegistPage(),
  '/tabBar': (context) => TabBarPage(),
};

// 固定写法，命名路由可以传参写法
// ignore: missing_return, top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};

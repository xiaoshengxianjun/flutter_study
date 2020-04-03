import 'package:flutter/material.dart';

import '../wedgets/myHome.dart';
import '../wedgets/user/login.dart';
import '../wedgets/user/regist.dart';
import '../wedgets/bottomNavBar.dart';
import '../wedgets/routerDeme/page1.dart';
import '../wedgets/routerDeme/page2.dart';
import '../wedgets/routerDeme/page3.dart';

final routes = {
//  '/': (context) => MyHomePage(),
  '/login': (context, {arguments}) => LoginPage(arguments:arguments),
  '/regist': (context) => RegistPage(),
  '/bottomNavBar': (context) => BottomNavBarPage(),
  '/page1': (context) => PageOne(),
  '/page2': (context) => PageTwo(),
  '/page3': (context) => PageThree(),
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

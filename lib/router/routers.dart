import 'package:flutter/material.dart';

import '../wedgets/myHome.dart';
import '../wedgets/user/login.dart';
import '../wedgets/user/regist.dart';
import '../wedgets/bottomNavBar.dart';
import '../wedgets/routerDeme/page1.dart';
import '../wedgets/routerDeme/page2.dart';
import '../wedgets/routerDeme/page3.dart';
import '../wedgets/routerDeme/page4.dart';

final routes = {
//  '/': (context) => MyHomePage(),
  '/login': (context, {arguments}) => LoginPage(arguments: arguments),
  '/regist': (context) => RegistPage(),
  '/bottomNavBar': (context) => BottomNavBarPage(),
  '/page1': (context) => PageOne(),
  '/page2': (context) => PageTwo(),
  '/page3': (context) => PageThree(),
  '/page4': (context) => PageFour(),
};

// 固定写法，命名路由可以传参写法
//// ignore: top_level_function_literal_block
//var onGenerateRoute = (RouteSettings settings) {
//  final String name = settings.name;
//  final Function pageContentBuilder = routes[name];
//  if (pageContentBuilder != null) {
//    if (settings.arguments != null) {
//      final Route route = MaterialPageRoute(
//          builder: (context) =>
//              pageContentBuilder(context, arguments: settings.arguments));
//      return route;
//    } else {
//      final Route route =
//          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
//      return route;
//    }
//  }
//  return null;
//};

// 路由拦截器
// 想要让下面的方法执行，上面的routes中不能够声明注册对应的路由，只需要引入对应的页面文件就行
// 比如：引入了首页，但是没有声明，访问首页的时候就会执行下面的方法
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  String routeName = settings.name;
  print('当前访问路由名:$routeName');
  if (routeName == '/') {
    return MaterialPageRoute(builder: (context) {
      return LoginPage();
    });
  } else {
    return null;
  }
}

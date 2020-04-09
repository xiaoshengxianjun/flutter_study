import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 一个页面骨架容器类型组件，在这里可以设置导航栏，主要页面等内容
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("跳转第二页"),
              onPressed: () {
                Navigator.pushNamed(context, '/page2', arguments: 'hello');
              }),
          Divider(),
          Text("下面的按钮测试路由拦截器，访问了主页/，但是设置了路由拦截，会跳转到注册页"),
          RaisedButton(
              child: Text("主页"),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              })
        ],
      ),
    );
  }
}

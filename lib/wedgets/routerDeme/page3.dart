import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三个页面"),
      ),
      body: Column(
        children: <Widget>[
          Text("pop:直接返回上一页，并带上‘返回参数’"),
          RaisedButton(
              child: Text("回跳第二页"),
              onPressed: () {
                Navigator.pop(context, '返回参数');
              }),
          Divider(),
          Text("popUntil:直接返回到历史记录指定页，这里返回到第一页"),
          RaisedButton(
              child: Text("返回第一页"),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/page1'));
              }),
          Divider(),
          Text(
              "popAndPushNamed：退出当前页，并推入一个新的页面。这里退出当前页面page3，并显示一个新页面page4，从page4返回时会返回到page2"),
          RaisedButton(
              child: Text("跳转第四页"),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/page4');
              }),
          Divider(),
          Text(
              "pushReplacementNamed:将当前路由替换成指定的新路由，这里替换成page4，从page4返回会返回到page2"),
          RaisedButton(
              child: Text("替换成第四页"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/page4');
              }),
          Divider(),
          Text(
              "pushNamedAndRemoveUntil:将给定路由推送到Navigator，删除先前的路由，直到该函数的参数predicate返回true为止"),
          RaisedButton(
              child: Text("跳转第一页，并将第一页置为首页"),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/page1', (Route<dynamic> route) => false); // 这种方式是删除所有的路由，/page1页变成最底层的页面，这种方式可以用作返回首页
              }),
          RaisedButton(
              child: Text("跳转第四页，只保留page1页"),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/page4', ModalRoute.withName('/page1')); // 这种方式是删除所有的路由，显示/page4，并保留/page1记录，从page4返回会到page1
              }),
        ],
      ),
    );
  }
}

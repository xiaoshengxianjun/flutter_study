import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取路由参数，返回字符串
    var args=ModalRoute.of(context).settings.arguments;
    print(args);

    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Column(
        children: <Widget>[
          Text(args),
          RaisedButton(
              child: Text("跳转第三页"),
              onPressed: (){
                Navigator.pushNamed(context, '/page3');
              }
          )
        ],
      ),
    );
  }
}

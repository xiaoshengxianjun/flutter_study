import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取路由参数，返回字符串
    var args = ModalRoute.of(context).settings.arguments;
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
              onPressed: () async {
                // 获取下一页返回过来数据的方法，打开新页面后，便会等着返回，返回此页时就能拿到返回数据
                var res = await Navigator.pushNamed(context, '/page3');
                print(res);
              })
        ],
      ),
    );
  }
}

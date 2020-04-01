import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面标题名称"),
        centerTitle: true, // 设置标题居中，安卓设备上默认居左显示
        actions: <Widget>[
          // 这里可以设置标题栏右侧的图表按钮
          IconButton(
              icon: Icon(Icons.share),
              onPressed: (){
                  // 这里可以设置图标按钮的点击事件
              })
        ],
      ),
      body: Container(
        child: Text("首页"),
      ),
    );
  }
}

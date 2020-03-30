import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面标题名称"),
        centerTitle: true, // 设置标题居中，安卓设备上默认居左显示
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: (){
                  // 这里可以设置图标按钮的点击事件
              })
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
            BottomNavigationBarItem(icon: Icon(Icons.category),title: Text("分类")),
            BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("我的")),
          ]
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> with SingleTickerProviderStateMixin{

  int _selectIndex = 1; // bottomBabBar的激活项索引，默认是0

  @override
  void initState() {
    super.initState();
  }

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
          ],
          currentIndex: _selectIndex, // 当前哪一项被激活
          fixedColor: Colors.blue,
          onTap: (i){
            // tab点击事件，可以获取当前点击项的索引，借此更新组件状态
            setState(() {
              _selectIndex = i;
            });
          },
      ),
      // 特殊形状的bottomNavigationBar
//      bottomNavigationBar: BottomAppBar(
//        color: Colors.white,
//        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
//        child: Row(
//          children: <Widget>[
//            GestureDetector( // 通过此容器可以对内部组件进行手势识别，添加点击，双击，长按等方法
//              child: Container(
//                height: 40, // 限定容器高度，否则内容过高撑满整个页面，可调整此处高度查看效果
//                child: Flex(
//                  direction: Axis.vertical, // 垂直分布
//                  children: <Widget>[
//                    Expanded(child: Icon(Icons.home),),
//                    Expanded(child: Text("首页"),),
//                  ],
//                ),
//              ),
//              onTap: (){
//                print("点击了首页");
//              },
//            ),
//            SizedBox(), //中间位置空出
//            Container(
//              height: 40,
//              child: Flex(
//                direction: Axis.vertical,
//                children: <Widget>[
//                  Expanded(child: Icon(Icons.business),),
//                  Expanded(child: Text("学校"),),
//                ],
//              ),
//            )
//          ],
//          mainAxisAlignment: MainAxisAlignment.spaceAround, // 均分底部导航栏横向空间
//        ),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // 控制悬浮按钮的位置，默认右下角，当表现中间凹陷的bottomBar时，需要将此初设为centerDocked
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_alert),
          onPressed: (){
            print("点击浮动按钮");
          }
      ),
    );
  }
}

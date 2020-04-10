import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.network(
      "https://fuss10.elemecdn.com/d/e6/c4d93a3805b3ce3f323f7974e6f78jpeg.jpeg",
      width: 60.0,
      height: 60.0,
      fit: BoxFit.cover,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("本页展示布局"),
      ),
      body: Container(
        // 类似于html中的div
        // padding: EdgeInsets.all(15.0),
        // width: double.infinity, // 设置宽度尽可能撑满父容器的办法
        // height: 500.0,
        child: Column(
          // 纵向布局
          // mainAxisAlignment: MainAxisAlignment.center, // 竖向排列方式，start,center,end,spaceAround,spaceBetween,spaceEvenly(元素之间和距离父容器距离相等)
          // crossAxisAlignment: CrossAxisAlignment.center, // 横向排列方式，start,center,end,stretch
          children: <Widget>[
            Container(
                height: 100.0,
                color: Colors.lightBlueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // 横向排列方式，start,center,end,spaceAround,spaceBetween,spaceEvenly(元素之间和距离父容器距离相等)
                  // crossAxisAlignment: CrossAxisAlignment.center, // 纵向排列方式，start,center,end,stretch
                  children: <Widget>[
                    ClipOval(
                      child: avatar,
                    ),
                    ClipOval(
                      child: avatar,
                    ),
                  ],
                )),
            Container(
              color: Colors.black12,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 60.0,
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Text("菜单1"),
                        )
                      ),
                      Expanded(
                        child: Container(
                          height: 60.0,
                          alignment: Alignment.center,
                          color: Colors.blue,
                          child: Text("菜单2"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 60.0,
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Text("菜单3"),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            height: 60.0,
                            alignment: Alignment.center,
                            color: Colors.blue,
                            child: Text("菜单1"),
                          )
                      ),
                      Expanded(
                        child: Container(
                          height: 60.0,
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Text("菜单2"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 60.0,
                          alignment: Alignment.center,
                          color: Colors.blue,
                          child: Text("菜单3"),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            RaisedButton(
                child: Text("路由"),
                onPressed: () {
                  Navigator.pushNamed(context, '/page1');
                }),
          ],
        ),
      ),
    );
  }
}

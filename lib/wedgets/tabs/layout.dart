import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> with SingleTickerProviderStateMixin {
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
    Widget avatar = Image.network("https://fuss10.elemecdn.com/d/e6/c4d93a3805b3ce3f323f7974e6f78jpeg.jpeg",width: 60.0,height: 60.0,fit: BoxFit.cover,);
    return Scaffold(
      appBar: AppBar(
        title: Text("本页展示布局"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ClipOval(
              child: avatar,
            ),
            Container(
              color: Colors.red,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("第1行第1列第1行文本，",style: TextStyle(color: Colors.white),),
                      Text("第1行第1列第2行文本，",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("第1行第2列第1行文本，"),
                      Text("第1行第2列第2行文本，"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("第2行第1列第1行文本，"),
                      Text("第2行第1列第2行文本，"),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("第2行第2列第1行文本，",style: TextStyle(color: Colors.white),),
                      Text("第2行第2列第2行文本，",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

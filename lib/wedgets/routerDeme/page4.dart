import 'package:flutter/material.dart';

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第四个页面"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("返回"),
              onPressed: (){
                Navigator.pop(context);
              }
          )
        ],
      ),
    );
  }
}

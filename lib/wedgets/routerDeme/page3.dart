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
          RaisedButton(
              child: Text("回跳第二页"),
              onPressed: (){
                Navigator.pop(context, '返回参数');
              }
          )
        ],
      ),
    );
  }
}
